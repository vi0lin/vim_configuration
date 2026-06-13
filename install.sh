#!/bin/bash
set -x

# autocmd! BufWritePost install.sh :call RedoCommandToTerm("l")
# autocmd! BufWritePost install.sh

# arg=${1:+0}
arg=$1
if [ -n $arg ]; then
  dbg=$([[ "$1" == "debug" ]] && echo true || echo false)
fi

debug() {
  if $dbg; then
    echo "$@"
  fi
}

get_path_windows() {
  get_path_linux
  return
  # Windows home dir
  USERDIR=`wslpath "$(cmd.exe /c echo %USERPROFILE% 2>/dev/null | tr -d '\r')"`
  # Windows AppData
  # wslpath "$(cmd.exe /c echo %APPDATA% 2>/dev/null | tr -d '\r')"
  # Any windows path to linux path
  # wslpath "C:\\Users\\win"
  # Reverse: linux path to windows path
  # wslpath -w /mnt/c/Users/win
  # wslpath flags:
  # FlagMeaning(none)Windows -> Linux
  # -w Linux -> Windows
  # -m Linux -> Windows with forward slashes
  # -a Force absolute path
  echo $USERDIR
}
get_path_linux() {
  USERDIR='~'
  echo $USERDIR
}

signature="\" vim_configuration installation 2866039580"
sig_b=$signature" Begin"
sig_e=$signature" End"
debug sig_b $sig_b
debug sig_e $sig_e
get_files_with_signature() {
  unset files_with_signature
  files_with_signature=()
  for path in ${@}; do
    # path="${path/#\$USERDIR}"
    grep -q "$sig_b" $path && files_with_signature+=("$path")
  done
  debug "Files With Signature:" ${files_with_signature[@]}
  # printf -v $1 '%s\n' "${files_with_signature[@]}"
  # declare -n ref="files_with_signature"
  # eval $1=$files_with_signature[@]
}
check_signature() {
  get_files_with_signature $@
  # first_file=${@:1:1}
  for file in "$@"; do
    if [ -f $file ]; then
      first_valid_file=$file
    fi
  done
  debug first_valid_file $first_valid_file
  len=${#files_with_signature[@]}
  debug "Files With Signature:" $len
  [ $len -gt 1 ] && remove_signature ${files_with_signature[@]} && create_signature $first_valid_file
  [ $len -eq 1 ] && update_signature ${files_with_signature[@]}
  [ $len -eq 0 ] && create_signature $first_valid_file
  # [[ $len -lt 1 ]] && update_signature $@
}
create_signature() {
  debug "Create Signature" $@
  for file in "$@"; do
    local path="$file"
    # path="${path/#\$USERDIR}"
    debug "sed signature" $path
    $sudo sed -i "\$a$sig_b\n$source_command\n$sig_e" $path
  done
}
update_signature() {
  debug "Update Signature" $@
  for file in ${files_with_signature[@]}; do
    local path="$file"
    # path="${path/#\$USERDIR}"
    # sed -z "s/\(^.*$signature\).*\(^.*$signature\)/\1\n\" ${date}\n\2/g" $file
    # sed "/$sig/{N; s/$sig.*$sig/\" $date/}" $file
    debug "sed update signature" $file
    $sudo sed -i -n "/$sig_b/{:a;N;/$sig_b/!ba;N;s/.*\n/$sig_b\n$source_command\n/};p" $file
    # sed -E 's/(\d*) (.*)/\0 == \t\1-->\t\2/'
    # echo $stdin | sed -E 's/(\d*) (.*)/\0 == \t\1-->\t\2/'
  done
  # echo "${files_with_signature[@]}"
  # echo "$@" | xargs -I {} grep vim_configuration {}
  # grep "$signature" "{}"
  # grep -rlZ "test" $files
}
remove_signature() {
  debug "Remove Signature" $@
  for file in ${files_with_signature[@]}; do
    debug "sed remove signature" $file
    $sudo sed -i "/$sig_b/,/$sig_e/d" $file
  done
}
signature_exists() {
  debug "sed signature exists" $1
  $sudo sed -n "/$sig_b/q" $1 && return 0 || return 1
}

file_exists2() {
  local path="$1"
  # path="${path/#\$USERDIR}"
  [[ -e "$path" ]]
}

keep_existing() {
  unset existing
  existing=()
  for f in "$@"; do
    # f="${f##+([[:space:]])}"
    # if [[ -f $f ]]; then
    # realpath -m -- "$f"
    # echo "file exists: " $f
    file_exists2 $f && existing+=( "$f" )
  done
  # echo ${existing[@]}
  # printf -v $1 "%s\n" "${existing[@]}"
}

debug Debug: $dbg

file_exists () {
  return $(test -f $@) && return 0 || return 1
}

vimgather() {
  tmpfile="vimgather.tmp"
  # args=$@
  # printf -v "$1" '%s ' "${args[1]}" "${@:2}"
  # debug "vimgather args:" $@
  #
  # command=${@:1}
  command=${@:2}
  debug Command: $command
  if ! file_exists $tmpfile; then
    # New Line Seems To Be Impossibile
#    $vimbinary -es << VIMSCRIPT
#let variable=execute('$command')->split("\n")->map({_,v -> v->substitute('^\s*\d\+:\s*','','')})
#call writefile(variable, "$tmpfile")
#qa!
#VIMSCRIPT
    $vimbinary -e -c "redir! > $tmpfile | $command | redir END | qa!"
   # -c "redir > $tmpfile | echo execute('$command')->split(\"\\n\")->map({_,v -> v->substitute('^\s*\d\+:\s*','','')}) | redir END | qa!"
    if file_exists $tmpfile; then
      vimgather=$(cat $tmpfile)
      #printf -v "$1" '%s' "$vimgather"
      eval $1=\$vimgather
      rm $tmpfile
    fi
  else
    echo "File exists, remove it manualy."
  fi

  file_exists $tmpfile && echo $tmpfile exists. Consider removing it or change the directory and start again && exit 0 || echo "Checking Runtime Path"
  debug "Tmpfile was deleted ($tmpfile)"
}

check_os() {
  if [ -z $os ]; then
    ostype=(
      [0]=device
      [1]=mac
      [2]=win
      [3]=lin
      [4]=wsl
      [5]=unknown
    )
    debug OsType: "$OSTYPE"
    _get_os() {
      if [[ "$OSTYPE" == "linux-musl" ]]; then
        echo 0
      elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo 1
      elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
        echo 2
      elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if grep -qi microsoft /proc/version; then
          # WSL
          echo 4
        else
          # Native Linux
          echo 3
        fi
      else
        echo "Unknown operating system: $OSTYPE"
        echo 5
      fi
    }
    os=${ostype[$(_get_os)]}
    debug ShortOsType: $os
    echo -n "Installing vim_configuration"
    case  "$os" in
      "lin") echo " on linux"; get_path_linux ;;
      "mac") echo " on macintosh"; get_path_linux ;;
      "win") echo " on windows"; get_path_windows ;;
      "device") echo " on device"; get_path_linux ;;
      "wsl") echo " on wsl"; get_path_windows;;
      "unknown"|*) echo " on unknown"; get_path_linux ;;
    esac
  fi
}

install() {
  _check_binary() {
    if [[ -z $(which $1) ]]; then
      return 1
    else
      return 0
    fi
  }
  _check_binary $1 && debug "$1 found: $(which $1)" || { debug "$1 not found"; return; }
  vimbinary=$1

  plugvim="https://raw.githubusercontent.com/junegunn/vim-plug/refs/heads/master/plug.vim"
  datadir=(
    $USERDIR"_vimrc"
    $USERDIR"vimfiles/autoload"
    $USERDIR".vim/autoload"
    $USERDIR".vim/autoload"
    $USERDIR".vim/autoload"
    $USERDIR".local/share/nvim/site/autoload"
    $USERDIR".config/nvim/autoload"
    "/usr/share/vim/vimfiles"
    "/usr/share/vim/vim92"
  )
  score_paths() {
    decision=""
    for dir in ${datadir[@]}; do
      decision=$dir
    done
    echo $decision
  }
  # echo $(score_paths)
  # scriptnames=$(vimgather "redir=>variable | scriptnames | redir END")
  # vimgather scriptnames "scriptnames"
  vimgather scriptnames "echo execute('scriptnames')->split(\"\\n\")->map({_,v -> v->substitute('^\s*\d\+:\s*','','')})->join(\"\n\")"

  casualfiles=(
    "/etc/vim/vimrc"
    $USERDIR"/vimrc"
    $USERDIR"/_vimrc"
    $USERDIR"/.vimrc"
  )

  # Join Recordlists
  #scriptnames="$datadir
#$scriptnames"

  scriptnames=$(printf "%s\n%s", "$causalfiles", "$scriptnames")
  echo "scriptnames"
  echo "$scriptnames"

  keep_existing $scriptnames

  echo "existing"
  echo "$existing"

  # for scriptname in $scriptnames; do
  #   # echo "-> check for signature: " $scriptname
  #   if [ -f $scriptname ]; then
  #     echo $scriptname
  #     signature_exists $scriptname && echo $scriptname "sig found"
  #   fi
  # done
  # debug $scriptnameo
  vimplug_exists=$([[ -f plug.vim ]] && echo true || echo false)

  # &vimruntime
  vimgather vimruntime "echo split(\$VIMRUNTIME, \",\")[0]"
  debug Vimruntime: $vimruntime
  plugins=$vimruntime"/plugin/"
  echo $plugins
  plugins="${vimruntime/#$USERDIR}"
  echo $plugins
  vim_folder="$USERDIR/.vim"
  echo $vim_folder
  # vim_folder="${vim_folder/#\$USERDIR}"
  plugins=$vim_folder"/autoload/"
  echo $plugins

  vimplug_exists=$([[ -f ${plugins}plug.vim ]] && echo true || echo false)
  debug Plugins: $plugins
  # mkdir -p $vimruntime

  case "$os" in
    "lin")
      manager="apt-get"
      installations="$manager install -y fzf silversearcher-ag ripgrep"
      wget_plug_vim="wget -q $plugvim -O ${plugins}plug.vim"
      sudo="sudo"
      ;;
    "mac")
      manager="brew"
      installations="$manager install fzf the_silver_searcher ripgrep"
      wget_plug_vim="wget -q $plugvim -o ${plugins}plug.vim"
      sudo="sudo"
      ;;
    "win")
      manager="winget"
      installations="$manager install \"The Silver Searcher\" \"FZF\" \"RipGrep GNU\" "
      wget_plug_vim="curl -fLo ${plugins}plug.vim $plugvim"
      sudo="sudo"
      ;;
    "wsl")
      manager="apt-get"
      installations="$manager install -y vim curl wget fzf ripgrep silversearcher-ag"
      # wget_plug_vim="curl -fLo ${plugins}plug.vim $plugvim"
      wget_plug_vim="wget -q $plugvim -o ${plugins}plug.vim"
      sudo="sudo"
      ;;
    "device")
      manager="apk"
      installations="$manager add fzf ripgrep the_silver_searcher foot"
      wget_plug_vim="wget -q $plugvim -P ${plugins}"
      sudo="sudo"
      ;;
    "unknown"|*)
      echo "Exiting: unknown device"
      exit 1
      ;;
  esac

  echo "Installing Additional Software"
  debug Installation Instruction: $sudo $installations
  eval $sudo $installations

  if ! $vimplug_exists; then
    echo "Installing Vim Plug (plug.vim)"
    debug Download Instructions: $wget_plug_vim
    eval $wget_plug_vim
  else
    echo "Plug.vim is already installed"
    echo "Implement Check For Updates"
  fi

  echo "Installing vim_configuration (with plug.vim)"

  # check if vim_configuration got sourced
  vimgather got_sourced "try | if exists('g:vim_advantages_got_sourced') | echo g:vim_advantages_got_sourced | endif | endtry"

  # debug "Got Sourced:" $got_sourced

  # echo $got_sourced | xxd -b
  # echo "0" | xxd -b
  # echo 0 | xxd -b

  # echo "$got_sourced" | xxd -b

  $vimbinary -es -c "source ${plugins}plug.vim | call plug#begin() | Plug 'vi0lin/vim_configuration' | call plug#end() | PlugInstall | quitall"

  # [[ $got_sourced ]] && ( echo "vim_configuration Got Sourced!" ) || ( echo "vim_configuration Not Loaded"; )
  vimgather scriptnames "echo execute('scriptnames')->split(\"\\n\")->map({_,v -> v->substitute('^\s*\d\+:\s*','','')})->join(\"\n\")"

  # fallback with find / -name vim_configuration.vim
  source_command="source ${vim_folder}/plugged/vim_configuration/plugin/vim_configuration.vim"
  for scriptname in ${scriptnames[@]}; do
    if [[ $scriptname == *"vim_configuration.vim" ]]; then
      source_command="source ${scriptname}"
      break
    fi
  done
  debug "sed source_command" $source_command
  source_command=$(echo $source_command | sed 's;/;\\/;g' )
  debug source_command: $source_command

  check_signature $existing

  vimgather got_sourced "try | if exists('g:vim_advantages_got_sourced') | echo g:vim_advantages_got_sourced | endif | endtry"

  debug "Got Sourced:" $got_sourced

  [[ $got_sourced ]] && ( echo "vim_configuration Got Sourced!" ) || ( echo "vim_configuration Not Loaded"; )

}

check_os
install "vim"
install "nvim"
