# Installing the **Gopherbot** Software Archive

> NOTE: The Gopherbot binary is currently Linux-only. Earlier versions ran on MacOS - and even Windows - but these platforms have fallen out of use. Patches are welcome if you'd like to maintain one of these platforms, and I'd be happy to provide advice and assistance. If you have a Mac with Docker installed, you can still use the `gb-*` bash scripts for setting up and running a container-based robot on your Mac.

If you want to run **Gopherbot** directly on a Linux host / VM, you can [download a release](https://github.com/lnxjedi/gopherbot/releases).

## Building from Source
**Requirements:**
* A recent (1.14+) version of Go
* Standard build utilities; make, tar, gzip
* A Linux system to build on that matches your target deployment host

**Steps:**
1. Clone the **Gopherbot** repository: `git clone https://github.com/lnxjedi/gopherbot.git`
1. `make dist` in the repository root

## Installing the Archive
1. Extract the downloaded or built archive in `/opt` to create `/opt/gopherbot`, e.g.:
```shell
[root]# cd /opt
[opt]# tar xzf /path/to/gopherbot/gopherbot-linux-amd64.tar.gz
```
2. (Optional) Also as root, make the `gopherbot` binary **setuid nobody** (see [below](#privilege-separation)):
```shell
[opt]# cd gopherbot
[gopherbot]# ./setuid-nobody.sh
```

## Creating Symlinks to Executables

The `gb-install-links` script will create a set of symlinks to executables. For instance, if `$HOME/bin` is in your `$PATH`, you could:
```shell
$ /opt/gopherbot/gb-install-links $HOME/bin
```

## Archive Contents

**Files**
* `gopherbot` - the main executable, both a *daemon* and a *command-line interface*
* `gb-*` - a developer utility script for retrieving a robot for local development

**Directories**
* `connectors/` - loadable modules for protocol connectors, e.g. *slack*
* `goplugins/` - loadable modules for non-default *Go* plugins
* `brains/` - lodable modules for non-default brain implementations
* `conf/` - the default configuration, overridden by individual robots
* `lib/` - API libraries for `bash`, `python` and `ruby`
* `plugins/` - external script plugins
* `plugins/samples` - sample plugins that show API usage but aren't otherwise very useful
* `tasks/` - a collection of pipeline task scripts
* `jobs/` - a collection of jobs for robot management (backup/restore) and CI/CD
* `helpers/` - helper scripts not directly called by the robot
* `resources/` - miscellaneous useful bits for a running robot, also the *Containerfiles* used for publishing the stock containers
* `doc/` - deprecated; contents moved to [gopherbot-doc](https://github.com/lnxjedi/gopherbot-doc)
* `robot.skel/` - the initial configuration for new robots, analogous to the contents of `/etc/skel`
* `licenses/` - licenses for other packages used by **Gopherbot**, as required

# Privilege Separation

**Gopherbot** need never run as root; all of it's privileges derive from the collection of encrypted secrets that a given robot collects. However, given that chat bots may use 3rd-party command plugins, **Gopherbot** can be installed *setuid nobody*. This will cause the robot to run with a `umask` of `0022`, and external plugins will run by default as real/effective user `nobody`. Since **Gopherbot** child processes do not inherit environment from the parent daemon, this effectively prevents any potential access to the `GOPHER_ENCRYPTION_KEY`, and any ability to modify the robot's running environment.

> **NOTE!** Be wary of a false sense of security! The process still retains it's primary GID and supplementary groups, so if e.g. your robot unix user belongs to the `wheel` group, external scripts running as `nobody` will still be able to `sudo`. Privilege separation is just a simple means of providing additional hardening for your robot's execution environment.
