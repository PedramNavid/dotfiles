#!/bin/bash
# Script to automatically update window-shortcuts.txt by analyzing hyprland.conf

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/hyprland.conf"
OUTPUT_FILE="$SCRIPT_DIR/window-shortcuts.txt"

# Check if config file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: hyprland.conf not found at $CONFIG_FILE"
    exit 1
fi

# Check if llm command is available
if ! command -v llm &> /dev/null; then
    echo "Error: 'llm' command not found. Please install it first."
    exit 1
fi

echo "Analyzing Hyprland configuration..."

# Extract relevant keybindings and send to Claude
cat "$CONFIG_FILE" | llm "
Analyze this Hyprland configuration and create a well-formatted shortcuts reference.
Focus on window management keybindings only.

Extract and organize these categories:
1. WINDOW ACTIONS (close, float, pseudo, split)
2. FOCUS MOVEMENT
3. WINDOW MOVEMENT (swapping)
4. WINDOW RESIZING
5. WORKSPACE MANAGEMENT
6. Any other window-related bindings

Format the output as a clean text file with:
- Clear section headers
- Aligned keybinding descriptions
- Use arrow symbols (←→↑↓) for arrow keys
- Note: \$mainMod means Super key

Start with 'HYPRLAND WINDOW MANAGEMENT SHORTCUTS' as the title.
Include a separator line of equals signs.
Make it easy to read in a popup dialog.
" > "$OUTPUT_FILE"

if [ $? -eq 0 ]; then
    echo "Successfully updated $OUTPUT_FILE"
    echo "You can view it with: Super+F1"
else
    echo "Error: Failed to update shortcuts file"
    exit 1
fi
