## Test for macOS

```yaml
app:
  envs:
  - opts:
      is_expand: false
    BITRISE_PROJECT_PATH: ElsevierKit.xcodeproj
  - opts:
      is_expand: false
    BITRISE_SCHEME_MACOS: ElsevierKit macOS

- xcode-test-mac:
    title: xcode-test-macos
    inputs:
    - project_path: "$BITRISE_PROJECT_PATH"
    - scheme: "$BITRISE_SCHEME_MACOS"
    - destination: platform=OS X,arch=x86_64
    - generate_code_coverage_files: 'yes'
```
