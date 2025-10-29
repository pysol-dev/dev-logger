#!/bin/bash
# Dev Logger Installation Script

set -e

echo "Installing Dev Logger..."
echo ""

# Create bin directory if it doesn't exist
mkdir -p "$HOME/bin"

# Copy main script
echo "→ Installing dev-logger to ~/bin/"
cp dev-logger "$HOME/bin/dev-logger"
chmod +x "$HOME/bin/dev-logger"

# Copy RC file
echo "→ Installing configuration to ~/.dev-logger.rc"
cp dev-logger.rc "$HOME/.dev-logger.rc"

# Add to .bashrc if not already present
if ! grep -q ".dev-logger.rc" "$HOME/.bashrc"; then
    echo ""
    echo "→ Adding to ~/.bashrc"
    echo "" >> "$HOME/.bashrc"
    echo "# Development Activity Logger" >> "$HOME/.bashrc"
    echo "if [ -f ~/.dev-logger.rc ]; then" >> "$HOME/.bashrc"
    echo "    source ~/.dev-logger.rc" >> "$HOME/.bashrc"
    echo "fi" >> "$HOME/.bashrc"
    echo "  ✓ Added to ~/.bashrc"
else
    echo "  ✓ Already in ~/.bashrc"
fi

# Create log directories
mkdir -p "$HOME/.dev-logs"/{daily,summaries,history-backups}
echo "→ Created log directories in ~/.dev-logs/"

echo ""
echo "✅ Installation complete!"
echo ""
echo "To activate in your current shell, run:"
echo "  source ~/.bashrc"
echo ""
echo "Or open a new terminal."
echo ""
echo "Quick start:"
echo "  dev-end          # Generate daily summary"
echo "  dev-recent       # Show recent commands"
echo "  dev-today        # View today's summary"
echo ""
echo "Task tracking:"
echo "  dev-task start \"name\"  # Start a new task"
echo "  dev-task finish        # Finish current task"
echo ""
echo "Auto-logging:"
echo "  dev-monitor start &    # Start file monitor"
echo "  dev-events             # View logged events"
echo ""
echo "For more info, see README.md and TASKS.md"
