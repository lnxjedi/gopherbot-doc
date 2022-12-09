# Status of the Gopherbot Software

The project as a whole is going on 7 years old, and the core v1 functionality is fairly robust. On the other hand, some of the original plugins (like duo two factor) have suffered from bit-rot and may not function correctly; good news, though - the "knock knock joke" plugin definitely works.

The new job, task, pipeline and cron functionality for v2 is pretty heavily used and I have a good deal of confidence in it. The CI/CD functionality is unmaintained and not very functional. Similarly, the logging functionality and commands are not 100%.

I'm a little sorry that the only currently supported team chat connector is **Slack**, because that's what my team uses. This is definitely a "scratching my own itch" kind of project, and it's hard to motivate myself to write connectors for protocols I don't use. I'd be happy to work with others on this, however.

# Status of this Manual

This manual is a work in progress; currently incomplete and partly outdated. This section will be removed when the manual is considered complete. For now, to help you make the most of the manual, this is the current state of the different sections:

## Front Matter
The foreword, introduction and terminology pages should be up to date.

## Build and Installation
These sections are frequently updated to track with current development.

## Configuration Reference
The section on environment variables is updated fairly often, as well as the section on configuration file loading. The sections dealing with actual contents of configuration files was woefully outdated and need to be replaced. The best place to look for examples of legal configuration is the defaults in `conf/`.

## Extension Development and APIs
These sections fairly out of date and in need of TLC.
