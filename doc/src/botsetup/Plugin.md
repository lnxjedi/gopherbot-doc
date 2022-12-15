# Quick Start with the Gopherbot IDE

Once you have a running [Goperbot IDE](/botdev/IDE.html) and the [required credentials](/botsetup/credentials.html):

1. Press ``<ctrl-shift-`>`` to open a new terminal in `/home/bot`

2. Run `gopherbot init slack` to generate `/home/bot/answerfile.txt`:
```
[~]$ gopherbot init slack
Edit 'answerfile.txt' and re-run gopherbot with no arguments to generate your robot.
```

3. In the left-side file explorer, locate and open `answerfile.txt` under `bot`

4. Follow the directions in the file to fill in the blanks, then save the file.

> If you're not already familiar with **ssh deploy keys**, you should read up on the documentation for your *git* provider; see for example the [GitHub deploy keys](https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys) documentation, which also has useful information about [machine users](https://developer.github.com/v3/guides/managing-deploy-keys/#machine-users).

5. When you've finished editing and saving `answerfile.txt`, re-run `gopherbot` without any arguments; your robot will process the answerfile to generate your robot's initial configuration:
```
$ gopherbot 
[~]$ gopherbot 
2022/12/14 17:52:50 Info: Logging to robot.log
null connector: Initializing encryption and restarting...
2022/12/14 17:52:51 Info: Logging to robot.log
null connector: Continuing automatic setup...
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

6. Follow the instructions to get your robot connected to your team chat, add yourself as a robot administrator, and save your robot to it's *git* repository.
> NOTE: the quickest way to open a second terminal is to click the "Split Terminal" box in the upper-right corner of your initial terminal. To access the public keys for configuring deployment keys, you can e.g. `cat custom/ssh/deploy_key.pub`, or open it from the file explorer

7. Once you've uploaded your robot to it's *git* repository, you'll only need the contents of `/home/bot/.env` for deploying your robot - you should browse the `bot` section in file explorer, locate and download the `.env`.

8. Once you've downloaded your robot's `.env`, you should append it's contents to your IDE development profile for the robot, so you can easily bootstrap and update your robot later. Here's are example commands for doing this in your host OS terminal (NOT in an IDE / OpenVSCode terminal window):
```shell
david@penguin:~/botwork$ cat ~/Downloads/.env >> bishop.env # NOTE: supply the path to _your_ download directory
david@penguin:~/botwork$ rm ~/Downloads/.env
david@penguin:~/botwork$ cat bishop.env 
## Lines starting with #| are used by the cbot.sh script
GIT_AUTHOR_NAME="David Parsley"
GIT_AUTHOR_EMAIL=parsley@linuxjedi.org
GIT_COMMITTER_NAME="David Parsley"
GIT_COMMITTER_EMAIL=parsley@linuxjedi.org
#|CONTAINERNAME=bishop
#|SSH_KEY_PATH=/home/david/.ssh/id_rsa
GOPHER_ENCRYPTION_KEY=<redacted>
GOPHER_CUSTOM_REPOSITORY=git@github.com:parsley42/bishop-gopherbot.git
## You should normally keep GOPHER_PROTOCOL commented out, except when
## used in a production container. This allows for the normal case where
## the robot starts in terminal mode for local development.
GOPHER_PROTOCOL=slack
## To use the deploy key below, add ssh/deploy_key.pub as a read-only
## deploy key for the custom configuration repository.
GOPHER_DEPLOY_KEY=-----BEGIN_OPENSSH_PRIVATE_KEY-----:<redacted>:-----END_OPENSSH_PRIVATE_KEY-----:
```

That's it - your robot is ready to be deployed and start doing some work. Once you've saved the robot's `.env` file to a safe location, you can delete the container. The rest of this manual details deploying and managing your robot.

9. To clean up:
```shell
david@penguin:~/botwork$ ./cbot.sh stop bishop.env # to just stop the container
# OR
david@penguin:~/botwork$ ./cbot.sh rm bishop.env # to remove the container
```

> Note: After setting up your robot, you may get an e-mail from GitHub (or other hosted **git** provider) about having uploaded an ssh private key. Don't panic! If you download the keys and try to use them with `ssh-add`, you'll find they're encrypted - false alarm. You'll need your robot's `GOPHER_ENCRYPTION_KEY` to decrypt the passphrase.
