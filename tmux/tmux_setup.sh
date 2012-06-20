# get the dir of the current script
script_dir="$( cd "$( dirname "$0" )" && pwd )"

cp -f $script_dir/tmux-main.conf ~/.tmux.conf

platform=$(uname)

# we need to configure tmux differently depending on OS
if [[ $platform == *Darwin* ]]
then
  cat $script_dir/tmux-osx.conf >> ~/.tmux.conf
else
  cat $script_dir/tmux-linux.conf >> ~/.tmux.conf
fi

