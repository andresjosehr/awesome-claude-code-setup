#!/bin/bash

# i18n.sh - Internationalization system for Claude Helper Scripts
# Source this file to enable multi-language support

# Determine the script's directory for finding locales
I18N_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
I18N_LOCALE_DIR="${I18N_SCRIPT_DIR}/../locales"

# Load saved language preference or default to English
if [[ -f "$HOME/.claude/config/locale" ]]; then
    source "$HOME/.claude/config/locale"
fi
export CLAUDE_LANG="${CLAUDE_LANG:-en}"

# Declare associative array for messages (requires bash 4+)
declare -gA MESSAGES

# Load locale file
load_locale() {
    local lang="${1:-$CLAUDE_LANG}"
    local locale_file="$I18N_LOCALE_DIR/$lang.sh"

    # Clear existing messages
    MESSAGES=()

    if [[ -f "$locale_file" ]]; then
        source "$locale_file"
    else
        # Fallback to English if requested locale not found
        if [[ -f "$I18N_LOCALE_DIR/en.sh" ]]; then
            source "$I18N_LOCALE_DIR/en.sh"
        fi
    fi
}

# Get a message by key with optional printf-style formatting
# Usage: msg "KEY" [arg1] [arg2] ...
msg() {
    local key="$1"
    shift
    local template="${MESSAGES[$key]:-$key}"

    if [[ $# -gt 0 ]]; then
        printf "$template" "$@"
    else
        printf "%s" "$template"
    fi
}

# Get a message with newline
# Usage: msgln "KEY" [arg1] [arg2] ...
msgln() {
    msg "$@"
    echo
}

# Get a message and send to stderr
# Usage: msg_err "KEY" [arg1] [arg2] ...
msg_err() {
    msg "$@" >&2
}

# Get a message with newline and send to stderr
# Usage: msgln_err "KEY" [arg1] [arg2] ...
msgln_err() {
    msgln "$@" >&2
}

# Get colored message
# Usage: msg_color "COLOR_VAR" "KEY" [arg1] [arg2] ...
msg_color() {
    local color="$1"
    local nc='\033[0m'
    shift
    echo -en "${color}"
    msg "$@"
    echo -en "${nc}"
}

# Get colored message with newline
# Usage: msgln_color "COLOR_VAR" "KEY" [arg1] [arg2] ...
msgln_color() {
    msg_color "$@"
    echo
}

# Check if a message key exists
has_msg() {
    local key="$1"
    [[ -n "${MESSAGES[$key]+set}" ]]
}

# Get current language
get_lang() {
    echo "$CLAUDE_LANG"
}

# Set language and reload messages
set_lang() {
    local lang="$1"
    export CLAUDE_LANG="$lang"
    load_locale "$lang"
}

# Save language preference
save_lang() {
    local lang="${1:-$CLAUDE_LANG}"
    mkdir -p "$HOME/.claude/config"
    echo "CLAUDE_LANG=$lang" > "$HOME/.claude/config/locale"
}

# List available languages
list_languages() {
    local lang_file
    for lang_file in "$I18N_LOCALE_DIR"/*.sh; do
        if [[ -f "$lang_file" ]]; then
            basename "$lang_file" .sh
        fi
    done
}

# Auto-load locale on source
load_locale

# Export functions
export -f msg msgln msg_err msgln_err msg_color msgln_color
export -f has_msg get_lang set_lang save_lang list_languages load_locale
