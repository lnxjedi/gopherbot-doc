# Config Loading and Merge Rules

Gopherbot loads configuration in two passes:

1. installed defaults from the engine tree
2. custom overrides from the robot home

## Merge behavior

- maps merge recursively
- scalar values override
- arrays replace by default
- arrays append only when the key uses the `Append*` prefix

That merge model is why some connector-local identity data uses lists instead of maps: lists replace cleanly, which prevents accidental inheritance of unwanted defaults.

## Template expansion

Config files are Go text templates. The most important helpers are:

- `env`
- `default`
- `decrypt`
- `.Include`
- `GetStartupMode`

## Example

```yaml
{{ $environment := env "GOPHER_ENVIRONMENT" | default "development" }}
{{ printf "environments/%s.yaml" $environment | .Include }}
```

That is the standard v3 pattern for selecting environment-specific defaults in a scaffolded robot.
