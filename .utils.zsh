function submodule_for_each() {git submodule foreach 'git $@'}
function gitignore() { 
  for language in "$@"
  do
    curl -sLw n https://www.toptal.com/developers/gitignore/api/"$language" >> .gitignore
  done
}
function dclone() {rsync -azrvuh --progress tiziano@dataserver:"$1" .}
function clines() {cat $1 | wc -l}
function cfiles() {ls | wc -l}
function gdd() {git branch -D $1 && git push -u --delete origin $1}
function rbuild() {
  cd $COLCON_PREFIX_PATH/..
  if [[ $? -eq 0 ]]; then
    colcon build --symlink-install --event-handlers console_direct+ && cd -
  else
    export COLCON_PREFIX_PATH=""
    echo "rbuild | Re-source ROS2 workspace"
  fi
}

function rclean() {
  cd $COLCON_PREFIX_PATH/..
  if [[ $? -eq 0 ]]; then
    rm -r build install log && cd -
  else
    export COLCON_PREFIX_PATH=""
    echo "rclean | Re-source ROS2 workspace"
  fi
}
