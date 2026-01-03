# Dotfiles

## Installation

Uses [dotbot](https://github.com/anishathalye/dotbot). Run `./install` to symlink configs to their expected locations.

Configuration is in `install.conf.yaml`.

**Important:** Always create config files here in the dotfiles repo, not directly in `~/.config`. Add new configs to `install.conf.yaml` and run `./install` to create the symlinks.

## Sway

Config: `sway/config`

- Monitor: LG Ultrawide (DP-1) at 3840x1600@100Hz
- Terminal: kitty
- Launcher: walker (`$mod+d`)
- Bar: waybar

### Autostart
- polkit-gnome authentication agent
- walker service (`walker --gapplication-service`)

### Key bindings
- `$mod+d` - walker launcher
- `$mod+Shift+b` - browser (google-chrome-stable)
- `$mod+b` - horizontal split
- `$mod+v` - vertical split

## Waybar

Config: `waybar/config.jsonc`, `waybar/style.css`

Modules: workspaces, clock, bluetooth, network, pulseaudio, cpu, power-profiles-daemon, battery

Pulseaudio:
- Left-click: opens pavucontrol (for device switching)
- Right-click: toggle mute
- Scroll: adjust volume

## Walker

Config: `walker/config.toml`

Application launcher with modules:
- Applications (default)
- Calculator
- Clipboard
- Emojis
- File finder
- SSH
- Web search
- Windows switcher

Type `/` in walker to access the switcher for all modules.

Requires service: `walker --gapplication-service`
