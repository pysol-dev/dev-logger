# Dev Logger

**Comprehensive terminal activity tracking and daily development summaries for busy developers.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## What is Dev Logger?

Dev Logger automatically tracks everything you do in your terminal and generates daily summaries. Perfect for:

- 📊 **Productivity tracking** - See what you accomplished each day
- ?? **Preventing AI Psycosis
- 🔍 **Command history** - Search through weeks of terminal history
- 📝 **Project logging** - Track file changes and git activity across all repos
- 🐛 **Debugging** - Retrace your steps when troubleshooting
- 📈 **Progress reports** - Generate daily summaries for standups or retrospectives

---

## ✨ Features

### Automatic Tracking
- ✅ **Every command** logged with timestamps
- ✅ **File changes** in your project directories
- ✅ **Git activity** across all repositories
- ✅ **Bash history** backed up daily

### Smart Summaries
- 📊 Command statistics and recent activity
- 📁 Files modified today
-    Git commits and uncommitted changes
- 💻 System information

### Developer-Friendly
- Zero-overhead logging
- 🔒 100% local, no external uploads
- 🛠️ Customizable watched directories
- ⚡ Fast search across all history

---

## 🚀 Quick Start

### Installation

```bash
git clone https://github.com/pysol-dev/dev-logger.git
cd dev-logger
chmod +x install.sh
./install.sh
```

Then restart your terminal or run:
```bash
source ~/.bashrc
```

### Usage

Work normally in your terminal - everything is logged automatically!

At the end of the day:
```bash
dev-end          # Generate daily summary
dev-today        # View today's summary
```

---

## 📊 Commands

### View Activity
```bash
dev-today        # View today's summary
dev-recent       # Show last 20 commands
dev-recent 50    # Show last 50 commands
dev-logs         # List all daily summaries
```

### Search History
```bash
dev-search "npm install"    # Find specific commands
dev-search "git push"       # Search across all days
```

### Manual Tracking
```bash
dev-logger track-files      # Track file changes
dev-logger track-git        # Track git activity
dev-logger backup-history   # Backup bash history
dev-logger summary          # Generate summary
dev-logger daily-end        # Run all end-of-day tasks
```

---

## 📁 What Gets Tracked

### 1. Command History
Every command you run is logged with a timestamp:
```
[14:23:15] git commit -m "Add new feature"
[14:23:20] git push origin main
[14:25:30] npm run build
```

### 2. File Changes
Modified files in watched directories:
- `~/repos`
- `~/projects`
- `~/Documents`

### 3. Git Activity
- Uncommitted changes in all repos
- Today's commits with messages and authors
- Diff statistics

### 4. Daily Summaries
Markdown reports with:
- Command count and recent activity
- Files changed
- Git activity
- System information

---

## 📂 Directory Structure

```
~/.dev-logs/
├── daily/                          # Daily logs
│   ├── 2025-10-28_commands.log    # All commands
│   ├── 2025-10-28_file_changes.log # File modifications
│   └── 2025-10-28_git_activity.log # Git changes
├── summaries/                      # Daily summaries
│   └── 2025-10-28_summary.md      # Markdown report
└── history-backups/                # Bash history backups
    └── 2025-10-28_14-30-00_bash_history
```

---

## 🔧 Configuration

### Customize Watched Directories

Edit `~/bin/dev-logger` (line 33):
```bash
local watch_dirs=("$HOME/repos" "$HOME/projects" "$HOME/your-custom-dir")
```

### History Settings

Configured in `dev-logger.rc`:
- **HISTSIZE:** 10,000 commands (in memory)
- **HISTFILESIZE:** 50,000 commands (on disk)
- **HISTTIMEFORMAT:** Includes timestamps
- **HISTCONTROL:** Ignores duplicates

### Automate Daily Summaries

Add to crontab for automatic end-of-day summaries:
```bash
crontab -e

# Add this line:
59 23 * * * /path/to/dev-logger daily-end
```

---

## 💡 Use Cases

### End-of-Day Review
```bash
dev-end          # Generate comprehensive summary
dev-today        # Read what you accomplished
```

### Find That Command From Last Week
```bash
dev-search "docker compose"
dev-search "ssh -i"
```

### Track Project Activity
```bash
dev-git          # See what you've been working on
```

### Debugging
```bash
dev-recent 100   # Retrace your last 100 commands
```

---

## 🔐 Privacy & Security

- ✅ All logs stored **locally** in `~/.dev-logs/`
- ✅ **No external uploads** or telemetry
- ✅ Logs are **user-readable only** (permissions: 600/700)
- ✅ History backups **auto-cleaned** after 30 days
- ⚠️ Commands are logged as-is (be mindful of secrets in commands)

---

## 🛠️ Requirements

- **Bash** 4.0+
- **Git** (optional, for git tracking)
- **Standard Unix tools:** `find`, `awk`, `grep`, `tail`

Works on:
- ✅ Linux (all distros)
- ✅ macOS
- ✅ WSL (Windows Subsystem for Linux)

---

## 📖 Example Daily Summary

```markdown
# Development Activity Summary
**Date:** 2025-10-28
**Generated:** 2025-10-28 17:30:00

---

## Command Activity
- **Total Commands:** 147

### Most Recent Commands (Last 20):
```bash
[17:25:30] git status
[17:26:15] git add .
[17:26:20] git commit -m "Fix bug in parser"
[17:28:45] npm test
[17:29:30] git push origin main
```

## Modified Files
- **Files Changed Today:** 12

### Recently Modified:
```
/home/user/repos/my-project/src/parser.js
/home/user/repos/my-project/tests/parser.test.js
/home/user/repos/my-project/package.json
```

## Git Activity
### Repository: my-project
**Modified Files:**
M  src/parser.js
M  tests/parser.test.js

**Today's Commits:**
- a3f2c1: Fix bug in parser (2 hours ago by John Doe)
- 8d4e9b: Add new tests (3 hours ago by John Doe)

## System Information
- **Hostname:** dev-machine
- **Uptime:** up 5 days, 3 hours, 12 minutes
- **Disk Usage (Home):** 45% used
```

---

## 🤝 Contributing

Contributions welcome! Feel free to:
- 🐛 Report bugs
- 💡 Suggest features
- 🔧 Submit pull requests

---

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

Built for developers who want to track their productivity and never lose a command again.

---

## 📞 Support

- **Issues:** [GitHub Issues](https://github.com/pysol-dev/dev-logger/issues)
- **Discussions:** [GitHub Discussions](https://github.com/pysol-dev/dev-logger/discussions)

---

**Made with ❤️ for the developer community**
