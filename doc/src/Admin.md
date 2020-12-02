# Managing Your Robot and Adding Extensions

**Gopherbot** robots are designed to be remotely administered and updated, for common cases where a robot runs behind network firewalls, in virtual cloud networks, or in a container environment. Many of the frequently desired updates - such as changing the schedule of an automated job - can be safely and easily updated by pushing a commit to your robot's repository and instructing it to update. More significant updates can be tested by modelling with the **terminal** connector before committing and saving, then updating your production robot.

This chapter covers:

* How to update your robot with **git**
* The two primary ways to set up a dev environment
* **Gopherbot** CLI commands

You should have a robot deployed "in production" (connected to your team chat) to work the examples in the following sections.
