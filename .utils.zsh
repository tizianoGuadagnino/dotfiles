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
