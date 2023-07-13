function submodule_for_each() {git submodule foreach 'git $@'}
function gitignore() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}
function dclone() {rsync -azrvuh --progress tiziano@dataserver:"$1" .}
function clines() {cat $1 | wc -l}
function cfiles() {ls | wc -l}
