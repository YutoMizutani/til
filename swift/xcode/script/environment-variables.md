## Environment variables

> 1. `SRCROOT`
>
>> Directory path. Identifies the directory containing the target’s source files: contains the path to the project file that defines the target.
>
> `SOURCE_ROOT` is an undocumented alias to SRCROOT
>
> 2. `PROJECT_DIR`
> Identifies the directory containing the project (.xcodeproj)
> $(PROJECT_DIR)/build is used as the create the default value for:
> - Intermediate Build Files Path OBJROOT
> - Build Products Path SYMROOT
>
>> Typically these paths are not set per target, but are set per-project or per-user.
>
> 3. `PROJECT_FILE_PATH`
> Identifies the project itself.
> Equivalent to $(PROJECT_DIR)/$(PROJECT_NAME).xcodeproj
>
> Conceptually different (#1 is about the project which defines the target while #2 is about the project independently of any target), they are always pointing to the same location since you are, in essence, always building a target.
>
> References
> [Xcode 8.3 Build Settings reference](https://help.apple.com/xcode/mac/8.3/#/itcaec37c2a6)
> [Xcode Build System Guide](https://developer.apple.com/library/archive/documentation/DeveloperTools/Reference/XcodeBuildSettingRef/1-Build_Setting_Reference/build_setting_ref.html#//apple_ref/doc/uid/TP40003931-CH3-SW49) (Retired 2016-09-29)

[What the different between SRCROOT and PROJECT_DIR?](https://stackoverflow.com/a/43751741)
