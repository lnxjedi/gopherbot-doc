# Quick Start with Autosetup

The best way to set up a new robot is using the [gopherbot-dev](https://quay.io/repository/lnxjedi/gopherbot-dev?tab=info) container image running in [Docker](https://www.docker.com/) on your workstation. Using **Clu** as an example:

**1.** Start a new, empty `gopherbot-dev` container:

```
$ docker run -p 127.0.0.1:3000:3000 --name clu quay.io/lnxjedi/gopherbot-dev:latest
root INFO Configuration directory URI: 'file:///home/robot/.theia'
...
root INFO Deploy plugins list took: 441.6 ms
```
> Note: Normally `podman` can be used as a drop-in replacement for `docker`, but on my Fedora 33 workstation, an odd bug is preventing directories from being removed. YMMV, but as of this writing `docker` can be installed from nightly builds, even though it's not in the main repositories.

**2.** Open your browser and browse to `http://127.0.0.1:3000` to view the [Theia](https://github.com/eclipse-theia/theia) interface.

**3.** Open a terminal from the `Terminal` menu, and run `gopherbot init slack` to get a slack `answerfile.txt`:
```
$ gopherbot init slack
Edit 'answerfile.txt' and re-run gopherbot with no arguments to generate your robot.
```

**4.** Click the file icon or use the `File ... Open...` menu to open the newly-created `answerfile.txt`, then follow the directions to fill in the blanks. Note that the answerfile template also contains documentation regarding the requirements for setting up your robot, including information on obtaining credentials for your robot to use with team chat.

> If you're not already familiar with **ssh deploy keys**, you should read up on the documentation for your *git* provider; see for example the [Github deploy keys](https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys) documentation, which also has useful information about [machine users](https://developer.github.com/v3/guides/managing-deploy-keys/#machine-users).

**5.** When you've finished editing and saving `answerfile.txt`, re-run `gopherbot`; your robot will process the answerfile to generate your robot's initial configuration:
```
$ gopherbot 
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

**6.** Follow the instructions to get your robot connected to your team chat, add yourself as a robot administrator, and save your robot to it's *git* repository.
> NOTE: the quickest way to open a second terminal is to click the "Split Terminal" box in the upper-right corner of your initial terminal.

That's it - your robot is ready to be deployed and start doing some work. Once you've saved the robot's `.env` file to a safe location, you can delete the container. The rest of this manual details deploying and managing your robot.

**7.** To clean up:
```
$ docker stop clu
$ docker rm clu
```

> Note: After setting up your robot, you may get an e-mail from GitHub about having uploaded an ssh private key. Don't panic! If you download the keys and try to use them with `ssh-add`, you'll find they're encrypted - false alarm. You'll need your robot's `GOPHER_ENCRYPTION_KEY` to decrypt the passphrase.
