# Linux Fundamentals Homework

## 1. Soft Link vs Hard Link

**Soft Link (Symbolic Link)**

* Acts like a shortcut to a file or directory.
* Created using `ln -s`.
* Breaks if the original file is deleted.

**Hard Link**

* Another name for the same file (same inode).
* Created using `ln`.
* Continues to work even if the original file is deleted.

## 2. adduser vs useradd

**adduser**

* Interactive and beginner-friendly.
* Automatically creates a home directory and sets up the user.

**useradd**

* Low-level command.
* Requires additional options for full user setup.

**Recommended on Ubuntu:** `adduser`

## 3. journalctl

`journalctl` is used to view logs collected by systemd.

Common commands:

```bash
journalctl          # All logs
journalctl -b       # Current boot logs
journalctl -u nginx # Logs for a specific service
journalctl -f       # Follow logs in real time
```

## 4. Linux Command Cheat Sheet

| Command | Purpose                |
| ------- | ---------------------- |
| pwd     | Show current directory |
| ls      | List files and folders |
| cd      | Change directory       |
| mkdir   | Create directory       |
| touch   | Create file            |
| cp      | Copy files             |
| mv      | Move/Rename files      |
| rm      | Delete files           |
| cat     | View file contents     |
| grep    | Search text            |
| find    | Find files             |
| chmod   | Change permissions     |
| ps      | View processes         |
| top     | Monitor processes      |
| df -h   | Check disk usage       |
| whoami  | Show current user      |
