## Set locale on Ubuntu

Generate locale mannualy,

```
$ sudo su
# echo "LC_ALL=en_US.UTF-8" >> /etc/environment
# echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
# echo "LANG=en_US.UTF-8" > /etc/locale.conf
# locale-gen en_US.UTF-8
```

or install language-pack,

```
$ sudo su
# apt-get clean && apt-get update && apt-get install -y \
    locales \
    language-pack-fi  \
    language-pack-en && \
    export LANGUAGE=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    export LC_ALL=en_US.UTF-8 && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales
```

[/bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)](https://github.com/singularityware/singularity/issues/11)
