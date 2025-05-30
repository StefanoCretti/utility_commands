#!/bin/bash

# Description:
# - Open a project directory in Zed
# - Activate corresponding mamba env
# - Move into the project directory

project() {

    # Default values
    readonly ENV_SUFFIX="_env"
    readonly DEFAULT_DIR="$HOME/repos/"

    local project_name="$1"
    local project_env="${1}${ENV_SUFFIX}"
    local project_dir="${DEFAULT_DIR}${1}"

    shift

    while [[ $# -gt 0 ]]; do
        case "$1" in
        --env)
            project_env="$2"
            shift 2
            ;;
        --dir)
            project_dir="$2"
            shift 2
            ;;
        *)
            echo "Usage: project <project_name> [--env <project_env>] [--dir <project_dir>]"
            return 1
            ;;
        esac
    done

    if [ -z "$project_name" ]; then
        echo "Error: project name is required"
        return 1
    fi

    if command -v mamba &> /dev/null; then
        eval "$(mamba shell hook --shell=zsh)"
        mamba activate ${project_env}
    else
        echo "mamba not found in PATH"
        return 1
    fi

    open -a Zed $project_dir
    cd $project_dir
    clear
}
