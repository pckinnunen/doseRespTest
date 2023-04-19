# Advanced pre-commit commands

This document contains example commands for advanced use in a `pre-commit` workflow as
configured in this repo. Refer to `pre-commit` or to other tool-specific documentation for more
information.

Run any `pre-commit` hook against a specific file (for example `flake8`) :

    pre-commit run [hook] --file  myfile.py

Run all `pre-commit` hooks against a specific file:

    pre-commit run --file myfile.py

Run a specific `pre-commit` hook (e.g. `flake8`) against all files in the repo:

    pre-commit run [hook] --all-files

## Ignoring pre-commit hooks

Ignoring code quality feedback is highly discouraged, but sometimes necessary, e.g. when code
quality tools disagree.

In such cases, first try updating the tools:

1. Stash your code changes by running `git stash`
2. Update the tool versions by running `pre-commit autoupdate`
3. Re-run updated tools on the whole repo

    `pre-commit run --all-files`

4. Resolve and commit all required code changes.
5. Unstash your changes.

    `git stash pop`

6. Re-try your original commit.

    `git commit`

As a last resort, first resolve all addressable feedback on your changes, and then commit, ignoring
only the subset of feedback that can't be resolved.

    git commit --no-verify
