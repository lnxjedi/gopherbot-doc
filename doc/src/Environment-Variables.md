# Environment Variables

Environment variables influence both startup and task execution.

## Startup values you will use most often

- `GOPHER_ENCRYPTION_KEY`
- `GOPHER_CUSTOM_REPOSITORY`
- `GOPHER_DEPLOY_KEY`
- `GOPHER_CUSTOM_BRANCH`
- `GOPHER_ENVIRONMENT`
- `GOPHER_LOGDEST`
- `GOPHER_LOGLEVEL`
- `GOPHER_SSH_PORT`
- `GOPHER_MESSAGE_FORMAT`

## Task and pipeline environment

Tasks receive a cleaned environment plus pipeline-specific values. Common examples include:

- `GOPHER_PROTOCOL`
- `GOPHER_USER`
- `GOPHER_CHANNEL`
- `GOPHER_THREAD_ID`
- `GOPHER_MESSAGE_ID`
- `GOPHER_PIPE_NAME`
- `GOPHER_TASK_NAME`
- `GOPHER_START_PROTOCOL`
- `GOPHER_START_CHANNEL`
- `GOPHER_START_THREAD_ID`
- `GOPHER_START_USER`

For task authors, the practical rule is simple: prefer the Robot API for important values, and use the environment for integration with external scripts and tools.
