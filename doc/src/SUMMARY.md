# Gopherbot DevOps Chatbot

[Title](Title.md)

[Status](Status.md)

[Foreword](Foreword.md)

[Introduction](Introduction.md)

[Terminology](Terminology.md)

# Part I - Getting Started
- [The Gopherbot IDE](botdev/IDE.md)

- [Installing and Configuring a Gopherbot Robot](Installation.md)
    - [Installation on Linux](install/LinuxInstall.md)
        - [Software Requirements](install/Requirements.md)
        - [Installing Gopherbot](install/ManualInstall.md)
    - [Team Chat Credentials](botsetup/credentials.md)
        - [Slack Socket Mode](botsetup/slacksock.md)
    - [Initial Robot Setup](RobotSetup.md)
        - [Environment Requirements](botsetup/Requirements.md)
        - [Robot Directory Structure](botsetup/gopherhome.md)
        - [Quick Start with the Gopherbot IDE](botsetup/Plugin.md)

- [Deploying and Running Your Robot](RunRobot.md)
    - [Deployment Environment Variables](deploy/deploy-environment.md)
    - [Running in a Container](deploy/Container.md)
        - [Docker Example](deploy/DockerDeploy.md)
        - [Deploying to Kubernetes](deploy/Kubernetes.md)
    - [Running with Systemd](deploy/systemd.md)

# Part II - Working with Your Robot
- [Robot Basics](Basics.md)
    - [Addressing your Robot](basics/ping.md)
    - [Command Matching](basics/matching.md)
    - [Availability by Channel](basics/channels.md)
    - [The built-in Help System](basics/help.md)
    - [Standard Commands](basics/stdplugins.md)
    - [Context](basics/context.md)

<!-- This chapter needs to describe working with the IDE -->
- [Managing Your Robot](Admin.md)
    - [Updating from Git](usage/update.md)
    - [Container Dev Environment](extensiondev/devenv.md)
    - [Local Install Dev Environment](extensiondev/local.md)
    - [CLI Operation](extensiondev/CLI.md)
        - [Encrypting Secrets](extensiondev/secrets.md)
    - [Using the Terminal Connector](extensiondev/terminal.md)
    - [Administrator Commands](usage/admin.md)
    - [Logging](usage/logging.md)

# Part III - Worked Examples
- [Writing Your First Plugin](customizing/first-plugin.md)
- [Writing Custom Extensions for Your Robot](customizing.md)
    - [Style Guide](customizing/style.md)
        - [Help for Invalid Command Syntax](customizing/syntax-help.md)
- [Gopherbot Tool Integrations](pipelines/integrations.md)
    - [Integrating with SSH](pipelines/ssh.md)

# Part IV - Reference
- [Gopherbot Configuration Reference](Configuration.md)
    - [Configuration File Loading](config/file.md)
    - [Job and Plugin Configuration](config/job-plug.md)
    - [Troubleshooting](config/troubleshooting.md)

- [Gopherbot Scripting API](api/API-Introduction.md)
    - [Script Environment Variables](Environment-Variables.md)
    - [Language Templates](api/Languages.md)
    - [Attribute Retrieval](api/Attribute-Retrieval-API.md)
    - [Brain Methods](api/Brain-API.md)
    - [Message Sending](api/Message-Sending-API.md)
    - [Pipeline Construction](api/Pipeline-API.md)
    - [Requesting Responses](api/Response-Request-API.md)
    - [Utility](api/Utility-API.md)

- [Pipelines, Plugins, Jobs and Tasks](pipelines/jobspipes.md)
    - [The Primary Pipeline](pipelines/primary.md)
    - [The Final Pipeline](pipelines/final.md)
    - [The Fail Pipeline](pipelines/fail.md)
    - [Task Environment Variables](pipelines/TaskEnvironment.md)
    - [All Included Tasks](pipelines/tasks.md)

# Appendix
- [Appendix](appendices/Appendix.md)
    - [A - Gopherbot Install Archive](appendices/InstallArchive.md)
    - [B - Protocols](appendices/Protocols.md)
        - [B.1 - Slack](appendices/slack.md)
        - [B.2 - Rocket.Chat](appendices/rocket.md)
        - [B.3 - Terminal](appendices/terminal.md)
        - [B.4 - Test](appendices/testproto.md)
        - [B.5 - Nullconn](appendices/nullconn.md)

<!-- # Contributing to Gopherbot Development
- [Working on Gopherbot](GopherDev.md)
    - [Development Robot](botdev/DevelRobot.md)
    - [Integration Tests](botdev/IntegrationTests.md)
    - [Important Structs and Interfaces](botdev/StructsInterfaces.md)
    - [Protocols](botdev/protocols.md)
    - [Releases](botdev/releases.md) -->
