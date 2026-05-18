# ==================================================
# INTERACTIVE SHELL CHECK
# ==================================================
case $- in
    *i*) ;;
      *) return ;;
esac


# ==================================================
# COLORS (LABELS ONLY)
# ==================================================
C_LABEL="\e[38;2;255;165;0m"
C_RESET="\e[0m"


# ==================================================
# STARTUP DISPLAY
# ==================================================
display() {
    OS="$(. /etc/os-release 2>/dev/null && echo "$PRETTY_NAME")"
    KERNEL="$(uname -r)"
    HOST="$(hostname)"
    ARCH="$(uname -m)"
    UPTIME="$(uptime -p | sed 's/up //')"

    CPU="$(awk -F: '/model name/ {print $2; exit}' /proc/cpuinfo | sed 's/^ //')"
    GPU="$(lspci 2>/dev/null | grep -Ei 'vga|3d' | head -n1 | cut -d ':' -f3- | sed -E 's/^[ \t]*//; s/( Corporation| Inc\.|[\[\]\(\)]|\(rev [0-9a-f]+\))//g')"
    RAM_TOTAL="$(free -h | awk '/Mem:/ {print $2}')"
    DISK="$(df -h / | awk 'NR==2 {print $3 "/" $2 " (" $5 ")"}')"

    IP="$(ip route get 1 2>/dev/null | awk '{print $7; exit}')"
    SHELL_NAME="$(basename "$SHELL")"
    SESSION_TYPE="$([ -n "$SSH_CONNECTION" ] && echo "SSH" || echo "Local")"
    TTY_NAME="$(tty | sed 's|/dev/||')"

    # PC MODEL (safe, no root)
    PC_MODEL="$(cat /sys/devices/virtual/dmi/id/product_name 2>/dev/null)"
    [ -z "$PC_MODEL" ] && PC_MODEL="Unknown"

    # Virtualization
    VIRT="$(systemd-detect-virt 2>/dev/null)"
    [ -z "$VIRT" ] && VIRT="Bare metal"

    # Init system
    INIT_SYSTEM="$(ps -p 1 -o comm=)"

    # Resolution (if graphical)
    RESOLUTION="$(command -v xrandr &>/dev/null && xrandr | awk '/\*/ {print $1; exit}')"
    [ -z "$RESOLUTION" ] && RESOLUTION="N/A"

    # Package count
    if command -v dpkg &>/dev/null; then
        PKG_COUNT="$(dpkg -l | wc -l)"
    elif command -v pacman &>/dev/null; then
        PKG_COUNT="$(pacman -Q | wc -l)"
    elif command -v rpm &>/dev/null; then
        PKG_COUNT="$(rpm -qa | wc -l)"
    else
        PKG_COUNT="N/A"
    fi
    local logo=(
"\e[38;2;255;165;0m                    .\e[0m"
"\e[38;2;255;160;0m                 .~5P.\e[0m             \e[1m$USER@$HOST\e[0m"
"\e[38;2;255;155;0m               :JB&&G:\e[0m             ==============================="
"\e[38;2;255;150;0m             ^YB&&&#P^\e[0m             ${C_LABEL}OS:${C_RESET}         $OS"
"\e[38;2;255;145;0m           :JGB####B5!\e[0m             ${C_LABEL}Kernel:${C_RESET}     $KERNEL"
"\e[38;2;255;140;0m         .~5GBBGGGGG5J:\e[0m            ${C_LABEL}Arch:${C_RESET}       $ARCH"
"\e[38;2;255;135;0m        .~5PPPPPP5555J?:\e[0m           ${C_LABEL}Uptime:${C_RESET}     $UPTIME"
"\e[38;2;255;130;0m       .J555YYYYJJJJJ??!:\e[0m          ${C_LABEL}Model:${C_RESET}      $PC_MODEL"
"\e[38;2;255;125;0m      .!5YYJJ???77777!!7!^.\e[0m        ${C_LABEL}CPU:${C_RESET}        $CPU"
"\e[38;2;255;120;0m     !7:~JJJ??777!!!~~~~~!!^.\e[0m      ${C_LABEL}GPU:${C_RESET}        $GPU"
"\e[38;2;255;115;0m    ^PP57'^~7?77!!!~~~^^^~~~!!^\e[0m    ${C_LABEL}RAM:${C_RESET}        $RAM_TOTAL"
"\e[38;2;255;110;0m   .Y5555Y!:^!77!~~~^^^^^^~~!!!.\e[0m   ${C_LABEL}Disk:${C_RESET}       $DISK"
"\e[38;2;255;105;0m   !5YJJJJJ?~..^!!~~^^^^~~~~!!7?:\e[0m  ${C_LABEL}Packages:${C_RESET}   $PKG_COUNT"
"\e[38;2;255;100;0m  .JJ???777777: .^!!~~~~~~!!!77?7\e[0m  ${C_LABEL}Shell:${C_RESET}      $SHELL_NAME"
"\e[38;2;255;95;0m  :J?77!!!~~~!!~. .~7!!!!!7777?J7\e[0m  ${C_LABEL}Session:${C_RESET}    $SESSION_TYPE"
"\e[38;2;255;90;0m  .??7!!~~^^^^~!!. .~?77777???J?.\e[0m  ${C_LABEL}TTY:${C_RESET}        $TTY_NAME"
"\e[38;2;255;85;0m   ^?77!~~^^^~~!7^ .^?????JJJJ!.\e[0m   ${C_LABEL}Resolution:${C_RESET} $RESOLUTION"
"\e[38;2;255;80;0m    .~777!!!!!!!7! .~JJJJYYJ!.\e[0m     ${C_LABEL}Virt:${C_RESET}       $VIRT"
"\e[38;2;255;75;0m      .:!7?7777??~ .!YY5YJ~.\e[0m       ${C_LABEL}Init:${C_RESET}       $INIT_SYSTEM"
"\e[38;2;255;70;0m         .^!?JJJY^ .J5J!:\e[0m          ${C_LABEL}Version:${C_RESET}    1.1.1"
"\e[38;2;255;65;0m            .:!JY. .~.\e[0m "
    )

    for line in "${logo[@]}"; do
        printf "%b\n" "$line"
    done
}

display


# ==================================================
# HISTORY & OPTIONS
# ==================================================
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize


# ==================================================
# LESS
# ==================================================
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# ==================================================
# PROMPT
# ==================================================
VIRTUAL_ENV_DISABLE_PROMPT=1

__venv_segment() {
    [ -n "$VIRTUAL_ENV" ] && printf " \e[38;2;255;69;0m|\e[38;2;255;157;0m env\e[0m"
}

__git_segment() {
    local b d
    b=$(git branch --show-current 2>/dev/null)
    [ -z "$b" ] && return
    git diff --quiet 2>/dev/null && d="" || d=" ✗"
    printf " \e[38;2;255;69;0m|\e[38;2;255;157;0m ⎇ %s%s\e[0m" "$b" "$d"
}

if [[ ${EUID} == 0 ]]; then
    PS1='\n\[\e[38;2;255;69;0m\]╭─ \[\e[1;38;2;255;157;0m\]\h\[\e[0;38;2;255;69;0m\] | \[\e[38;2;255;192;77m\]\w\[\e[0m\]$(__venv_segment)$(__git_segment)\n\[\e[38;2;255;69;0m\]╰─\[\e[38;2;255;157;0m\]❯\[\e[0m\] '
else
    PS1='\n\[\e[38;2;255;69;0m\]╭─ \[\e[1;38;2;255;157;0m\]\u@\h\[\e[0;38;2;255;69;0m\] | \[\e[38;2;255;192;77m\]\w\[\e[0m\]$(__venv_segment)$(__git_segment)\n\[\e[38;2;255;69;0m\]╰─\[\e[38;2;255;157;0m\]❯\[\e[0m\] '
fi


# ==================================================
# GCC ALIASES
# ==================================================
exe() {
    if [ $# -eq 0 ]; then
        echo "Usage : exe fichier.c"
        return 1
    fi

    gcc -Wall -Wextra -Werror -fsanitize=address -g "$@" -o main || return 1
    ./main
    rm -f ./main
}


# ==================================================
# GIT ALIASES
# ==================================================

# gc <msg> → git add . (repo root) + commit
alias gc='bash -c '\''
  root=$(git rev-parse --show-toplevel 2>/dev/null) || { echo "Pas dans un repo git"; exit 1; }
  cd "$root" || exit
  git add .
  if [ $# -gt 0 ]; then
    git commit -m "$*"
  else
    git commit -m "a"
  fi
'\'' --'

# gp <msg> → tag + push --follow-tags
alias gp='bash -c '\'' \
if [ $# -gt 0 ]; then \
    git tag -ma "$*"; \
    git push --follow-tags; \
else \
    git push; \
fi \
'\'''


# ==================================================
# ALIASES
# ==================================================
venv() {
    if [ ! -d ".env" ]; then
        python3 -m venv .env
    fi
    source .env/bin/activate
}

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias clear='clear; display'
alias clean='sudo apt autoremove -y && sudo apt autoclean -y'
alias actu='source ~/.bashrc && clear'
alias py='python3'
alias pyc='python3 -OO -c "import py_compile, sys; py_compile.compile(sys.argv[1], cfile=\"./\" + sys.argv[1].replace(\".py\", \".pyc\"))"'   

# ==================================================
# UPDATE COMMAND
# ==================================================

update() {
    echo "📦 Mise à jour du système..."
    apt update -y && apt upgrade -y && apt full-upgrade -y
    apt autoremove -y && apt autoclean -y
    apt install --install-recommends linux-generic -y
    command -v ubuntu-drivers >/dev/null 2>&1 && ubuntu-drivers autoinstall || true
    command -v snap >/dev/null 2>&1 && snap refresh || true
    command -v flatpak >/dev/null 2>&1 && flatpak update -y || true
    [ -f /var/run/reboot-required ] && echo "⚠️  Redémarrage requis" || echo "✔️ Pas de redémarrage nécessaire"
}

# ==================================================
# BASH COMPLETION
# ==================================================
if ! shopt -oq posix; then
    [ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
fi
