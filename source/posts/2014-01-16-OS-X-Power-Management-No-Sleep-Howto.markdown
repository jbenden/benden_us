---
category: prose
layout: prose
series: Benden.us
title: "OS X Power Management: No Sleep HOWTO"
date: 2014-01-16 13:25
comments: false
---

Beginning with Mountain Lion (10.6), Apple has introduced aggressive
power management technology to their operating system. This technology
helps the system to power-down even when applications are running and
consuming CPU, disk, and other resources. While this is normally an
acceptable behavior there are edge-cases in which this becomes a problem.

So how do we solve this problem? We use IOPMAssertion family of
functions to solve this problem ([Thread at StackOverflow.com][1].)

Example C source code may be found [here in QA1340](http://developer.apple.com/library/mac/#qa/qa1340/_index.html) in Apple's Developer documentation, under listing 2.

Example Python source code may be found below:

    #!/usr/bin/python2.7

    import ctypes
    import CoreFoundation
    import objc
    import subprocess
    import time

    def SetUpIOFramework():
      # load the IOKit library
      framework = ctypes.cdll.LoadLibrary(
        '/System/Library/Frameworks/IOKit.framework/IOKit')

      # declare parameters as described in IOPMLib.h
      framework.IOPMAssertionCreateWithName.argtypes = [
        ctypes.c_void_p,  # CFStringRef
        ctypes.c_uint32,  # IOPMAssertionLevel
        ctypes.c_void_p,  # CFStringRef
        ctypes.POINTER(ctypes.c_uint32)]  # IOPMAssertionID
      framework.IOPMAssertionRelease.argtypes = [
        ctypes.c_uint32]  # IOPMAssertionID
      return framework

    def StringToCFString(string):
      # we'll need to convert our strings before use
      return objc.pyobjc_id(
        CoreFoundation.CFStringCreateWithCString(None, string,
          CoreFoundation.kCFStringEncodingASCII).nsstring())

    def AssertionCreateWithName(framework, a_type,
                                a_level, a_reason):
      # this method will create an assertion using the IOKit library
      # several parameters
      a_id = ctypes.c_uint32(0)
      a_type = StringToCFString(a_type)
      a_reason = StringToCFString(a_reason)
      a_error = framework.IOPMAssertionCreateWithName(
        a_type, a_level, a_reason, ctypes.byref(a_id))

      # we get back a 0 or stderr, along with a unique c_uint
      # representing the assertion ID so we can release it later
      return a_error, a_id

    def AssertionRelease(framework, assertion_id):
      # releasing the assertion is easy, and also returns a 0 on
      # success, or stderr otherwise
      return framework.IOPMAssertionRelease(assertion_id)

    def main():
      # let's create a no idle assertion for 30 seconds
      no_idle = 'NoIdleSleepAssertion'
      reason = 'Test of Pythonic power assertions'

      # first, we'll need the IOKit framework
      framework = SetUpIOFramework()

      # next, create the assertion and save the ID!
      ret, a_id = AssertionCreateWithName(framework, no_idle, 255, reason)
      print '\n\nCreating power assertion: status %s, id %s\n\n' % (ret, a_id)

      # subprocess a call to pmset to verify the assertion worked
      subprocess.call(['pmset', '-g', 'assertions'])
      time.sleep(5)

      # finally, release the assertion of the ID we saved earlier
      AssertionRelease(framework, a_id)
      print '\n\nReleasing power assertion: id %s\n\n' % a_id

      # verify the assertion has been removed
      subprocess.call(['pmset', '-g', 'assertions'])

    if __name__ == '__main__':
      main()

> Tip: Use a wrapper Python script to call out to programs that do not
> support power management and cannot easily be made to support it. (A
> C wrapper program would be acceptable too. ;)

Information about calling native C/Objective-C functions from Python
are explained
[on StackOverflow.com](http://stackoverflow.com/questions/1490039/calling-objective-c-functions-from-python).

[1]: [What is the correct way to prevent sleep on OS X](http://stackoverflow.com/questions/8460033/what-is-the-correct-way-to-prevent-sleep-on-os-x)
