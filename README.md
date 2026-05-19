# FlameBash
![Shell](https://img.shields.io/badge/Shell-Bash-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Version](https://img.shields.io/badge/Version-1.1.2-yellow.svg)

A lightweight and functional `.bashrc` configuration for Linux developers, designed to improve your terminal with a rich prompt, system dashboard, and useful commands.

## Description

FlameBash turns your Bash shell into a practical and visually appealing development environment. It provides:

- A colorful prompt showing user/host, current directory, Git branch, and repository status
- A startup system dashboard with OS, kernel, CPU, RAM, disk, IP, and more
- Useful aliases for Python, Git, and common operations
- Maintenance commands for updating, cleaning, and reloading the shell

## Key Features

- **Enhanced prompt**: system and Git information in a clear, colorful prompt
- **Startup dashboard**: instant overview of system status when opening a terminal
- **Simplified Git**: `gc`, `gp`, and Git status displayed directly in the prompt
- **Practical aliases**: `py`, `pyc`, `ll`, `la`, `l`, etc.
- **Fast maintenance**: `update`, `clean`, `actu`, `clear`
- **Bash compatibility**: designed for interactive shells and works with `bash-completion`

## Commands

### Git
- `gc <message>`: stage all changes and create a commit quickly.
- `gp <message>`: push changes to the remote and optionally create a signed tag.
- Git status is displayed directly in the prompt for easy tracking.

### Development
- `exec <file>`: compile and execute a C program using `gcc -Wall -Wextra -Werror -fsanitize=address -g`, then remove the temporary binary.
- `env`: create and activate a local Python virtual environment in `.env`, and update `.gitignore`.
- `py`: run Python scripts with `python3`.
- `pyc`: compile a Python script to `.pyc`.

### Maintenance
- `update`: update Debian/Ubuntu packages, clean packages, refresh drivers, and update snaps/flatpaks.
- `clean`: remove orphaned packages and clean the APT cache.
- `actu`: reload the `.bashrc` configuration and refresh the terminal dashboard.
- `clear`: clear the terminal and redisplay the system dashboard.

## Quick Usage Example
```bash
# Copy the .bashrc file to your home directory
$ cp FlameBash/.bashrc ~/.bashrc

# Load the configuration
$ source ~/.bashrc

# Use the included aliases and commands
$ py script.py
$ gc "update prompt"
$ update
$ actu
```

## Usage Examples

### Check Git status and create a quick commit
```bash
$ gc "update documentation"
# adds all files and creates a commit
```

### Push to remote with a tag
```bash
$ gp "v1.0.0"
# pushes changes and creates a signed tag if needed
```

### Use Python aliases
```bash
$ py my_script.py
$ pyc my_script.py
```

### Compile and execute a C program
```bash
$ exec program.c
# compiles program.c with gcc and runs the resulting binary
```

### Reload your configuration after editing
```bash
$ actu
```

### Clean the system and APT cache
```bash
$ update
$ clean
```

## Installation

1. Copy or symlink the `.bashrc` file to your home directory.
2. Load the configuration:
```bash
$ source ~/.bashrc
```

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.
