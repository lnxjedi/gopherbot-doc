# Help for Invalid Command Syntax

One pattern for robot commands (especially for robots managing infrastructure) is to use a CLI-like `<verb> (... args)` or `<verb-noun> (... args)` structure - e.g. `build-app`. These kinds of commands can have arbitrarily complex syntax, however; `build-app (branch) (--skip-checks)`, or multiple forms of the command. To mimic a CLI environment, you can take advantage of the first-match behavior in the list of `CommandMatchers` for a given plugin:

```yaml
CommandMatchers:
- Regex: '(?i:build-?app(?: (\w[\w-]*))?(?: (--skip-checks))?)'
  Command: build
- Regex: '(?i:build-?app\b.*)'
  Command: buildhelp
```

Then, add code to your plugin to handle the `buildhelp` command (ruby example):
```ruby
when "buildhelp"
    bot_alias = bot.GetBotAttribute("alias")
    bot.Say("Usage for build-app:")
    bot.Say("#{bot_alias}build-app (branch) (--skip-checks)", "fixed")
```

The more complex forms of `build-app` should come first, if none of them match, it will fall-through to `buildhelp` command.

NOTE:
* If a user command matches multiple plugins, the robot will complain and do nothing; the first-match behavior only applies within a single list of `CommandMatchers`
* The help message should probably match the configured keyword help
