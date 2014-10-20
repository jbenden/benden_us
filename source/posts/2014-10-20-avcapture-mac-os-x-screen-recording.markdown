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
