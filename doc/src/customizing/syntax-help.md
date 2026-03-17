# Writing Good Help Text

Help in v3 is command-linked, so good help starts with good command metadata.

## Recommended fields

- `Usage`: the command body only
- `Summary`: one short sentence
- `Examples`: a few realistic examples
- `Keywords`: the search terms users will actually try

## Example

```yaml
Commands:
- Command: deploy
  Regex: '(?i:deploy ([A-Za-z0-9._/-]+))'
  Usage: "deploy <branch>"
  Summary: "deploy the named git branch to the selected environment"
  Examples:
  - "(alias) deploy main"
  - "(alias) deploy release/2026-03-13"
  Keywords: [ "deploy", "release", "ship" ]
```

## Good habits

- Use placeholders in examples, not your real bot name.
- Keep `Usage` short and command-line-like.
- Put the detailed explanation in follow-up help or normal prose, not inside `Usage`.
- If a command has a common invalid form, handle it deliberately and reply with the correct syntax.
