# Installing the `gopherbot` software archive

Since **Gopherbot** version 2 defaults to a build using Go modules, the default `Makefile` creates a binary that links to the system `glibc`; thus, I no longer distribute pre-built binaries that may or may not work on a given system. Instead, you can easily build the distribution archive yourself.

**Requirements:**
* A recent (1.14+) version of Go
* Standard build utilities; make, tar, gzip
* A Linux system to build on that matches your target deployment host

**Steps:**
1. Clone the **Gopherbot** repository: `git clone https://github.com/lnxjedi/gopherbot.git`
1. `make dist` in the repository root
1. Extract the archive in `/opt` to create `/opt/gopherbot`, e.g.:
```shell
[root]# cd /opt
[opt]# tar xzf /path/to/gopherbot/gopherbot-linux-amd64.tar.gz
```
2. (Optional) Also as root, make the `gopherbot` binary **setuid nobody** (see [below](#privilege-separation)):
```shell
[opt]# chown nobody gopherbot/gopherbot
[opt]# chmod u+s gopherbot/gopherbot
```

## Archive Contents

**Files**
* `gopherbot` - the main executable, both a *daemon* and a *command-line interface*
* `fetch-robot.sh` - a developer utility script for retrieving a robot for local development

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

**Gopherbot** need never run as root; all of it's privileges derive from the collection of encrypted secrets that a given robot collects. However, given that chat bots tend to accumulate an assortment of 3rd-party command plugins (like the included **Chuck Norris**, hell yeah), **Gopherbot** can be installed *setuid nobody*. This will cause the robot to run with a `umask` of `0022`, and external plugins will run by default as real/effective user `nobody`. Since **Gopherbot** child processes do not inherit environment from the parent daemon, this effectively prevents any potential access to the `GOPHER_ENCRYPTION_KEY`, and any ability to modify the robot's running environment.

> **NOTE!** Be wary of a false sense of security! The process still retains it's primary GID and supplementary groups, so if e.g. your robot unix user belongs to the `wheel` group, external scripts running as `nobody` will still be able to `sudo`. Privilege separation is just a simple means of providing additional hardening for your robot's execution environment.
