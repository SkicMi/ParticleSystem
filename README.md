# YT Particle System

Minimal C++/raylib starter project for the YouTube series.

## Build

```bash
cmake -S . -B build
cmake --build build
```

raylib is fetched automatically by CMake through `FetchContent`.

## Recording workflow

OBS is configured with a `VS Code Only` scene, 1920x1080/30 fps recording,
and output in `media/screen`. The scene captures the VS Code window rather
than the whole desktop, so other windows stay out of the recording.

Use `record` to start OBS recording and `erecord` to stop it. Both commands
are available globally from the terminal and talk to OBS over its local
websocket.

## Resolve editing

See [`resolve/README.md`](resolve/README.md) and import
[`resolve/YT-Particle-Edit-Template.fcpxml`](resolve/YT-Particle-Edit-Template.fcpxml)
for the screen + facecam timeline preset.
