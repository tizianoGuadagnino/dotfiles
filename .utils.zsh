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

function roscd() {
  export PREFIX_LENGHT=$(echo $COLCON_PREFIX_PATH | wc -m)
  if [[ $PREFIX_LENGHT -eq 1 ]]; then
    echo "\nroscd | COLCON_PREFIX_PATH is not set, source workspace\n\n"
    return
  fi
  export WORKSPACE=$(dirname $COLCON_PREFIX_PATH) 
  cd $WORKSPACE
}

function set_bag(){
  export ROSBAG=$1
}

function rplay(){
 ros2 bag play --clock 1000 -p $ROSBAG
}

function rbuild() {
  export PREFIX_LENGHT=$(echo $COLCON_PREFIX_PATH | wc -m)
  if [[ $PREFIX_LENGHT -eq 1 ]]; then
    colcon build --symlink-install --event-handlers console_direct+
    echo "\nrbuild | I built the current folder but no workspace was sourced\n\n"
    return
  fi
  export WORKSPACE=$(dirname $COLCON_PREFIX_PATH) 
  cd $WORKSPACE
  if [[ $? -eq 0 ]]; then
    colcon build --symlink-install --event-handlers console_direct+ && cd -
  else
    export COLCON_PREFIX_PATH=""
    echo "rbuild | Re-source ROS2 workspace"
  fi
}

function rclean() {
  export PREFIX_LENGHT=$(echo $COLCON_PREFIX_PATH | wc -m)
  if [[ $PREFIX_LENGHT -eq 1 ]]; then
    echo "\nrclean | no workspace sourced\n\n"
    return
  fi
  export WORKSPACE=$(dirname $COLCON_PREFIX_PATH) 
  cd $WORKSPACE
  if [[ $? -eq 0 ]]; then
    rm -r build install log && cd -
  else
    export COLCON_PREFIX_PATH=""
    echo "rclean | Re-source ROS2 workspace"
  fi
}
