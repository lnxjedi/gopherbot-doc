# Plugins, Jobs, Tasks, and Providers

The important v3 rule is that selectors and definitions are separated from detailed config.

## Robot-wide selectors live in `robot.yaml`

Examples:

- `PrimaryProtocol`
- `DefaultProtocol`
- `SecondaryProtocols`
- `Brain`
- `HistoryProvider`
- `DefaultMessageFormat`
- `AdminUsers`
- `UserRoster`

## Detailed config lives in dedicated files

- connector config: `conf/protocols/<protocol>.yaml`
- brain config: `conf/brains/<provider>.yaml`
- history config: `conf/history/<provider>.yaml`
- plugin config: `conf/plugins/<plugin>.yaml`
- job config: `conf/jobs/<job>.yaml`

## Why this matters

This keeps config boundaries clean:

- transport concerns stay with connectors
- provider concerns stay with providers
- command and help metadata stays with the plugin that owns it
