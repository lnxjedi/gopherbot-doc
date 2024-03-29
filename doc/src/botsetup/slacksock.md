# Slack Socket Mode

Starting with v2.5.0, **Gopherbot** uses the Slack [socket mode](https://api.slack.com/apis/connections/socket) [EventsAPI](https://api.slack.com/apis/connections/events-api) for bot credentials, which has more fine-grained permissions and settings than the old **RTM**-style credentials.

## Generating a Slack App Manifest

To save a LOT of time, we'll use a Slack [app manifest](https://api.slack.com/reference/manifests) to configure the settings for your app. You'll need to create a customized **yaml** file in a text editor based on the template provided with **Gopherbot**.

If you're setting up your robot in the Gopherbot IDE, you can just press `<ctrl-p>` to open the file search dialog and search for `appmanifest.yaml`, then `File | Save As...` to save a copy in the `/home/bot` directory.

You can start also with a copy of **Clu's** template from the [Gopherbot source](https://raw.githubusercontent.com/lnxjedi/gopherbot/main/resources/slack/appmanifest.yaml), or copy and paste from here:
```yaml
# See: https://api.slack.com/reference/manifests
_metadata:
  major_version: 1
  minor_version: 1
display_information:
  name: Clu Gopherbot
  description: Clu tries all the new, dangerous and/or breaking changes to Gopherbot.
features:
  app_home:
    home_tab_enabled: false
    messages_tab_enabled: true
    messages_tab_read_only_enabled: false
  bot_user:
    display_name: Clu Gopherbot
    always_online: false
  slash_commands:
    - command: /clu
      description: Provides access to Clu's hidden commands
      should_escape: false
oauth_config:
  scopes:
    # See: https://api.slack.com/scopes
    bot:
      - app_mentions:read
      - channels:history
      - channels:join
      - channels:read
      - chat:write
      - chat:write.public
      - commands
      - groups:history
      - groups:read
      - groups:write
      - im:history
      - im:read
      - im:write
      - links:read
      - mpim:history
      - mpim:read
      - mpim:write
      - users.profile:read
      - users:read
      - users:read.email
      - users:write
settings:
  event_subscriptions:
    bot_events:
      - message.channels
      - message.groups
      - message.im
      - message.mpim
  interactivity:
    is_enabled: false
  org_deploy_enabled: false
  socket_mode_enabled: true
  is_hosted: false
```

You should change the display information and display name, and decide if you want your robot to respond to "slash commands". Keep in mind:
* When a user sends a slash command, it doesn't echo to the channel; since one of the benefits of ChatOps is the ease of learning from other users by observation, you might lose some of this benefit (the robot will still respond to it's name, and also the 1-character **alias** that most users prefer)
* Slack slash commands are available in _every_ channel, even if the robot hasn't joined or been invited to the channel; individual plugins will still adhere to channel restrictions, but plugins configured with `AllChannels: true` (like **ping**) will respond everywhere

## Creating a New Slack App

1. Once you're logged in to your Slack team in the browser, visit the [Slack apps](https://api.slack.com/apps) page, then click **Create New App**
2. Select **From an app manifest**, choose your workspace, then click **Next**
3. Select the `YAML` tab and paste in the full contents of the app manifest you created (replacing the default contents), then click **Next**
4. Review the settings, then click **Create** to create the Slack app for your robot
5. Note that the **App Credentials** shown aren't the credentials needed for **Gopherbot**
6. Click **Install to Workspace**, review the requested permissions, then finally click **Allow**

## Obtaining the App Token and Bot Token for your App

Now that you've created a Slack app for your robot, you'll need to generate and/or locate the credentials you'll need for configuration.

1. From the app configuration **Basic Information** page, scroll down to **App-Level Tokens** and click the **Generate Token and Scopes** button
2. Give the token a name (e.g. "Token for Gopherbot"), then add both the **connections:write** and **authorizations:read** scopes
3. Click **Generate**, then copy and save your app token (`xapp-*`) in a safe place for later
4. Click **Done** to close the dialog
5. Select the **Install App** or **OAuth & Permissions** section on the left, then copy and save your Bot User OAuth token (`xoxb-*`) in a safe place for later
