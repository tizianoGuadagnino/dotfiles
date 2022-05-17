#!/usr/bin/zsh
source ~/.zshrc
PROJECT_FOLDER=$1
THIS_FOLDER=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
gi python cpp >> ${PROJECT_FOLDER}/.gitignore
echo -n Project Name: 
read project_name
echo Setting up tmuxinator for project $project_name
sed s/project/$project_name/g ${THIS_FOLDER}/.tmuxinator.yml >> ${PROJECT_FOLDER}/.tmuxinator.yml
