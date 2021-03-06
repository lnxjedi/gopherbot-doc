# Gopherbot DevOps Chatbot

[Title](Title.md)

[Status](Status.md)

[Foreword](Foreword.md)

[Introduction](Introduction.md)

[Terminology](Terminology.md)

- [Settting Up a Gopherbot Robot](Installation.md)
    - [Gopherbot Requirements](install/Requirements.md)
    - [Manual Installation](install/ManualInstall.md)
    - [Initial Robot Configuration](RobotInstall.md)
        - [Requirements](botsetup/Requirements.md)
        - [Robot Directory Structure](botsetup/gopherhome.md)
        - [Quick Start with Autosetup](botsetup/Plugin.md)
        - [Manual Setup](botsetup/ManualSetup.md)
            - [Create the `GOPHER_HOME` directory](botsetup/bothome.md)
            - [Create the Initial `.env` File](botsetup/initenv.md)
            - [Initialize Encryption](botsetup/initcrypt.md)
            - [Copy the Standard Robot](botsetup/copystd.md)
            - [Generate SSH Keypairs](botsetup/sshkeys.md)
            - [Finish the `.env` File](botsetup/finalenv.md)
            - [Connect Robot to Team](botsetup/connect.md)
            - [Saving Your Robot to Git](botsetup/saverobot.md)
            - [Finished](botsetup/finished.md)

- [Upgrading from Version 1](Upgrading.md)
    - [Required Bot Info](upgrade/BotInfo.md)
    - [External Plugin Configuration](upgrade/External-Plugin.md)
    - [Custom Configuration Directory](upgrade/Custom-Dir.md)
    - [Main Configuration File Rename](upgrade/robot-yaml.md)
    - [Early Encryption Initialization](upgrade/Encryption.md)
    - [Long-Term Memories](upgrade/Memories.md)

- [Deploying and Running Your Robot](RunRobot.md)
    - [Running in a Container](deploy/Container.md)
        - [Docker Example](deploy/DockerDeploy.md)
        - [Deploying to Kubernetes](deploy/Kubernetes.md)
    - [Running with Systemd](deploy/systemd.md)

- [Robot Basics](Basics.md)
    - [Addressing your Robot](basics/ping.md)
    - [Command Matching](basics/matching.md)
    - [Availability by Channel](basics/channels.md)
    - [The built-in Help System](basics/help.md)
    - [Standard Commands](basics/stdplugins.md)
    - [Context](basics/context.md)

- [Managing Your Robot and Adding Extensions](Admin.md)
    - [Updating from Git](usage/update.md)
    - [Container Dev Environment](extensiondev/devenv.md)
    - [Local Install Dev Environment](extensiondev/local.md)
    - [CLI Operation](extensiondev/CLI.md)
        - [Encrypting Secrets](extensiondev/secrets.md)
    - [Using the Terminal Connector](extensiondev/terminal.md)
    - [Administrator Commands](usage/admin.md)
    - [Logging](usage/logging.md)

- [CI/CD with GopherCI](GopherCI.md)

- [Gopherbot Configuration Reference](Configuration.md)
    - [Environment Variables](Environment-Variables.md)
    - [Configuration File Loading](config/file.md)
    - [Job and Plugin Configuration](config/job-plug.md)
    - [Troubleshooting](config/troubleshooting.md)

- [Pipelines, Plugins, Jobs and Tasks](pipelines/jobspipes.md)
    - [The Primary Pipeline](pipelines/primary.md)
    - [The Final Pipeline](pipelines/final.md)
    - [The Fail Pipeline](pipelines/fail.md)
    - [Task Environment Variables](pipelines/TaskEnvironment.md)
    - [All Included Tasks](pipelines/tasks.md)

- [Gopherbot Tool Integrations](pipelines/integrations.md)
    - [Integrating with SSH](pipelines/ssh.md)

- [Gopherbot API](api/API-Introduction.md)
    - [Language Templates](api/Languages.md)
    - [Attribute Retrieval](api/Attribute-Retrieval-API.md)
    - [Brain Methods](api/Brain-API.md)
    - [Message Sending](api/Message-Sending-API.md)
    - [Pipeline Construction](api/Pipeline-API.md)
    - [Requesting Responses](api/Response-Request-API.md)
    - [Utility](api/Utility-API.md)

- [Module Support](Modules.md)

## Appendix
- [Appendix](appendices/Appendix.md)
    - [A - Protocols](appendices/Protocols.md)
        - [A.1 - Slack](appendices/slack.md)
        - [A.2 - Rocket.Chat](appendices/rocket.md)
        - [A.3 - Terminal](appendices/terminal.md)
        - [A.4 - Test](appendices/testproto.md)
        - [A.5 - Nullconn](appendices/nullconn.md)

## Gopherbot Development
- [Working on Gopherbot](GopherDev.md)
    - [Development Robot](botdev/DevelRobot.md) <!--TODO: write me! -->
    - [Integration Tests](botdev/IntegrationTests.md)
    - [Important Structs and Interfaces](botdev/StructsInterfaces.md)
    - [Protocols](botdev/protocols.md)
    - [Releases](botdev/releases.md)
