#!/bin/bash

# Claude Helper - Main entry point for all helper scripts
# Usage: ./claude-helper.sh [category] [command] [args]

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source common functions (includes i18n)
source "$SCRIPT_DIR/common-functions.sh" 2>/dev/null || true

case "$1" in
    "project"|"p")
        shift
        "$SCRIPT_DIR/project-info.sh" "$@"
        ;;
    
    "docker"|"d")
        shift
        "$SCRIPT_DIR/docker-quick.sh" "$@"
        ;;
    
    "search"|"s")
        shift
        "$SCRIPT_DIR/search-tools.sh" "$@"
        ;;
    
    "ts"|"typescript"|"node")
        shift
        "$SCRIPT_DIR/ts-helper.sh" "$@"
        ;;
    
    "multi"|"m")
        shift
        "$SCRIPT_DIR/multi-file.sh" "$@"
        ;;
    
    "env"|"e")
        shift
        "$SCRIPT_DIR/env-check.sh" "$@"
        ;;
    
    "mcp")
        shift
        "$SCRIPT_DIR/mcp-helper.sh" "$@"
        ;;
    
    "nlp"|"text")
        shift
        "$SCRIPT_DIR/nlp-helper.sh" "$@"
        ;;
    
    "context"|"ctx")
        shift
        "$SCRIPT_DIR/claude-context.sh" "$@"
        ;;
    
    "code-relationships"|"cr")
        shift
        "$SCRIPT_DIR/code-relationships.sh" "$@"
        ;;
    
    "code-quality"|"cq")
        shift
        "$SCRIPT_DIR/code-quality.sh" "$@"
        ;;
    
    "python"|"py")
        shift
        "$SCRIPT_DIR/python-helper.sh" "$@"
        ;;
    
    "go"|"golang")
        shift
        "$SCRIPT_DIR/go-helper.sh" "$@"
        ;;
    
    "interactive"|"i")
        shift
        "$SCRIPT_DIR/interactive-helper.sh" "$@"
        ;;
    
    "api")
        shift
        "$SCRIPT_DIR/api-helper.sh" "$@"
        ;;
    
    "test"|"t")
        shift
        "$SCRIPT_DIR/test-helper.sh" "$@"
        ;;
    
    "list"|"help"|"")
        # Use i18n if available, otherwise fallback to English
        if type msgln &>/dev/null; then
            msgln "HELPER_TITLE"
            echo ""
            msgln "HELPER_USAGE" "$0"
            echo ""
            msgln "HELPER_CATEGORIES"
            msgln "HELPER_CAT_PROJECT"
            msgln "HELPER_CAT_DOCKER"
            msgln "HELPER_CAT_SEARCH"
            msgln "HELPER_CAT_TS"
            msgln "HELPER_CAT_PYTHON"
            msgln "HELPER_CAT_GO"
            msgln "HELPER_CAT_MULTI"
            msgln "HELPER_CAT_ENV"
            msgln "HELPER_CAT_MCP"
            msgln "HELPER_CAT_NLP"
            msgln "HELPER_CAT_CONTEXT"
            msgln "HELPER_CAT_CODE_REL"
            msgln "HELPER_CAT_CODE_QUAL"
            msgln "HELPER_CAT_TEST"
            echo ""
            msgln "HELPER_ENHANCED"
            msgln "HELPER_CAT_INTERACTIVE"
            msgln "HELPER_CAT_API"
            echo ""
            msgln "HELPER_EXAMPLES"
            msgln "HELPER_EX_PROJECT" "$0"
            msgln "HELPER_EX_DOCKER" "$0"
            msgln "HELPER_EX_SEARCH" "$0"
            msgln "HELPER_EX_TS" "$0"
            msgln "HELPER_EX_ENV" "$0"
            echo ""
            msgln "HELPER_CATEGORY_HELP"
            msgln "HELPER_CATEGORY_HELP_CMD" "$0"
        else
            # Fallback to English if i18n not loaded
            echo "=== CLAUDE HELPER SCRIPTS ==="
            echo ""
            echo "Usage: $0 <category> <command> [args]"
            echo ""
            echo "Categories:"
            echo "  project|p     - Project overview and analysis"
            echo "  docker|d      - Docker operations"
            echo "  search|s      - Code searching tools"
            echo "  ts|node       - TypeScript/Node.js helpers"
            echo "  python|py     - Python development tools"
            echo "  go|golang     - Go development tools"
            echo "  multi|m       - Multi-file operations"
            echo "  env|e         - Environment checks"
            echo "  mcp           - MCP server helpers"
            echo "  nlp|text      - Text analysis & NLP operations"
            echo "  context|ctx   - Claude context generation"
            echo "  code-relationships|cr - Analyze code dependencies"
            echo "  code-quality|cq - Check code quality"
            echo "  test|t        - Smart test operations"
            echo ""
            echo "Enhanced Tools (optional):"
            echo "  interactive|i - Interactive file/branch selection"
            echo "  api           - API testing with JSON tools"
            echo ""
            echo "Quick Examples:"
            echo "  $0 p                    # Project overview"
            echo "  $0 d ps                 # Docker containers"
            echo "  $0 s find-code pattern  # Search code"
            echo "  $0 ts deps              # Show dependencies"
            echo "  $0 env tools            # Check dev tools"
            echo ""
            echo "For help on specific category:"
            echo "  $0 <category> help"
        fi
        ;;

    *)
        if type msgln &>/dev/null; then
            msgln "HELPER_UNKNOWN_CATEGORY" "$1"
            msgln "RUN_HELP" "$0"
        else
            echo "Unknown category: $1"
            echo "Run '$0 help' for usage"
        fi
        exit 1
        ;;
esac