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
    colcon build --symlink-install --event-handlers console_direct+ --mixin compile-commands
    echo "\nrbuild | I built the current folder but no workspace was sourced\n\n"
    return
  fi
  export WORKSPACE=$(dirname $COLCON_PREFIX_PATH) 
  cd $WORKSPACE
  if [[ $? -eq 0 ]]; then
    colcon build --symlink-install --event-handlers console_direct+ --mixin compile-commands && cd -
  else
    export COLCON_PREFIX_PATH=""
    echo "rbuild | Re-source ROS2 workspace"
  fi
}

function lidar_topics(){
  mcap info $1 | grep -e PointCloud2 -e LaserScan | awk 'BEGIN {
      # Define color codes
      header_color = "\033[1;33m";
      reset_color = "\033[1;37m";
  }
  NF >= 4 {
      if (length($2) > max2) { max2 = length($2); col2[NR] = $2 }
      if (length($8) > max8) { max8 = length($8); col8[NR] = $8 }
      col2[NR] = $2;
      col8[NR] = $8;
  }
  END {
      # Print colored headers
      printf "%s%-*s       %-*s%s\n", header_color, max2, "Topic", max8, "Type", reset_color;
      printf "%-*s       %-*s\n", max2, "--------", max8, "--------";
      
      for (i = 1; i <= NR; i++) {
          printf "%-*s       %-*s\n", max2, col2[i], max8, col8[i];
      }
  }'
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
