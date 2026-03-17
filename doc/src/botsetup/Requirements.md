# Local Workstation Workflow

This is the workflow the v3 docs assume:

1. Keep one engine install tree on your workstation.
2. Keep one working directory per robot.
3. Run the engine locally from the robot's working directory.
4. Edit the robot's `custom/` files directly.
5. Use `reload` to tighten the edit-test loop.

## Why this replaced the old container-centric flow

Gopherbot is moving toward using its built-in interpreters and internal helpers more aggressively. That makes local authoring much smoother:

- fewer external runtime dependencies
- fast reload cycles
- easier debugging of config and scripts
- less friction for DevOps engineers who already live in a shell and editor

Containers are still fine for deployment and for some local preferences, but they are no longer the center of the documented development story.

## A good minimum setup

- one shell running the engine from the robot home
- one shell or editor for changing files under `custom/`
- one local SSH session into the robot for interactive testing

That gives you a tight loop without adding extra orchestration around the engine itself.
