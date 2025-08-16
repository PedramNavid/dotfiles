# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Hyprland window manager configuration directory containing a single, monolithic configuration file. The setup uses a straightforward, well-commented approach without modular splitting.

## System Information

- **Operating System**: Arch Linux
- **Package Managers**:
  - `pacman` - Official Arch Linux package manager
  - `yay` - AUR helper for community packages

## Configuration Structure

The entire configuration is contained in `hyprland.conf` with the following sections:
- **MONITORS**: Display configuration (auto-detection)
- **MY PROGRAMS**: Default applications (terminal: kitty, file manager: dolphin, menu: wofi)
- **AUTOSTART**: Application startup commands (currently commented out)
- **ENVIRONMENT VARIABLES**: NVIDIA GPU settings for Wayland compatibility
- **LOOK AND FEEL**: Visual settings including gaps, borders, animations, and effects
- **INPUT**: Keyboard and mouse configuration
- **KEYBINDINGS**: Window management and system control shortcuts
- **WINDOWS AND WORKSPACES**: Window rules and workspace behavior

## Key Commands

### Reload Configuration
```bash
# Reload Hyprland configuration without restarting
hyprctl reload
```

### Validate Configuration
```bash
# Check for syntax errors
hyprland --config /home/pedram/.config/hypr/hyprland.conf --validate
```

### Debug Configuration
```bash
# View current configuration
hyprctl getoption general:gaps_in
# List all keybindings
hyprctl binds
```

## Important Details

1. **NVIDIA Setup**: This configuration includes NVIDIA-specific environment variables for proper Wayland/XWayland operation
2. **No Modular Files**: Unlike many Hyprland setups, this uses a single file approach. The modular import feature (line 10) is not utilized
3. **Animation Focus**: Custom bezier curves and detailed animation settings indicate emphasis on smooth visual transitions
4. **External Dependencies**:
   - `wpctl` for audio control
   - `brightnessctl` for display brightness
   - `playerctl` for media control

## Development Workflow

When modifying this configuration:
1. Edit `hyprland.conf` directly
2. Test changes with `hyprctl reload` to apply without logout
3. Check logs if issues occur: `journalctl -f -u graphical-session.target`

No build process or configuration generation is required - this is a manually maintained configuration file.

## Created Configuration Files

- `hyprland.conf`: Main Hyprland window manager configuration
- `CLAUDE.md`: Current memory and documentation file
