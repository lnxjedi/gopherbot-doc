# CLI Tools for Authors

The `gopherbot` binary is also a CLI utility. The most useful commands for authors and operators are:

- `gopherbot --help`
- `gopherbot check`
- `gopherbot match`
- `gopherbot encrypt`
- `gopherbot decrypt`
- `gopherbot validate <path>`
- `gopherbot dump installed <path>`
- `gopherbot dump configured <path>`
- `gopherbot list`
- `gopherbot fetch <key>`
- `gopherbot version`

## Examples

Encrypt a secret:

```bash
gopherbot encrypt MyLousyPassword
```

Validate a robot repository:

```bash
gopherbot validate ~/robots/acme/custom
```

Check one SimpleMatcher without loading a robot:

```bash
gopherbot check 'spot (type:rails|devops) up [<branch:token>]' spot-devops-up
```

Match command text against the configured robot's plugin commands:

```bash
gopherbot match spot-devops-up
```

`match` uses the configured robot's command metadata. If the robot encryption key is available, template secrets are decrypted normally; if it is not available, secret template values are replaced with redacted placeholders and a note is written to stderr.

For repeated tests, load the command metadata once and prompt for command text until EOF:

```bash
gopherbot match -interactive
```

Dump the final merged robot config:

```bash
gopherbot dump configured robot.yaml
```

Secret template values are redacted by default when dumping expanded config. Use `--unredacted-secrets` only when you deliberately want decrypted secret values printed:

```bash
gopherbot dump --unredacted-secrets configured plugins/example.yaml
```

These commands are especially useful when configuration reload fails and you want to understand what the engine thinks the world looks like.
