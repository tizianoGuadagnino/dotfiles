function submodule_for_each() {git submodule foreach 'git $@'}
function gitignore() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}
function dclone() {rsync -azrvuh --progress tiziano@dataserver:"$1" .}
