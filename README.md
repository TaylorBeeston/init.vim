# Taylor's Neovim config 🚀

(All of these install steps were done on a relatively fresh Ubuntu machine, modify as needed)
## install nvim with this config
* `mkdir ~/.config/nvim`
* `cd ~/.config/nvim`
* `gh repo clone TaylorBeeston/init.vim .`
* `sudo apt install cargo`
* Install neovim: "sudo apt install neovim" got me a version that was too old, so I installed using bob
  * `sudo apt install libssl-dev` - dependency for bob
  * `cargo install --git https://github.com/MordechaiHadad/bob.git`
  * add "~/.cargo/bin" to your path
    * For fish shell: `set -U fish_user_paths ~/.cargo/bin $fish_user_paths`
  * `bob install stable`
  * `bob use stable`
  * add  "~/.local/share/neovim/bin" to your path
    * For fish shell: `set -U fish_user_paths ~/.local/share/neovim/bin/ $fish_user_paths
* `cargo install ripgrep`
* `cargo install fd-find`
* `sudo apt install bat`
* Run the command at the top of "The command at the top of ~/.config/nvim/lua/pluginList.lua": `git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
* `nvim`
* `:PackerUpdate`
  * I needed to do this twice because reasons

## But wait, there's more!
I didn't have any fonts installed, so I was getting a bunch of ugly square icons with hex codes in them. To fix that, install a font!

## Font
* Download FiraCode Nerd font: https://www.nerdfonts.com/font-downloads
* `cd Downloads`
* `unzip Fira... -d ~/.fonts/`
* `fc-cache -fv`
* You'll need nonicons too:
* Download https://github.com/yamatsum/nonicons/blob/master/dist/nonicons.ttf
* `cd Downloads`
* `sudo mv nonicons.ttf /usr/share/fonts/TTF/`

## Kitty
I also started using Kitty for my terminal per Taylor's advice. "It runs on your GPU" is about all I know about it 😆
The main difference I can see is that it's slighly opaque.

* `sudo apt install kitty`
* mkdir/cd ~/.config/kitty
* `gh repo clone TaylorBeeston/kitty.conf`
