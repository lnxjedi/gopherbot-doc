# Installing **Gopherbot**

> Up-to-date with v2.6

If you want to run **Gopherbot** directly on a Linux host / VM, you can [download a release](https://github.com/lnxjedi/gopherbot/releases) and skip down to [installing the archive](#installing-the-archive).

## Building from Source
**Requirements:**
* A recent (1.18+) version of Go
* Standard build utilities; make, tar, gzip
* A Linux system to build on that matches your target deployment host

**Steps:**
1. Clone the **Gopherbot** repository: `git clone https://github.com/lnxjedi/gopherbot.git`
1. `make dist` in the repository root; this will compile the binary and create the `gopherbot-linux-amd64.tar.gz` archive

## Installing the Archive
1. Extract the downloaded or built archive in `/opt` to create `/opt/gopherbot`, e.g.:
```shell
[root]# cd /opt
[opt]# tar xzvf /path/to/gopherbot/gopherbot-linux-amd64.tar.gz
```
2. (Optional) Also as root, make the `gopherbot` binary **setuid nobody** (see [below](#privilege-separation)):
```shell
[opt]# cd gopherbot
[gopherbot]# ./setuid-nobody.sh
```

## Creating Symlinks to Executables

The trivial `gb-install-links` script will create a set of symlinks to executables. For instance, if `$HOME/bin` is in your `$PATH`, you could:
```shell
$ /opt/gopherbot/gb-install-links $HOME/bin
```

> See [Appendix A](/appendices/InstallArchive.html) for a description of the contents of the installation archive.

# Privilege Separation

**Gopherbot** need never run as root; all of it's privileges derive from the collection of encrypted secrets that a given robot collects. However, given that chat bots may use 3rd-party command plugins, **Gopherbot** can be installed *setuid nobody*. This will cause the robot to run with a `umask` of `0022`, and external plugins will run by default as real/effective user `nobody`. Since **Gopherbot** child processes do not inherit environment from the parent daemon, this effectively prevents any potential access to the `GOPHER_ENCRYPTION_KEY`, and any ability to modify the robot's running environment.

> **NOTE!** Be wary of a false sense of security! The process still retains it's primary GID and supplementary groups, so if e.g. your robot unix user belongs to the `wheel` group, external scripts running as `nobody` will still be able to `sudo`. Privilege separation is just a simple means of providing additional hardening for your robot's execution environment.
