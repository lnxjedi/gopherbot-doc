# CLI Operation

The `gopherbot` binary can run as both a daemon and a command-line interface, mainly used for generating encrypted secrets. This section discusses running **Gopherbot's** CLI utility commands.

## Setting up For CLI Operation

You'll need to create a dev environment, using either a [container](devenv.md) or [local install](local.md), then run `gopherbot` at least once to run the bootstrap plugin and populate the `custom/` subdirectory. Once bootstrapping finishes, you can press `<ctrl-d>` to exit from the robot, or open a separate terminal window in the same directory.

> Note that the following examples assume `gopherbot` in the current directory is a symlink to `/opt/gopherbot/gopherbot`, and commands start with `./gopherbot ...`. If you're using the container web dev environment, you can just use `gopherbot`, since it'll be in your `$PATH`.

## CLI Commands

### Help

```shell
$ ./gopherbot --help
Usage: gopherbot [options] [command [command options] [command args]]
  "command" can be one of:
	decrypt - decrypt a string or file
	encrypt - encrypt a string or file
...
```

### Encrypting and Decrypting Strings

You'll use this later in the exercise on adding plugins:
```shell
$ ./gopherbot encrypt MyLousyPassword
+LrXWBPZrbO0aJVI/lCKHR81mcD9v0LvrHojvU/qDia2lpjFNN/t+D0e5g==
$ ./gopherbot decrypt +LrXWBPZrbO0aJVI/lCKHR81mcD9v0LvrHojvU/qDia2lpjFNN/t+D0e5g==
MyLousyPassword
```

### Encrypting and Decrypting Files
