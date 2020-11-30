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

**3.** Open a terminal from the `Terminal` menu, and run `gopherbot`:
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

**4.** Use the setup command to create a new `answerfile.txt` for **Slack**:
```
c:general/u:alice -> ;setup slack
general: Edit 'answerfile.txt' and re-run gopherbot with no arguments to generate your robot.
Exiting (press <enter> ...)
c:general/u:alice -> 
Terminal connector finished
```

**5.** Click the file icon or use the `File ... Open...` menu to open the newly-created `answerfile.txt`, then follow the directions to fill in the blanks. Note that the answerfile template also contains documentation regarding the requirements for setting up your robot, including information on obtaining credentials for your robot to use with team chat.

> If you're not already familiar with **ssh deploy keys**, you should read up on the documentation for your *git* provider; see for example the [Github deploy keys](https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys) documentation, which also has useful information about [machine users](https://developer.github.com/v3/guides/managing-deploy-keys/#machine-users).

**6.** When you've finished editing and saving `answerfile.txt`, re-run `gopherbot`; your robot will process the answerfile to generate your robot's initial configuration:
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
...
(NOTE: Scroll back to the line of *** above and follow the directions to finish
setup)
```

**7.** Follow the instructions to add yourself as a robot administrator, and save your robot to it's *git* repository.
> NOTE: the quickest way to open a second terminal is to click the "Split Terminal" box in the upper-right corner of your initial terminal.

That's it - your robot is ready to be deployed and start doing some work. Once you've saved the robot's `.env` file to a safe location, you can delete the container. The rest of this manual details deploying and managing your robot.
