# meta-mx6ullnand
OpenEmbedded/Yocto BSP NXP layer


# Dependencies

```
URI: git://git.yoctoproject.org/poky.git
branch: scarthgap
revision: HEAD

URI: git://git.openembedded.org/meta-openembedded.git
branch: scarthgap
revision: HEAD

URI: git://git.yoctoproject.org/meta-freescale.git
branch: scarthgap
revision: HEAD

URI: https://github.com/Freescale/meta-freescale-distro.git
branch: scarthgap
revision: HEAD

URI: https://github.com/Freescale/meta-freescale-3rdparty.git
branch: scarthgap
revision: HEAD

```


# Getting started

meta-mx6ullnand consist of multiple Git repositories and repo is the tool that makes it easier to work with those repositories as a whole. Create a local bin/ directory, download the repo tool to that directory, and allow the binary executable with the following commands:

```
$ mkdir -p ~/bin
$ curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
$ chmod a+x ~/bin/repo
$ export PATH=~/bin:$PATH
```


# Download the source

Create an empty directory that will hold the meta-mx6ullnand and Yocto source files and serve as the working directory. Enter the following commands to bring down the latest version of repo tool, including its most recent fixes. The URL specifies the manifest that refers various repositories used by meta-mx6ullnand, which are placed within the working directory. For now, a .repo folder is created to store the manifest and the metadata of the source repositories.


```
$ mkdir ~/workspace
$ cd ~/workspace
$ repo init -u https://github.com/liuming50/mx6ullnand-manifests -b scarthgap
```

Or you could choose to fetch integration.xml (It builds a experimental image based on the latest scarthgap branches of Yocto, which might not be stable.)

```
$ mkdir ~/workspace
$ cd ~/workspace
$ repo init -u https://github.com/liuming50/mx6ullnand-manifests -b scarthgap -m integration.xml
```


Enter the following command to pull down the source tree to your working directory. The repo sync operation might take time depending on your Internet download speed.

```
$ repo sync
```


# Build in docker (Recommended):

Firstly, make sure $USER in docker group:

```
$ sudo usermod -aG docker $USER
```

then start the docker builder:

```
$ cd ~/workspace
$ ./setup
# (Select "nxp meta-mx6ullnand")
$ bitbake core-image-minimal
```


# Or you can choose Build the source natively (Not recommended, Verified only on Ubuntu 22.04, 100G disk, 6 cores CPU, 8G Memory at least is mandatory, DO-NOT-USE Virual machines, that would be too slow)

Set up the environment:

Before running bitbake, please make sure you have installed all the system requirments, refer to: [Install Yocto system requirements](https://docs.yoctoproject.org/3.2.4/ref-manual/ref-system-requirements.html)


```
$ cd ~/workspace
$ . oe-init-build-env
$ bitbake core-image-minimal
```


The default DISTRO is fsl-framebuffer, you can build other distros by passing DISTRO variable to bitbake:

```
$ DISTRO=fslc-framebuffer bitbake core-image-minimal
```


Layer Maintainer: [Ming Liu](<mailto:liu.ming50@gmail.com>)
