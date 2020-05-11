# dotenv

Automatically load your project ENV variables from `.env` file when you `cd` into project root directory.

This is the [`oh-my-zsh/dotenv`](https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/dotenv/) plugin modified for zsh.

## Installation

Just add the plugin to your `.zpreztorc` `:prezto:load` section:

You may have to add the module dir to the `pmodule-dirs` setting by adding the following line

```zsh
zstyle ':prezto:load' pmodule-dirs $HOME/.zprezto-contrib
```

Replacing `$HOME/.zprezto-contrib` with wherever you have your modules