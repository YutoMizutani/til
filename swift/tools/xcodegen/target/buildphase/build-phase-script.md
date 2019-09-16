## Build phase scripts using XcodeGen

```yaml
targets
  debug:
    # Before `Compile Sources` phase
    preBuildScripts:
      - name: "Run Script"
        script: |
                # Type a script or drag a script file from your workspace to insert its path.
      - name: "Run Script from path"
        path: script.sh
    # After `Link Binary With Libraries` phase
    postBuildScripts:
      - name: "Run Script"
        script: |
                # Type a script or drag a script file from your workspace to insert its path.
      - name: "Run Script from path"
        path: script.sh
```

[XcodeGen/Sources/ProjectSpec/BuildScript.swift](https://github.com/yonaskolb/XcodeGen/blob/master/Sources/ProjectSpec/BuildScript.swift)
