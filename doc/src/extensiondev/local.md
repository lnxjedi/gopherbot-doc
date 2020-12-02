# Local Install Dev Environment

If you've [installed Gopherbot](../install/ManualInstall.md) on a Linux host or VM, you can just create an empty directory under your home directory, add your `.env` file (without `GOPHER_PROTOCOL`), and start **gopherbot** in terminal mode - letting the **bootstrap** plugin retrieve the rest of your robot:
```
[parse@hakuin ~]$ mkdir clu-dev
[parse@hakuin ~]$ cd clu-dev/
[parse@hakuin clu-dev]$ vim .env # paste, save
[parse@hakuin clu-dev]$ ln -s /opt/gopherbot/gopherbot .
[parse@hakuin clu-dev]$ ./gopherbot 
2020/12/02 14:28:46 Initialized logging ...
2020/12/02 14:28:46 Loaded initial private environment from '.env'
...
clu-jobs: Restore finished
OUT: unset SSH_AUTH_SOCK;
OUT: unset SSH_AGENT_PID;
OUT: echo Agent pid 11337 killed;
c:general/u:alice ->
```

Once you're robot has bootstrapped to the directory and created the `custom/` subdirectory, you can press `<ctrl-d>` to exit the robot, or open another terminal window in the same directory to use **Gopherbot's** CLI commands, discussed in the next section.
