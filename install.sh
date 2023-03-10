sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y -q python3-dev python3-pip wget curl nmap vim git gh 

sudo pip3 install numpy pandas scipy scikit-learn matplotlib seaborn jupyter

sudo pip3 install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user

jupyter nbextension enable toc2/main
jupyter nbextension enable collapsible_headings/main
jupyter nbextension enable code_prettify/autopep8

mkdir ~/notebooks
mkdir ~/data


# @description Install The ultimate Vim configuration (vimrc) https://github.com/amix/vimrc
# @exitcode 0 If successfull and install vimrc
# @exitcode 1 On failure
install_vimrc() {
	echo "Install vimrc"

	install_package vim
	git clone -q --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime > /dev/null
	sh ~/.vim_runtime/install_awesome_vimrc.sh
	# check if the line exist then write it in .bashrc
	grep -qxF 'alias vi=vim' ~/.bashrc || echo 'alias vi=vim' >> ~/.bashrc
}

# @description Edit vimrc for my need
# @exitcode 0 If successfull and edit vimrc
# @exitcode 1 On failure
edit_vimrc(){
    echo "Modify vimrc"

    sed -i -e 's/let g:NERDTreeWinPos = "right"/let g:NERDTreeWinPos = "left"/g' ~/.vim_runtime/vimrcs/plugins_config.vim
    touch ~/.vim_runtime/vimrcs/my_configs.vim
    echo 'set number' > ~/.vim_runtime/vimrcs/my_configs.vim
}

# @description Install Oh my zsh
# @exitcode 0 If successfull and install oh my zsh
# @exitcode 1 On failure
install_oh_my_zsh(){
	echo "Install Oh my zsh"

    install_package zsh curl wget > /dev/null
    wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -q -O oh-my-zsh-install.sh
    sed -i -e 's/exec zsh -l//g' oh-my-zsh-install.sh
    bash oh-my-zsh-install.sh
    rm -f oh-my-zsh-install.sh
}

# @description Edit config Oh my zsh
# @exitcode 0 If successfull and edit with my custom config oh my zsh
# @exitcode 1 On failure
edit_oh_my_zsh(){
    echo "Install themes for oh-my-zsh"

    # powerline10k
    #git clone -q --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
    #sed -i -e 's#ZSH_THEME="robbyrussell"#ZSH_THEME="powerlevel10k/powerlevel10k"#g' ~/.zshrc
    #zsh -i -c "source ~/.zshrc && p10k configure"

    sed -i -e 's#ZSH_THEME="robbyrussell"#ZSH_THEME="lukerandall"#g' ~/.zshrc
    zsh -i -c "source ~/.zshrc"
    mkdir ~/.oh-my-zsh/themes/minimal-theme
    cat > ~/.oh-my-zsh/themes/minimal-theme/minimal-theme.zsh-theme << EOF
local return_code="%(?..%{$fg_bold[red]%}%? %{$reset_color%})"
PROMPT='%{$fg_bold[green]%}%n@%m%{$reset_color%} %{$fg_bold[blue]%}%2~%{$reset_color%} %{$reset_color%}%B%b '
RPS1="${return_code}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=") %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%%"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_UNMERGED="?"
EOF

	zsh -i -c "source ~/.zshrc"
}


# vim Text editor
install_vimrc
edit_vimrc

# oh_my_zsh Terminal Interface
install_oh_my_zsh
edit_oh_my_zsh
