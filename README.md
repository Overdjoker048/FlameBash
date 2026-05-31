# FlameBash
![Shell](https://img.shields.io/badge/Shell-Bash-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Version](https://img.shields.io/badge/Version-1.2.0-yellow.svg)

A complete Ubuntu Bash configuration that automatically installs and configures a personalized development environment.

> ⚠️ **FlameBash is designed exclusively for Ubuntu with GNOME.**
>
> The installer uses Ubuntu packages (`apt`) and GNOME settings (`gsettings`). It is **not compatible** with Debian, Fedora, Arch Linux, KDE Plasma, XFCE, or other desktop environments without modifications.

---

# Description

FlameBash transforms a fresh Ubuntu installation into a complete developer environment with:

* **A customized `.bashrc`**
* **A modern terminal setup using Alacritty**
* **Developer utilities and aliases**
* **Git shortcuts**
* **Python virtual environment helpers**
* **GNOME keyboard shortcuts**
* **Automatic system configuration**

The installer automatically:

* Installs required packages
* Replaces your current `.bashrc`
* Configures Alacritty
* Creates keyboard shortcuts
* Removes GNOME Terminal
* Applies the FlameBash environment

Only `curl` is required to launch the installation command.

---

# Installation

Run:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/USERNAME/FlameBash/main/install.sh)
```

The installer will automatically configure your system.

---

# Installed Packages

FlameBash automatically installs:

| Package        | Purpose                       |
| -------------- | ----------------------------- |
| `git`          | Git version control           |
| `python3-venv` | Python virtual environments   |
| `alacritty`    | Fast GPU-accelerated terminal |

---

# Keyboard Shortcuts

FlameBash automatically creates the following GNOME shortcuts:

| Shortcut        | Action         |
| --------------- | -------------- |
| `Super + Enter` | Open Alacritty |
| `Super + E`     | Open Nautilus  |

### Examples

Open a terminal instantly:

```text
Press Super + Enter
```

Open the file manager:

```text
Press Super + E
```

---

# Bash Shortcuts & Commands

FlameBash includes several commands designed to simplify everyday development tasks.

## Git

### Quick Commit

```bash
gc "commit message"
```

Example:

```bash
gc "update README"
```

Automatically stages all modified files and creates a commit.

---

### Quick Push

```bash
gp "v1.0.0"
```

Pushes changes to the remote repository and can create a tag if configured.

---

## Python

### Run a Python Script

```bash
py script.py
```

Example:

```bash
py main.py
```

---

### Compile Python Bytecode

```bash
pyc script.py
```

Example:

```bash
pyc main.py
```

---

### Create a Virtual Environment

```bash
venv
```

Creates:

```text
.env/
```

Activates it automatically and updates `.gitignore` when needed.

---

## C Development

Compile and execute a C file in a single command:

```bash
exe program.c
```

Example:

```bash
exe main.c
```

Compilation flags:

```text
-Wall
-Wextra
-Werror
-fsanitize=address
-g
```

The temporary executable is removed after execution.

---

# Maintenance Commands

## Update Ubuntu

```bash
update
```

Updates:

* APT packages
* Snap packages
* Flatpak packages (if installed)

---

## Clean the System

```bash
clean
```

Removes:

* Unused packages
* Orphaned dependencies
* Cached APT packages

---

## Reload FlameBash

```bash
actu
```

Reloads:

```bash
~/.bashrc
```

and refreshes the terminal environment.

---

# Requirements

## Supported

* Ubuntu 22.04+
* Ubuntu 24.04+
* GNOME Desktop

---

# License

This project is licensed under the MIT License.

See the `LICENSE` file for details.
