# Robot API Overview

Every plugin, job, and task works through the Robot API.

## Main capability groups

- identity and attributes
- message sending and formatting
- prompting for replies
- memory and datum storage
- pipeline assembly
- admin and utility helpers

## Common methods

- `Reply`, `Say`, `SendUserMessage`
- `GetParameter`, `GetTaskConfig`
- `GetSenderAttribute`, `GetBotAttribute`, `GetUserAttribute`
- `PromptForReply`
- `Remember`, `Recall`, `CheckoutDatum`, `UpdateDatum`
- `AddTask`, `AddJob`, `AddCommand`
- `FinalTask`, `FailTask`
- `CheckAdmin`, `Elevate`, `Log`

## Important v3 behavior notes

- `AddCommand` composes work into the current pipeline; it does not fake a new user message.
- `AddJob` starts a child pipeline and does not automatically inherit every parent parameter.
- Prompt timeouts are longer on interactive local connectors such as SSH when using built-in interpreters or Go.
