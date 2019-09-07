## Automatic signing group

```yaml
settingGroups:
  automatic_signing:
    CODE_SIGN_STYLE: Automatic
    DEVELOPMENT_TEAM: XXXXXXXXX

targets:
  debug:
    type: application
    platform: iOS
    settings:
      groups: [automatic_signing]
```
