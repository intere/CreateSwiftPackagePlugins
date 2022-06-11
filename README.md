# CreateSwiftPackagePlugins

Working POC based on WWDC 2022's [Create Swift Package plugins](https://developer.apple.com/videos/play/wwdc2022/110401) session.

## First Example
- [My Recreation of the code](https://github.com/intere/swift-tools-support-core/pull/1) - Adding a plugin to `swift-tools-support-core` that generates a CONTRIBUTORS.txt file

## Second Example
Folders:
- IconLibrary
    - A swift package that has a library, an executable and a plugin that wraps the executable
    - The library includes the plugin (and therefore the executable as well) in to the build chain of the package


## Third Example

Folders:
- GenStringsPlugin
    - The plugin itself that does some localization file creation via "xcrun"
-  MyLibrary 
    - The Swift Package library that we use to test the Gen Strings Plugin.
