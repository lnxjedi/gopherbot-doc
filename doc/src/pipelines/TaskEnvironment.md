# Task Environment

Every task sees a constructed environment, not the raw shell environment of the engine process.

## Sources of task values

From lower priority to higher priority, values can come from:

- namespaces
- task, plugin, or job parameters
- pipeline parameters
- `SetParameter(...)` during pipeline execution

## Practical rules

- jobs seed pipeline parameters naturally
- plugins usually have to publish values into the pipeline explicitly with `SetParameter(...)`
- secure parameters may need to be read with `GetParameter(...)`

The safe mental model is: tasks run with the environment the engine intentionally assembles for them, not whatever happened to be exported in the parent shell.
