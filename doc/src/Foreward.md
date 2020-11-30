My work with ChatOps began with Hubot around 2012 when I was working as an systems engineer for a small hosting provider. The owner had sent me a link to Hubot, asking me to have a look. I took to the concept immediately, and started automating all kinds of tasks that our support team could easily access from our team chat. Soon they were using our robot to troubleshoot email routing and DNS issues, migrate mailboxes, and build new cPanel server instances.

Not being a very talented (or motivated) Javascript/NodeJS programmer, my Hubot commands invariably followed the same pattern: write it in Javascript if it was _trivially_ easy  to do so, otherwise shell out to bash and return the results. This was productive and gave results, but it was ugly and limited in functionality.

When I began teaching myself Go, I needed a good project to learn with. After my experience with Hubot, I decided to write a robot that was more approachable for Systems and DevOps engineers like myself - tasked with providing functionality most easily accessible from e.g. bash or python scripts. Towards that end, Gopherbot's design:

* Is CGI-like in operation: the compiled server process spawns scripts which can then use a simple API for interacting with the user / chat service
* Supports any number of scripting languages by using a simple json-over-http localhost interface
* Uses a multi-process design with method calls that block

Ultimately, Gopherbot gives me a strong alternative to writing Yet Another Web Application to deliver some kind of reporting, security, or management functionality to managers and technical users. It's a good meet-in-the-middle solution that's nearly as easy to use as a web application, with some added benefits:

* The chat application gives you a single pane of glass for access to a wide range of functionality
* The shared-view nature of channels gives an added measure of security thanks to visibility, and also a simple means of training users to interact with a given application
* Like a CGI, applications can focus on functionality, with security and access control being configured in the server process

It is my hope that this design will appeal to other engineers like myself, and that somewhere, somebody will exclaim "Wait, what? I can write chat bot plugins _**in BASH**_?!?"

David Parsley, March 2017 / September 2019

```bash
#!/bin/bash

# echo.sh - trivial shell plugin example for Gopherbot

# START Boilerplate
[ -z "$GOPHER_INSTALLDIR" ] && { echo "GOPHER_INSTALLDIR not set" >&2; exit 1; }
source $GOPHER_INSTALLDIR/lib/gopherbot_v1.sh

command=$1
shift
# END Boilerplate

configure(){
	cat <<"EOF"
---
Help:
- Keywords: [ "repeat" ]
  Helptext: [ "(bot), repeat (me) - prompt for and trivially repeat a phrase" ]
CommandMatchers:
- Command: "repeat"
  Regex: '(?i:repeat( me)?)'
EOF
}

case "$command" in
# NOTE: only "configure" should print anything to stdout
	"configure")
		configure
		;;
	"repeat")
		REPEAT=$(PromptForReply SimpleString "What do you want me to repeat?")
		RETVAL=$?
		if [ $RETVAL -ne $GBRET_Ok ]
		then
			Reply "Sorry, I had a problem getting your reply: $RETVAL"
		else
			Reply "$REPEAT"
		fi
		;;
esac
```