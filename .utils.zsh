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

# remove after 
function tv() {evo_traj kitti "$1"/*poses_kitti.txt --ref "$1"/*_gt_kitti.txt -p -a}
function ctu() {touch CMakeLists.txt $1.hpp $1.cpp}
function get_trajectory() {cp $1 mid.mcap && mcap recover mid.mcap -o test.mcap && dexpy_check_odometry test.mcap --topic /kiss_icp/odometry && rm mid.mcap test.mcap}
