## Cache Carthage

> Setup

(If not already added)

Add the Cache:Pull step after the Git Clone step
Add the Cache:Push step to the very end of the Workflow
If you use v1.0 or newer of the Cache steps and the latest Carthage step then that’s all you have to do.

Select the Cache:Push step and specify the following paths for caching (Cache paths input):
./Carthage -> ./Carthage/Cachefile
Make sure that you set bootstrap as the Carthage step’s Carthage command to run input/option, only that command can leverage the cache!
If your Carthage directory is not in the root of your repository then you should specify the path relative to the repository root, e.g. ./subdir/Carthage -> ./subdir/Carthage/Cachefile

That’s all. This specification (using the -> indicator) means that the ./Carthage directory should be cached, and that the cache should be updated only if the ./Carthage/Cachefile file changes.

```
Carthage command to run -> bootstrap
Additional options for `carthage` command -> --cache-builds
```

Example workflow

---
format_version: 1.3.1
default_step_lib_source: https://github.com/bitrise-io/bitrise-steplib.git
workflows:
  primary:
    steps:
    - activate-ssh-key@3.1.1:
        run_if: '{{getenv "SSH_RSA_PRIVATE_KEY" | ne ""}}'
    - git-clone@3.4.1: {}
    - cache-pull@0.9.1: {}
    - certificate-and-profile-installer@1.8.2: {}
    - carthage@3.0.3:
        inputs:
        - carthage_command: bootstrap
        - carthage_options: ''
    - xcode-test@1.18.1: {}
    - cache-push@0.9.3:
        inputs:
        - cache_paths: "./Carthage -> ./Carthage/Cachefile"
    - deploy-to-bitrise-io@1.2.6: {}
app:
  envs:
  - BITRISE_PROJECT_PATH: sample-apps-carthage.xcodeproj
  - BITRISE_SCHEME: sample-apps-carthage
For more information about the Bitrise Build Cache see the DevCenter 14.

[How to cache Carthage dependencies](https://discuss.bitrise.io/t/how-to-cache-carthage-dependencies/197)
