---
category: prose
layout: prose
series: Benden.us
title: "AVCapture: A Mac OS X Screen Recording Solution"
date: 2014-10-20 08:34
comments: false
---

AVCapture: A Mac OS X Screen Recording Solution
===============================================

I have implemented a new module for [FFmpeg](http://www.ffmpeg.org/) that enables Mac OS X
owners to record their entire screen, using the latest Apple provided
APIs. The performance is stellar.

Please see the
[change request](https://github.com/FFmpeg/FFmpeg/pull/75) for more
information and the necessary source code changes.

To use the avcapture module, simply run FFmpeg as follows:

    # ffmpeg -f avcapture -video_device_index 0 -i "" ~/Desktop/capture.mpeg

This will capture the first screen and store the contents in a MPEG
file container.

To see what available video device indexes are available, use the
following command:

    # ffmpeg -f avcapture -i "" -list_devices true

Please let me know if you have any suggestions, comments, or ideas to
[Joseph Benden](mailto:joe@benden.us).

Update #1
---------

There is an [experimental branch](https://github.com/jbenden/FFmpeg/tree/avcapture-audio) available that allows audio capture in
addition to screen capture. This works well with Soundflower to capture
the system audio.

Update #2
---------

There is another [experimental branch](https://github.com/jbenden/FFmpeg/tree/avfoundation) available that allows full functionality from the
existing avfoundation device driver. Note that it still experiences the
same problems that plagued *Update #1* with regards to audio capture. The
frame rate must be limited to 30 in order for the two be become in sync.
Additionally, for some unknown reason, this branch when compiled does not
honor command-line flags. So in testing, I had to hardcode video_screen_index 1 and audio_device_index 2 (My Soundflower 2ch device.).

Update #3
---------

The author of avfoundation is looking into the merge changes and working
on the bugs found. This is excellent news!

[See here](https://ffmpeg.org/pipermail/ffmpeg-devel/2014-October/164470.html) for the initial patch to make it all happen.
[See Here](https://ffmpeg.org/pipermail/ffmpeg-devel/2014-October/164526.html) for the latest patch that fixes an off-by-one error.
