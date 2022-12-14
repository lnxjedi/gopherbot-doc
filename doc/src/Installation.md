# Installing and Configuring a Gopherbot Robot

> Up-to-date with v2.6

There are three distinct tasks involved in installing and running a **Gopherbot** robot:

1. The first section discusses installing the **Gopherbot** from the pre-built distribution archive or source code, normally in `/opt/gopherbot`; this provides the `gopherbot` binary, default configuration, and an assortment of included batteries (libraries, plugins, jobs, tasks, helper scripts and more); if you're using a [Gopherbot container](https://github.com/orgs/lnxjedi/packages), installation is essentially a no-op.
1. Configuring a runnable instance of a robot for your team; the included **autosetup** plugin should make this an "easy button" - discussed in the chapter on [Initial Configuration](RobotInstall.md).
1. Deploying and running your robot on a server, VM, or in a container - covered in the chapter on [Running your Robot](RunRobot.md).

## **Gopherbot** and *Robots*

It's helpful to understand the relationship between **Gopherbot** and the individual robots you'll run. It's apt to compare Gopherbot with *Ansible*:
* *Gopherbot* is similar to *Ansible* - a common code base with an assortment of included batteries, but with limited functionality on it's own; several **Go** tasks and plugins are part of the compiled binary, but the bulk of the base robot configuration is stored in **yaml** and script files under `/opt/gopherbot`
* A *Robot* is comparable to a collection of playbooks and/or roles - this is your code for accomplishing work in your environment, which uses *Gopherbot* and it's included extensions to do it's work; in the case of **yaml** configuration files your robot configuration is merged with the base, while jobs and plugins can be overridden by providing replacements in your robot's repository

Similar to Ansible playbooks and roles, individual robots may periodically require updates as you upgrade the **Gopherbot** core.

## Running in a Container

If you plan on running your **Gopherbot** robot in a container, you can skip ahead to [Team Chat Credentials](/botsetup/credentials.html). For reference, it might be useful to peruse the contents of the [Gopherbot install archive](/appendices/InstallArchive.html) describing the contents of the Gopherbot install directory and default robot.
