# Updating from Git

The most trivial changes can be made by pushing updates directly to your robot's repository, and instructing your robot to update. For this exercise, we'll add your robot's job channel to the list of default channels, making many more plugins available there.

>Note: In the example dialogs, Bishop's alias, `-`, precedes most commands - you'll need to substitute your own robot's alias.

**1.** You can use the normal `git` CLI to clone the repository, or you can use your git provider's web interface to make changes. We're going to modify `conf/slack.yaml`; find the `DefaultChannels` line:
```yaml
DefaultChannels: [ "general", "random" ]
```
... then update the list, and add your robot's job channel; using **bishop** as an example:
```yaml
DefaultChannels: [ "general", "random", "bishop-jobs" ]
```

**2.** Commit and push your changes

**3.** In your robot's job channel, verify that the *lists* plugin isn't available:
```
parsley:
-list lists

Bishop Gopherbot:
@parsley: Sorry, that didn't match any commands I know, or may refer to a command that's not available in this channel; try 'bishop, help <keyword>'
```

**4.** Now instruct your robot to update it's configuration, triggering a git pull and a reload:
```
parsley:
-update

Bishop Gopherbot:
Ok, I'll trigger the 'updatecfg' job to issue a git pull and reload configuration...
Custom configuration repository successfully updated
@parsley: Configuration reloaded successfully
... done
```

**5.** Check and verify that the *lists* plugin is now available:
```
parsley:
-list lists

Bishop Gopherbot:
I don't have any lists
```

Simple as that.
