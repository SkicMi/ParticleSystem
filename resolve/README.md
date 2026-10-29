# DaVinci Resolve edit preset

`YT-Particle-Edit-Template.fcpxml` is an importable 1920x1080 / 30 fps timeline
template with three layers: the VS Code screen, the facecam overlay, and a
dedicated animation/inserts layer. After importing it into DaVinci Resolve,
relink the offline clips to files in `media/screen`, `media/facecam`, and
`media/animations`.

The facecam clip is intended to sit above the screen recording, so it can be
resized and positioned as a picture-in-picture layer. Resolve's normal Edit
page timeline lets you scrub through individual frames with the arrow keys and
the timeline playhead.

## Workflow

1. Record the VS Code screen with `record` / `erecord`.
2. Put the front-camera recording in `media/facecam`.
3. Import the FCPXML template into Resolve.
4. Relink `SCREEN_RECORDING`, `FACECAM_RECORDING`, and `ANIMATION_INSERT`.
5. Keep the facecam in the corner for normal programming, then keyframe its
   Transform > Zoom/Position to make it fullscreen for explanations or intros.
6. Place finished transparent animations on the animation layer when needed.
7. Export to `media/exports`.

## Recommended episode layout

- V1: code editor / VS Code recording
- V2: facecam, normally a small corner overlay
- V3: finished animations, callouts, and transitions

This is more flexible than baking the camera into OBS: you can change the
facecam size, cut to fullscreen, or remove a camera section without recording
the coding session again.
