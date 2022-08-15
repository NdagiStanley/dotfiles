# dotfiles/code

## Overview

The contents herein are specific for configuring my developer environment. More on this can be found in my [**repo-boiler-plate**](https://github.com/NdagiStanley/repo-boiler-plate#repo-boiler-plate) repository.

## Tools

> Editorconfig

There's a `.editorconfig` file to use for repos that you create. For more details check out the [EditorConfig website](http://editorconfig.org/).

> Circle CI

There's a `.circleci.yml` file to use for repos that you create. For more details check out the [Circleci docs](https://circleci.com/docs/2.0/).

> Codeclimate

For codeclimate: start `Docker` then run `sh codeclimate.sh`

Use `codeclimate.yml` for configuration.

> Docker

Run `sh docker_reset.sh` to hard reset docker. Meanwhile for simple pruning you can run:

`docker image prune` / `docker container prune`.

> Jupyter

For Jupyter notebook: `sh jupyter.sh`

Run `jupyter notebook` (at the root directory of choice) to open a Jupyter notebook

> Python VirtualEnv

Run `sh virtualenvwrapper.sh`. You can copy the commented out bits from line 8 to the files: `$WORKON_HOME/postactivate` and `$WORKON_HOME/postmkvirtualenv`
