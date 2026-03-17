This repository holds the mdBook sources for the public Gopherbot manual at [lnxjedi.github.io/gopherbot](https://lnxjedi.github.io/gopherbot).

The book is being rewritten around the current v3 workflow:

- local workstation development first
- git-managed robot configuration
- built-in interpreters and modern config layout
- containers as a deployment target, not the default authoring environment

To preview locally:

```bash
cd doc
mdbook serve
```
