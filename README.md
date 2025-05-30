# utility_commands

A collection of bash scripts providing utility commands to avoid typing
over and over the same snippets of code.

_Typing one line of code is much better than two if you have to do it 1,000 times._

## How to use

Clone the repository (adjust the paths if you do not want to clone in home):
```shell
git clone https://github.com/StefanoCretti/utility_commands.git
```

Add the following snippet to `.zshrc` (default in macOS Catalina and onwards)
or `.bashrc` (default in most Linux distro and old macOS):
```shell
for file in $HOME/utility_commands/*.sh; do
  [ -r "$file" ] && source "$file"
done
```

This will automatically source all `.sh` files so that the utility functions
are available. Close and reopen the shell for changes to take effect.
