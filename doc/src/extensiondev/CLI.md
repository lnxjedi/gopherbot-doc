# CLI Tools for Authors

The `gopherbot` binary is also a CLI utility. The most useful commands for authors and operators are:

- `gopherbot --help`
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

Dump the final merged robot config:

```bash
gopherbot dump configured robot.yaml
```

These commands are especially useful when configuration reload fails and you want to understand what the engine thinks the world looks like.
