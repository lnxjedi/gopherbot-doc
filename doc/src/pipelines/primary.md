# Primary Pipelines

The primary stage is where the real work happens.

## Key behaviors

- tasks run in sequence
- a failure stops normal primary-stage execution
- plugins often begin as a single task and then add more work dynamically

## Important API calls

- `AddTask`
- `AddJob`
- `AddCommand`
- `SetParameter`
- `SetWorkingDirectory`

## v3 nuance

- `AddJob` starts a child pipeline
- `AddCommand` stays inside the current pipeline and is not a fake new inbound chat message
- tasks added during execution can run before later originally queued tasks, which is how setup tasks can expand into more detailed work on the fly
