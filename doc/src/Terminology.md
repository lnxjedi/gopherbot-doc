# Terminology

> Up-to-date with v2.6

This section is most important for referring back to as you read the documentation, to disambiguate terms.

(It's also for the author, to help maintain some consistency)

* **Gopherbot** - The installed software archive that comprises the core **Gopherbot DevOps Chatbot** service daemon and included extensions
* **robot** - you'll see the term *robot* in several different contexts in the documentation with these several meanings:
   * **robot** - Far and away the most common use - a configured instance of a running **Gopherbot** daemon, available in your team chat; normally associated with a *git* repository that holds all the configuration and extensions for the robot (normally in the context of *your robot*)
   * **Robot** - The Go object passed to user plugins, jobs and tasks
   * **robot** - the **Go** library for loadable modules, i.e. `import github.com/lnxjedi/robot`
* **default (or base) robot** - If you run Gopherbot with no custom configuration, you get *Floyd*, the default robot; this configuration is typically found under /opt/gopherbot, and defines how a robot behaves in the absence of other configuration, and the configuration of your specific robot is merged with the base robot
* **standard robot** - A standard robot is what you get from using `robot.skel` or running the `autosetup` plugin from the **default robot**; more generally, any robot that has the standard `robot.skel` configuration as its base is still a **standard robot**
* **GOPHER_HOME** - The top-level directory for a given robot's repository; the **Gopherbot** binary (`/opt/gopherbot/gopherbot`) is run from this directory to start or interact with the robot
* **bootstrapping** - When you start the `gopherbot` daemon in a container or host with a few environment variables, or in an empty directory with a suitable `.env` environment file, the **bootstrap** plugin included with the **default robot** will use a deploy key to clone your robot from a *git* repository and start it up; this process is called **bootstrapping** your robot, allows deploying your robot to new environments quickly, and supports the devops mantras of disposable environments / infrastructure-as-code
* **plugin** (or **command plugin**) - A piece of code that provides new interactive commands; plugins may also provide code for authorization and/or elevation, which may also interact with users
* **authorizer** - special plugin command used to determine whether a given user is authorized for a given command, normally checking some kind of group membership
* **elevator** - special plugin command providing additional verification of user identity; this can be as simple as a totp token or [Duo](https://duo.com) two-factor, or as complex as prompting another user before allowing a command to proceed
* **job** - jobs are pieces of code that typically use the pipeline API for creating pipelines to perform complex scheduled tasks such as backups and monitoring, or for software builds that may be triggered by detected updates to git repositories; see the chapter on [jobs and pipelines](pipelines/jobspipes.md)
* **task** - tasks are small pieces of code that generally form the parts of a pipeline, such as initializing (and tearing down) the `ssh-agent`, running pipeline scripts, or sending notifications; the task is also the base object for jobs and plugins, so "task" may refer to any entry in `ExternalPlugins`, `ExternalTasks`, `ExternalJobs`, etc.
* **parameter** - a name/value setting configurable for tasks, plugins, jobs and repositories, presented to external scripts as environment variables

In addition, this manual may periodically reference four important robots:
* **Floyd** - Floyd is a production robot in the `linuxjedi` Slack team, currently running on a `t2.nano` in AWS. Floyd was formerly responsible for building, testing and publishing the **Gopherbot** artifacts, but is now relegated to looking up recipes and telling jokes. The name is taken from Infocom's **Planetfall**, circa 1983. Also, as above, the **Gopherbot** default robot is named _Floyd_, but every other mention of **Floyd** refers to my production robot, whose repository can always be found [on Github](https://github.com/parsley42/floyd-gopherbot).
* **Data** - Data was a production robot in my home Kubernetes cluster (both now retired), responsible for building and publishing **Gopherbot** containers and documentation, and is probably the best publicly-available example of a production robot. You can find his configuration [on Github](https://github.com/parsley42/data-gopherbot). The name is taken from Star Trek TNG.
* **Clu** - Clu is "the best program that's ever been written ... dogged and relentless"; also, the development robot that changes frequently as I develop **Gopherbot**. Clu runs on workstations, chromebooks, containers, or wherever I happen to be doing development. If you've seen **Tron: Legacy** - it's not **THAT** Clu, but rather the short-lived **Clu** from the original **TRON**, circa 1982. **Clu's** repository is also always available [on Github](https://github.com/parsley42/clu-gopherbot), and generally has a pretty up-to-date README (not so much Floyd).
* **Bishop** - Bishop is used mainly for writing this documentation, and has his configuration repository wiped periodically when I test the `autosetup` plugin. You'll see lots of Bishop in the sections on managing your own robot. The repository may or may not be available at any given moment, and even if it is, it won't be very exciting. His name comes from **Aliens**, the **Alien** sequel, circa 1986.
