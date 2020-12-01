# Deploying and Running Your Robot

**Gopherbot** is very flexible about being able to bootstrap and run in a variety of environments, and is designed to be remotely updated via git integration. This chapter discusses the two primary ways you'll run your robot:

* Using [Podman](https://podman.io), [Docker](https://docker.com), [Kubernetes](https://kubernetes.io), or any number of other container-centric environments, you can bootstrap and run your robot [in a Container](deploy/Container.md)
* The `resources/` directory contains a template `robot.service` that can be used to run your robot on a Linux host [using Systemd](deploy/systemd.md)

## The `.env` file
Regardless of your running environment, you'll need a copy of your robot's `.env` file generated when you configured your robot. If `GOPHER_PROTOCOL` is set, you might want it commented out so you can run your robot with the **terminal** connector, instead of having it connect to your team chat. For **Clu**, the `.env` looks like this:
```
GOPHER_ENCRYPTION_KEY=<redacted>
#GOPHER_PROTOCOL=slack
GOPHER_CUSTOM_REPOSITORY=git@github.com:parsley42/clu-gopherbot.git
GOPHER_DEPLOY_KEY=-----BEGIN_OPENSSH_PRIVATE_KEY-----:<much junk removed>:-----END_OPENSSH_PRIVATE_KEY-----:
```
