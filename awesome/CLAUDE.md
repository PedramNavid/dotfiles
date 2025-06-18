## AwesomeWM Config

This is a repo for the AwesomeWM config. It is based of awesomewm-git, not the 4.3 release.

You can find the documentation for the git-release here: https://awesomewm.org/apidoc/documentation/07-my-first-awesome.md.html

The configuration is all in `rc.lua`

You can test your changes with aawmtt

```bash
aawmtt
```

This will spawn a new awesome window using Xephyr, with the logs to stdout.

There's a minimal theme in `./pedburn`

Formatting/linting:

Use stylua `stylua .`
The following settings are set:

```
collapse_simple_statement = "Always"
quote_style = "AutoPreferSingle"
line_endings = "Unix"
indent_type = "Spaces"
indent_width = 2
call_parentheses = "None"
```

## Plugins

Lain is installed as a git submodule at `./lain`
