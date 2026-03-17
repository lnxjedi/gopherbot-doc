## Writing Docs Locally

The Gopherbot manual is an `mdbook` project.

### Preview locally

```bash
cd doc
mdbook serve
```

Then open the URL printed by `mdbook`, usually `http://127.0.0.1:3000`.

### Build once

```bash
cd doc
mdbook build
```

## Publishing

The published manual is served from GitHub Pages. This repository contains the source; the rendered output is published separately.
