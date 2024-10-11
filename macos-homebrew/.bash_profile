base=$( dirname $(realpath ~/.bash_profile) )

### Load file with variables
source $base/.variables.sh

### Load file with user variables
source ~/.variables.sh

### Load file with aliases
source $base/.aliases.sh

### Load file with user aliases
source ~/.aliases.sh

### Load prompt definition
source $base/.prompt.sh

### Load file .bashrc
[ -s ~/.bashrc ] && source ~/.bashrc

### Load bash completions
source $base/bash_completions.sh
