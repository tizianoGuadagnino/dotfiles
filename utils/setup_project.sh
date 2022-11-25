#!/usr/bin/zsh
source ~/.zshrc
PROJECT_FOLDER=$(pwd)
THIS_FOLDER=$(dirname "$(realpath $0)")
gi python cpp >> ${PROJECT_FOLDER}/.gitignore
if [ "$#" -ne 1 ]; then
    echo -n Project Name: 
    read project_name
else
    project_name=$1
fi
echo Setting up tmuxinator for project $project_name
sed s/project/$project_name/g ${THIS_FOLDER}/.tmuxinator.yml > ${PROJECT_FOLDER}/.tmuxinator.yml
echo "\n.tmuxinator.yml" >> .gitignore
