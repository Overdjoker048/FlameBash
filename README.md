# FlameBash
![Shell](https://img.shields.io/badge/Shell-Bash-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Version](https://img.shields.io/badge/Version-1.1.0-yellow.svg)

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
$ gp "v1.1.0"
# pushes changes and creates a signed tag if needed
```

### Use Python aliases
```bash
$ py my_script.py
$ pyc my_script.py
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
