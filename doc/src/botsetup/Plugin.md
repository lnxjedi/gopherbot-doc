# Quick Start with Autosetup

The best way to set up a new robot is using the [gopherbot-dev](https://quay.io/repository/lnxjedi/gopherbot-dev) container image running in [Docker](https://www.docker.com/) on your workstation. Using **Clu** as an example:

**1.** Start a new, empty `gopherbot-dev` container:

```
$ docker run -p 127.0.0.1:3000:3000 --name clu quay.io/lnxjedi/gopherbot-dev:latest
root INFO Configuration directory URI: 'file:///home/robot/.theia'
...
root INFO Deploy plugins list took: 441.6 ms
```

**2.** Open your browser and browse to `http://127.0.0.1:3000` to view the [Theia](https://github.com/eclipse-theia/theia) interface.

**3.** Open a terminal with **ctrl-shift-`**, and run `gopherbot`:
```
$ gopherbot
2020/11/30 16:00:23 Logging to robot.log; warnings and errors duplicated to stdout
Terminal connector running; Use '|c<channel|?>' to change channel, or '|u<user|?>' to change user
general: *******
general: Welcome to the *Gopherbot* terminal connector. Since no configuration was detected, you're connected to 'floyd', the default robot.
general: If you've started the robot by mistake, just hit ctrl-D to exit and try 'gopherbot --help'; otherwise feel free to play around with the default robot - you can start by typing 'help'. If you'd
like to start configuring a new robot, type: ';setup <protocol>'.
c:general/u:alice ->
```

**2.** Use the editor of your choice to edit the `answerfile.txt` template. Note that the answerfile template also contains documentation regarding the requirements for setting up your robot, including information on obtaining credentials for your robot to use with team chat.

> If you're not already familiar with **ssh deploy keys**, you should read up on the documentation for your *git* provider; see for example the [Github deploy keys](https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys) documentation, which also has useful information about [machine users](https://developer.github.com/v3/guides/managing-deploy-keys/#machine-users).

**3.** Run `./gopherbot`
```
$ ./gopherbot 
2020/03/22 10:40:57 Info: Logging to robot.log
null connector: Initializing encryption and restarting...
2020/03/22 10:40:59 Info: Logging to robot.log
null connector: Continuing automatic setup...
null connector: Generating ssh keys...
...
null connector: ********************************************************


null connector: Initial configuration of your robot is complete. To finish
setting up your robot, and to add yourself as an administrator:
1) Open a second terminal window in the same directory as answerfile.txt; you'll
need this for completing setup.
2) Add a read-write deploy key to the robot's repository, using the contents of
'custom/ssh/manage_key.pub'; this corresponds to an encrypted 'manage_key' that
your robot will use to save and update it's configuration.
3) Add a read-only deploy key to the robot's repository, using the contents of
'custom/ssh/deploy_key.pub'; this corresponds to an unencrypted 'deploy_key'
(file removed) which is trivially encoded as the 'GOPHER_DEPLOY_KEY' in the
'.env' file. *Gopherbot* will use this deploy key, along with the
'GOPHER_CUSTOM_REPOSITORY', to initially clone it's repository during
bootstrapping.
4) Once these tasks are complete, in your second terminal window, run
'./gopherbot' without any arguments. Your robot should connect to your team
chat.
5) Invite your robot to #clu-jobs; slack robots will need to be invited to any
channels where they will be listening and/or speaking.
6) Open a direct message (DM) channel to your robot, and give this command to
add yourself as an administrator: "add administrator LoveMyRobot"; your
robot will then update 'custom/conf/slack.yaml' to make you an administrator,
and reload it's configuration.
7) Once that completes, you can instruct the robot to store it's configuration
in it's git repository by issuing the 'save' command.
8) Finally, copy the contents of the '.env' file to a safe place, with the
GOPHER_PROTOCOL commented out; this avoids accidentally connecting another
instance of your robot to team chat when run from a terminal window. With proper
configuration of your git repository, the '.env' file is all that's needed to
bootstrap your robot in to an empty *Gopherbot* container,
(https://hub.docker.com/r/lnxjedi/gopherbot) or on a Linux host or VM with the
*Gopherbot* software archive installed.

Now you've completed all of the initial setup for your *Gopherbot* robot. See
the chapter on deploying and running your robot
(https://lnxjedi.github.io/gopherbot/RunRobot.html) for information on day-to
day operations. You can stop the running robot in your second terminal window
using <ctrl-c>.
```

**4.** Follow the instructions to add yourself as a robot administrator, and save your robot to it's *git* repository.

That's it - your robot is ready to start doing some work. The rest of this manual details deploying and managing your robot.
