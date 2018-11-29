## Library not loaded: @rpath/libswiftAppKit.dylib

Specific issue on macOS - Test target (Did not occurred on iOS and tvOS).

Add to *Runtime Search Path* in target,
`@executable_path/../Frameworks @loader_path/../Frameworks`

[MacOSX screensaver not loading due to Library not loaded: @rpath/libswiftAppKit.dylib](https://stackoverflow.com/questions/28960431/macosx-screensaver-not-loading-due-to-library-not-loaded-rpath-libswiftappkit)
