# Taylor's Neovim config 🚀
Want to be fancy and use neovim, but don't want to have to figure out all the plugins and setup for yourself? Just steal Taylor's!

# Shortcuts
## The big ones
| Shortcut       | Pneumonic     | What it does   | Notes |
| -----------    | -----------   | ---------      | -------------            |
| {space} ef     | Explore Files | Searches files | ctrl+p, ctrl+n to move up/down the list |
| {space} rg     | Rip Grep      | Find everywhere | ctrl+p, ctrl+n to move up/down the list. This is a regex, so you'll need to do things like escape periods like \\. |
| {space} w...   | Window splits | Navigate window splits | s = split horizontal, v = split veritcal, hjkl = move focus left/down/up/right |
| {space} gd     | Go to Definition | Jumps to definition | |
| {space} gr     | Go to References | Opens references  | |
| {space} ex     | No good one, EXplore? | Explore files/directories with ranger | Need to do :q to quit ranger |
| Alt+...        | None | Navigate tabs | num keys = go to tab X, p = tab **p**icker mode (follow up with key that appears next to the tab that you want, ,. = prev/next tab, i = p**i**n tab, c = close tab |
| {space} m{letter}  | Mark | Sets a bookmark bound to that letter | {space} '{letter} = go to bookmark (\` also works), Capital {letter} is a global bookmark, lowercase is local to that file. |

Complete list of shortcuts can be found in `~/.config/nvim/lua/whichkey.lua` (newer, more readable) and `~/.config/nvim/lua/keybindings.lua` (deprecated)

## Some more
| Shortcut       | Pneumonic     | What it does   | Notes |
| -----------    | -----------   | ---------      | -------------            |
| (from ripgrep window) ctrl+q     | quickfix | Throws all results into a quickfix list | {space} \[q = jump to next quickfix item, {space} \]q = jump to previous quickfix item, {space} ts = hide quickfix list~, {space} tab (when quickfix window is focused) = close quickfix list |
| gcc     | comment | Toggles comment for line | Can be used with other vim modifiers: e.g. gc5j = comment out 6 lines (current + 5 below) |
| ysiw)   | **y**ank, **s**urround **i**nner **w**ord with **)** | Surrounds current word with parenthesis | Can be used with other vim modifiers |
| {space} cd | Check Diagnostic | Opens error message | Type cd again to enter into the window; then {space} ts (tab split) to full screen window; then {space} tab to get out |

# Install
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
The main difference I can see is that it's slighly opaque. It also allows splitting the terminal window and using multiple "tabs"

* `sudo apt install kitty`
* mkdir/cd ~/.config/kitty
* `gh repo clone TaylorBeeston/kitty.conf`

| Shortcut       | What it does | Notes |
| -----------    | ---------    | -------------            |
| ctrl+shift+tab | New tab      |   |
| ctrl+shift+left/right | Navigate between tabs     |   |
| ctrl+shift+q | Close tab      |   |
| ctrl+shift+Enter | New window (split window horizontally)      |   |
| ctrl+shift+\[/\] | Focus prev/next window      |   |
| ctrl+shift+w | Close window      | Also works for closing tabs  |

