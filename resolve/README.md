# DaVinci Resolve edit preset

`YT-Particle-Edit-Template.fcpxml` is an importable 1920x1080 / 30 fps timeline
template with a screen-recording track and a facecam track. After importing it
into DaVinci Resolve, relink the two offline clips to files in `media/screen`
and `media/facecam`.

The facecam clip is intended to sit above the screen recording, so it can be
resized and positioned as a picture-in-picture layer. Resolve's normal Edit
page timeline lets you scrub through individual frames with the arrow keys and
the timeline playhead.

## Workflow

1. Record the VS Code screen with `record` / `erecord`.
2. Put the front-camera recording in `media/facecam`.
3. Import the FCPXML template into Resolve.
4. Relink the offline `SCREEN_RECORDING` and `FACECAM_RECORDING` clips.
5. Resize the facecam clip in the Inspector and export to `media/exports`.

