# Task Tracking & Auto-Logging

## Overview

Dev Logger now includes powerful task tracking and automatic logging features that link related work across multiple days and automatically save logs when meaningful changes occur.

---

## 🎯 Task Tracking

### What are Tasks?

Tasks are long-running work items that can span multiple days. All commands, notes, and changes are automatically logged to the active task.

### Basic Usage

```bash
# Start a new task
dev-task start "Fix authentication bug"

# Add notes as you work
dev-task note "Found the issue in auth.js line 45"

# All commands are automatically logged to the task

# Finish the task when done
dev-task finish
```

### Task Commands

```bash
dev-task start "name"    # Start a new task
dev-task finish          # Finish current task
dev-task list            # List active tasks
dev-task list all        # List all tasks (active + completed)
dev-task show            # Show current task details
dev-task show <task_id>  # Show specific task
dev-task switch <id>     # Switch to different active task
dev-task note "text"     # Add a note to current task
dev-task current         # Show current task
```

### Quick Aliases

```bash
dev-task-start "name"    # Same as: dev-task start
dev-task-finish          # Same as: dev-task finish
dev-task-list            # Same as: dev-task list
dev-task-show            # Same as: dev-task current
dev-task-note "text"     # Same as: dev-task note
```

---

## 📊 How Task Logging Works

### Automatic Command Logging

When a task is active, **every command you run** is automatically logged to that task:

```
# Task: Fix authentication bug
# ID: task_20251029_143000_12345
# Started: 2025-10-29 14:30:00
# Status: ACTIVE

---

[2025-10-29 14:30:15] CMD: cd ~/repos/myproject
[2025-10-29 14:30:20] CMD: vim src/auth.js
[2025-10-29 14:35:45] NOTE: Found the issue in auth.js line 45
[2025-10-29 14:40:00] CMD: npm test
[2025-10-29 14:42:10] CMD: git commit -m "Fix auth bug"
[2025-10-29 14:42:15] CMD: git push

---
# Finished: 2025-10-29 14:45:00
```

### Multi-Day Tasks

Tasks automatically span multiple days. Start a task on Monday, continue working Tuesday, finish Wednesday - it's all in one unified log:

```bash
# Monday
dev-task start "Refactor database layer"
# ... work ...

# Tuesday (task still active)
dev-task note "Starting migration script"
# ... more work ...

# Wednesday
dev-task finish
# Complete log shows all work across all three days
```

### Multiple Active Tasks

You can have multiple tasks active and switch between them:

```bash
dev-task start "Feature A"
# ... work on A ...

dev-task start "Bug fix B"  # Now working on B
# ... work on B ...

dev-task switch task_20251029_100000_123  # Back to A
dev-task finish  # Finish A

dev-task list  # See remaining active tasks
```

---

## 🔍 Auto-Logging (Real-time Monitoring)

### What Gets Auto-Logged?

Dev Logger automatically detects and logs meaningful system changes:

**Config Files:**
- `.bashrc`, `.bash_profile`, `.zshrc`
- `.ssh/config`, `.ssh/authorized_keys`
- `.gitconfig`, `.vimrc`, `.tmux.conf`

**Scripts:**
- `.sh`, `.bash` files

**Package Management:**
- `package.json`, `package-lock.json` (npm/yarn)
- `requirements.txt`, `Pipfile` (Python)
- `Gemfile` (Ruby)
- `Cargo.toml` (Rust)
- `go.mod` (Go)
- `composer.json` (PHP)

**Build & Deploy:**
- `Dockerfile`, `docker-compose.yml`
- `.env` files
- `Makefile`, `CMakeLists.txt`

**Project Files:**
- `README.md`, `.gitignore`
- `.git/config`

### Starting the Monitor

**Real-time monitoring** (requires inotify-tools):
```bash
# Install inotify-tools first
dev-monitor install-inotify

# Start monitoring
dev-monitor start &
```

**Periodic monitoring** (checks every 5 minutes, no dependencies):
```bash
dev-monitor start &
```

### Viewing Auto-Logged Events

```bash
dev-events           # Show last 20 events
dev-events 50        # Show last 50 events
```

Example output:
```
[2025-10-29 14:23:15] MODIFIED: /home/user/.bashrc
[2025-10-29 14:25:30] PKG_CHANGE: /home/user/repos/myproject/package.json (npm/yarn package manifest)
[2025-10-29 14:30:00] CREATED: /home/user/.ssh/config
[2025-10-29 15:00:45] MODIFIED: /home/user/repos/myproject/Dockerfile
```

---

## 📁 Directory Structure

```
~/.dev-logs/
├── daily/                          # Daily command logs
│   └── 2025-10-29_commands.log
├── events/                         # Auto-logged events
│   └── 2025-10-29_events.log
├── tasks/                          # Task logs
│   ├── .active_tasks               # Currently active tasks
│   ├── .current_task               # Current task ID
│   ├── task_20251028_100000.log   # Completed task
│   └── task_20251029_140000.log   # Active task
├── summaries/                      # Daily summaries
│   └── 2025-10-29_summary.md
└── monitor.log                     # All monitoring events
```

---

## 🎨 Complete Workflow Example

### Scenario: Multi-Day Feature Development

**Day 1 - Monday:**
```bash
# Start the task
dev-task start "Add user profile page"

# Start monitoring in background
dev-monitor start &

# Work on the feature
cd ~/repos/myapp
vim src/components/Profile.jsx
npm install react-avatar
npm test

# Add progress notes
dev-task note "Created basic profile component"
dev-task note "TODO: Add avatar upload tomorrow"

# End of day (task stays active)
dev-end
```

**Day 2 - Tuesday:**
```bash
# Task is still active from yesterday
dev-task show  # See what you did yesterday

# Continue working
vim src/components/Profile.jsx
dev-task note "Added avatar upload functionality"
npm test

# Switch to handle a bug
dev-task start "Fix header alignment bug"
# Quick bug fix...
git commit -m "Fix header"
dev-task finish

# Switch back to main task
dev-task list  # See active tasks
dev-task switch task_20251028_143000_123
```

**Day 3 - Wednesday:**
```bash
# Finish the feature
git add .
git commit -m "Complete user profile page"
git push

dev-task finish

# View the complete log
dev-task show task_20251028_143000_123
```

### The resulting task log shows:

```markdown
# Task: Add user profile page
# ID: task_20251028_143000_123
# Started: 2025-10-28 14:30:00
# Status: COMPLETED

---

[2025-10-28 14:30:15] CMD: cd ~/repos/myapp
[2025-10-28 14:30:20] CMD: vim src/components/Profile.jsx
[2025-10-28 14:35:00] CMD: npm install react-avatar
[2025-10-28 14:35:30] NOTE: Created basic profile component
[2025-10-28 16:00:00] NOTE: TODO: Add avatar upload tomorrow

[2025-10-29 09:15:00] CMD: vim src/components/Profile.jsx
[2025-10-29 09:45:00] NOTE: Added avatar upload functionality
[2025-10-29 10:00:00] CMD: npm test

[2025-10-30 11:00:00] CMD: git add .
[2025-10-30 11:00:05] CMD: git commit -m "Complete user profile page"
[2025-10-30 11:00:10] CMD: git push

---
# Finished: 2025-10-30 11:05:00
```

---

## 💡 Best Practices

### 1. Start Tasks for Significant Work
```bash
# Good
dev-task start "Implement OAuth login"
dev-task start "Refactor API endpoints"
dev-task start "Fix memory leak in worker"

# Not necessary
dev-task start "Update README typo"  # Too small
```

### 2. Add Context with Notes
```bash
dev-task note "Decided to use Redis for session storage"
dev-task note "Performance improved by 40% after caching"
dev-task note "Blocked: waiting for API keys from ops team"
```

### 3. Use Monitoring for Config Changes
Let the monitor automatically track when you:
- Install new packages
- Modify SSH/Git configs
- Update Dockerfiles or build scripts
- Change environment variables

### 4. Review Task Logs Before Finishing
```bash
dev-task show  # Review what you did
dev-task note "Add final summary if needed"
dev-task finish
```

---

## 🔧 Configuration

### Customize Monitored Directories

Edit `dev-monitor` (lines 111-116):
```bash
local watch_dirs=(
    "$HOME/.ssh"
    "$HOME/.config"
    "$HOME/repos"
    "$HOME/projects"
    "$HOME/your-custom-dir"  # Add your own
)
```

### Customize Monitored File Patterns

Edit `dev-monitor` (lines 18-56) to add your own patterns:
```bash
WATCH_PATTERNS=(
    # Add custom patterns
    "\\.yaml$"
    "\\.toml$"
    "config\\.ini$"
)
```

---

## 🚀 Integration with Daily Summaries

Task activity is automatically included in daily summaries:

```bash
dev-end  # Generates summary including:
         # - Active tasks
         # - Completed tasks today
         # - Auto-logged events
         # - All command activity
```

---

## 📝 Tips & Tricks

### Quick Task Status
```bash
# Add to your PS1 prompt to show current task
# In .bashrc:
if [[ -f ~/.dev-logs/tasks/.current_task ]]; then
    CURRENT_TASK=$(cat ~/.dev-logs/tasks/.current_task)
    PS1="[$CURRENT_TASK] $PS1"
fi
```

### Search Task History
```bash
# Find all tasks related to "auth"
grep -r "auth" ~/.dev-logs/tasks/

# Find when you worked on specific files
grep "auth.js" ~/.dev-logs/tasks/*.log
```

### Export Task for Sharing
```bash
# Copy task log for sharing
dev-task show task_20251029_140000 > my_work_summary.md
```

---

**Task tracking keeps your work organized across days, while auto-logging ensures you never miss important system changes!**
