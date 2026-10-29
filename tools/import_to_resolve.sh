#!/usr/bin/env bash
set -euo pipefail

input_path="${1:?Usage: import_to_resolve.sh /path/to/recording}"
project_root="/home/danijel/Desktop/YT-ParticleSystem"
ingest_dir="$project_root/media/resolve_ingest"
mkdir -p "$ingest_dir"

base_name="$(basename "${input_path%.*}")"
output_path="$ingest_dir/${base_name}.mov"

echo "Preparing Resolve-compatible intermediate: $output_path"
ffmpeg -hide_banner -loglevel error -y -i "$input_path" \
  -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p \
  -c:a pcm_s16le "$output_path"

if ! command -v xdotool >/dev/null 2>&1; then
  echo "Intermediate is ready. Install xdotool to automate the Resolve import dialog."
  exit 0
fi

if ! pgrep -x resolve >/dev/null 2>&1; then
  nohup /opt/resolve/bin/resolve >/tmp/resolve-yt-particles.log 2>&1 &
  for _ in {1..30}; do
    sleep 1
    pgrep -x resolve >/dev/null 2>&1 && break
  done
fi

resolve_window="$(xdotool search --name 'DaVinci Resolve' 2>/dev/null | head -n 1 || true)"
if [[ -z "$resolve_window" ]]; then
  echo "Resolve nije otvoren ili se zatvorio tijekom pokretanja. Gotov intermediate: $output_path"
  exit 0
fi

xdotool windowactivate --sync "$resolve_window"
xdotool key --clearmodifiers ctrl+i
sleep 2
xdotool type --clearmodifiers --delay 1 "$output_path"
xdotool key Return
echo "Resolve import requested for $output_path"

