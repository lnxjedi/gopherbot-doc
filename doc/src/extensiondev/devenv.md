# Dev Environment

You can develop jobs, plugins and extensions for your robot anywhere you can run the robot in terminal mode (`GOPHER_PROTOCOL` not set). It's helpful if you have access to a Linux workstation, VM, or container where you can bootstrap your robot and use [CLI commands](deploy/CLI.md).

Microsoft's free [VisualStudio Code](https://code.visualstudio.com/) has a remote extension that will allow you to edit files directly in a container, and the robot's adminstrator **save** command can push updates to the robot's git repository. That won't be documented here; rather, the stock [Gopherbot dev container](https://quay.io/repository/lnxjedi/gopherbot-dev?tab=info) provides similar functionality using [Theia](https://github.com/eclipse-theia/theia), and most of the examples will assume this setup.

## Using the `gopherbot-dev` Container

The most straight-forward way to set up a development environment for your robot is to take advantage of the [gopherbot-dev](https://quay.io/repository/lnxjedi/gopherbot-dev?tab=info) container used in [Quick Setup](../botsetup/Plugin.md):

**1.** Create a new `<botname>-dev` directory and copy the robot's `.env` file to `<botname>-dev/environment`
> I think I've repeated this at least a dozen times, but be sure `GOPHER_PROTOCOL` is commented out (or missing altogether) in the environment file. Not only does this prevent connecting a second robot with the same name and credentials to your team chat, but if you examine the default distributed configuration `yaml` files, you'll see that it disables certain scheduled jobs and modifies the robot's behavior in other ways more suitable for a dev environment.

**2.** From this directory, run the `gopherbot-dev` container, this time supplying the robot's environment. Using "clu" as an example:
```
$ docker run -p 127.0.0.1:3000:3000 --name clu-dev --env-file environment quay.io/lnxjedi/gopherbot-dev:latest
```

**3.** Now open your browser and connect to http://127.0.0.1:3000, where you'll be presented with the [Theia](https://github.com/eclipse-theia/theia) interface.

I find a three-pane layout most convenient; the top pane where code and configuration can be edited, and two terminal windows - one for running the robot in terminal mode, and one for running `gopherbot` CLI commands.

**4.** In a terminal window, run `gopherbot`. The bootstrap plugin will clone your robot's configuration repository, and start the robot in terminal mode:
```
$ gopherbot
2020/12/01 17:38:01 Initialized logging ...
...
general: Restore finished
OUT: unset SSH_AUTH_SOCK;
OUT: unset SSH_AGENT_PID;
OUT: echo Agent pid 625 killed;
c:general/u:alice ->
```

You can see above one of the handy features of terminal mode - anything written to stdout or stderr is output with a prefix of `OUT:` or `ERR:`.
