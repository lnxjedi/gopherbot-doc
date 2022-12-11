# The Gopherbot IDE

Starting with version 2.6, the **Gopherbot** CI/CD pipelines are configured to create a pre-built development container with a daily snapshot of the most current code. This container is very large, >2G, but the base is built weekly to pick up the latest security updates, and includes the following bundled software:
* A Debian base image with Ruby and Python3 (and other requirements)
* The most recent release of [Go](https://go.dev/dl)
* The most recent release of [OpenVSCode Server](https://github.com/gitpod-io/openvscode-server)
* Pre-installed OpenVSCode language extensions for python, ruby and Go, including required modules

> While using the IDE isn't strictly necessary, all documentation will be written using it, as well as all future releases of **Gopherbot**.

## Requirements

To work with the **Gopherbot IDE**, you'll need one of:
* A Linux host with docker installed (note that Podman may work but is untested)
* A MacOS host with [Docker Desktop](https://www.docker.com/products/docker-desktop/) installled
* A Windows host with the Windows Subsystem for Linux (WSL/WSL2) installed, and docker installed there

> Note that the common theme here is `docker` and `bash` - the primary script for managing the Gopherbot IDE (`cbot.sh`) is written in **bash**.

The Gopherbot IDE is created primarily for use with **ssh** git credentials, though it also includes the `gh`. Within your host environment, you'll also need an ssh keypair configured for pushing to your robot's repository with **git**.

## Getting Started

> This section will describe setting up a simple directory called `botwork` for working with you robot(s); feel free to adjust specific paths and commands according to your preferences and comfort with the command line.

1. Open a terminal window in one of the required environments, then create a new `botwork` directory and change to that directory:
```shell
~$ mkdir botwork
~$ cd botwork/
~/botwork$
```

2. Download the latest `cbot.sh` script, mark it executable, then run it without any arguments for help/usage:
```shell
$ curl -o cbot.sh https://raw.githubusercontent.com/lnxjedi/gopherbot/main/cbot.sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  4787  100  4787    0     0  13599      0 --:--:-- --:--:-- --:--:-- 13560
~/botwork$ chmod +x cbot.sh
~/botwork$ ./cbot.sh
Usage: ./botc.sh profile|dev|start|stop|remove (options...) (arguments...)
...
```
3. Generate a new profile for working on your robot; replace `dolores` in the example with the name you'll give your robot:
```shell
$ ./cbot.sh profile -k ~/.ssh/id_rsa dolores "David Parsley" parsley@linuxjedi.org | tee dolores.env
## Lines starting with #| are used by the cbot.sh script
GIT_AUTHOR_NAME="David Parsley"
GIT_AUTHOR_EMAIL=parsley@linuxjedi.org
GIT_COMMITTER_NAME="David Parsley"
GIT_COMMITTER_EMAIL=parsley@linuxjedi.org
#|CONTAINERNAME=dolores
#|SSH_KEY_PATH=/home/david/.ssh/id_rsa
```
> Note that in the example we supplied the path to a standard encrypted private key; this could also be a deployment key, or left out altogether if other authentication means are used. Due to the inherent security of encrypted ssh keys and ssh-agent, this manual will use ssh for all examples.

4. Start a development container:
```shell
$ ./cbot.sh dev dolores.env
Starting 'dolores':
dolores
Copying /home/david/.ssh/id_rsa to dolores:/home/bot/.ssh/id_ssh ...
Access your dev environment at: http://localhost:7777/?workspace=/home/bot/gopherbot.code-workspace&tkn=XXXX
```

5. Connect to the IDE
Copy the URL provided and paste it in to your browser; note that VSCode server operates best in a separate browser tab running full-screen.

That's it! You're ready to start setting up a new robot.