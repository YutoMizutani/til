## Install on Ubuntu

## Install Docker CE
You can install Docker CE in different ways, depending on your needs:

- Most users set up Docker’s repositories and install from them, for ease of installation and upgrade tasks. This is the recommended approach.

- Some users download the DEB package and install it manually and manage upgrades completely manually. This is useful in situations such as installing Docker on air-gapped systems with no access to the internet.

- In testing and development environments, some users choose to use automated convenience scripts to install Docker.

### Install using the repository
Before you install Docker CE for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository.

#### SET UP THE REPOSITORY
1. Update the apt package index:

```
$ sudo apt-get update
```
2. Install packages to allow apt to use a repository over HTTPS:

```
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
```
3. Add Docker’s official GPG key:

```
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint.

```
$ sudo apt-key fingerprint 0EBFCD88

pub   4096R/0EBFCD88 2017-02-22
      Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid                  Docker Release (CE deb) <docker@docker.com>
sub   4096R/F273FCD8 2017-02-22
```
4. Use the following command to set up the stable repository. You always need the stable repository, even if you want to install builds from the edge or test repositories as well. To add the edge or test repository, add the word edge or test (or both) after the word stable in the commands below.

  Note: The lsb_release -cs sub-command below returns the name of your Ubuntu distribution, such as xenial. Sometimes, in a distribution like Linux Mint, you might need to change $(lsb_release -cs) to your parent Ubuntu distribution. For example, if you are using Linux Mint Rafaela, you could use trusty.

x86_64 / amd64
```
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```
  Note: Starting with Docker 17.06, stable releases are also pushed to the edge and test repositories.

Learn about stable and edge channels.


#### INSTALL DOCKER CE
1. Update the apt package index.

```
$ sudo apt-get update
```
2. Install the latest version of Docker CE, or go to the next step to install a specific version:

```
$ sudo apt-get install docker-ce
```
  Got multiple Docker repositories?

  If you have multiple Docker repositories enabled, installing or updating without specifying a version in the apt-get install or apt-get update command always installs the highest possible version, which may not be appropriate for your stability needs.

3. To install a specific version of Docker CE, list the available versions in the repo, then select and install:

a. List the versions available in your repo:

```
$ apt-cache madison docker-ce

docker-ce | 18.03.0~ce-0~ubuntu | https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages
```
b. Install a specific version by its fully qualified package name, which is package name (docker-ce) “=” version string (2nd column), for example, docker-ce=18.03.0~ce-0~ubuntu.

// 18.03.1~ce-0~ubuntu

```
$ sudo apt-get install docker-ce=<VERSION>
```
The Docker daemon starts automatically.

4. Verify that Docker CE is installed correctly by running the hello-world image.

```
$ sudo docker run hello-world
```
This command downloads a test image and runs it in a container. When the container runs, it prints an informational message and exits.

Docker CE is installed and running. The docker group is created but no users are added to it. You need to use sudo to run Docker commands. Continue to Linux postinstall to allow non-privileged users to run Docker commands and for other optional configuration steps.

#### UPGRADE DOCKER CE
To upgrade Docker CE, first run `sudo apt-get update`, then follow the installation instructions, choosing the new version you want to install.

[Docker Docs](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository)
[](https://qiita.com/ketch/items/69c7d542d8ab6395cfb0)
