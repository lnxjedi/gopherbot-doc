# Robot Directory Structure

> Up-to-date with v2.4

**Gopherbot** robots run in the context of a standard directory structure. The root of this directory structure is the `$HOME` for a given robot, and your robot starts by running the *gopherbot* binary in this directory. There are no requirements on this directory except that it needs to be owned and writable by the UID running the *gopherbot* binary; it should not be located under `/opt/gopherbot`, to avoid complicating upgrades. The [stock containers](https://quay.io/organization/lnxjedi) create a `robot` user and home directory in `/var/lib/robot`, but the software was written to e.g. pass `-c <filename>` to `ssh` to allow multiple robots to run on a single system without _real_ system users and home directories. In this kind of setup, the standard location is `/var/lib/robots/<robotname>`. You can always give your robot the `info` command to report on where it's running, and in what directory (`$GOPHER_HOME`):
```
parsley - 10:02 AM:
*info

Mr. Data - 10:02 AM:
Here's some information about me and my running environment:
The hostname for the server I'm running on is: data-gopherbot-7878979b4-v7fsh
...
The gopherbot install directory is: /opt/gopherbot
My home directory ($GOPHER_HOME) is: /home/robot
My git repository is: git@github.com:parsley42/data-gopherbot.git
My software version is: Gopherbot v2, commit: 1a60a8e2
The administrators for this robot are: parsley
The administrative contact for this robot is: David Parsley, <parsley@linuxjedi.org>
```

Note that in the standard directory structure, much of the content is automatically generated when a robot first starts. Thanks to the **bootstrap** plugin in the default robot, a fully configured robot can be started with just a `.env` file in an empty directory. In the case of container-based robots, environment variables are provided by the container engine, and all content is generated during bootstrapping.

We'll use [Clu](https://github.com/parsley42/clu-gopherbot) as example:

* `clu/` - Top-level directory, `$GOPHER_HOME`; mostly empty of files and not containing a git repository (`.git/`)
    * `.env` (user provided) - file containing environment variables for the robot, including it's encryption key and git clone url; on start-up the permissions will be forced to `0600`, or start-up will fail - note that this file may be absent in containers, where the initial environment variables are provided by the container engine
    * `gopherbot` (optional/generated) - convenience symlink to `/opt/gopherbot/gopherbot`
    * `known_hosts` (generated) - used by the robot to record the hosts it connects to over *ssh*
    * `robot.log` (generated) - log file created when the robot is run in **terminal mode**
    * `custom/` - directory for your robot's git repository, containing custom configuration, plugins, jobs and tasks; for *Clu*, this is [https://github.com/parsley42/clu-gopherbot](https://github.com/parsley42/clu-gopherbot)
    * `state/` - for the standard file-backed brain, **state/** contains the robot's encrypted memories in a **state/brain/** directory; this directory is normally linked to the `robot-state` branch of the robot's configuration repository - for *Clu* this is [https://github.com/parsley42/clu-gopherbot/tree/robot-state](https://github.com/parsley42/clu-gopherbot/tree/robot-state)
    * `history/` - the standard robot keeps job / plugin logs here
    * `workspace/` - default location for the robot's workspace, where repositories are cloned, etc.

## The `custom/` directory

The `custom/` directory is essentially *your robot*, and is generally used differently for development and deployment.

### During Development

When developing jobs, tasks and plugins for your robot, you'll mostly use the terminal connector and treat `state/` as disposable. A fairly standard workflow goes like this:
1. Run your robot with the `gb-start-dev` script, which uses the [gopherbot-theia](https://quay.io/repository/lnxjedi/gopherbot-theia?tab=info) container, providing an environment file for your robot
1. Use the **terminal** connector, configured to mirror your team chat environment, for developing extensions for your robot
1. In the `custom/` directory, create commits as desired, creating and pushing commits as normal
1. Send an administrator `update` command to your production robot to pull down the latest changes and reload

For more information on developing, see the chapter on [Developing Extensions](../botprogramming.md).

### Deployment to Production

Production robots normally clone `custom/` the first time they start on a new VM or container, and are updated by an administrator `update` command.

> Production robots can also be configured to automatically update whenever the master branch updates. **Floyd**, for example, does this. See the `Triggers:` section in Floyd's [updatecfg.yaml file](https://github.com/parsley42/floyd-gopherbot/blob/master/conf/jobs/updatecfg.yaml).
