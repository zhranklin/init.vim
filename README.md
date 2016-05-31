# init.vim
This is my personal setting for [Neovim](http://neovim.io).

## Install
### Neovim
Most essentially, [Install Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

Then Put the total `.config` folder in the home directory.

Then neovim will be open by the command`nvim`.


### Python modual
For using python plugins, neovim modual in python must be installed (pip2 and pip3 are needed):

```bash
sudo pip2 install --upgrade neovim
sudo pip3 install --upgrade neovim
```

tips: remember to update neovim modual and neovim itself regularly.

### Vim-plug
[vim-plug](https://github.com/junegunn/vim-plug) must be installed for automatically managing your neovim's plugins.

The installation is very easy (for only one command): [Installation](https://github.com/junegunn/vim-plug#installation)

Then enter the neovim and execute:

```vim
:PlugInstall
```

All the plugins will be installed properly

### Nyaovim
[Nyaovim](https://github.com/rhysd/NyaoVim) is a perfect GUI fore-end for neovim made by Electron, which can be easily extended. The markdown-preview is available in Nyaovim.

It's easy to install(you should firstly install npm):

```bash
npm install -g nyaovim
```

Then use the command `nyaovim` for opening it.

Or use `electron-packager` to package the NyaoVim and install it to your system's desktop(for using it as an app).

### Something about icons
For correctly show the icons, nerd-font should be installed. It's alreadily patched in the most popular programming fonts, so just pick one [here](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts), 

### Some other configuration
- All configuration file is in `~/.config/nvim/`(same as `~/.vim` for vim), and
- the initialization script is `~/.config/nvim/init.vim`(same as `~/.vimrc` for vim), and
- plugins installed by `vim-plug` are in `~/.config/nvim/plugged/`
- And the configuration files for NyaoVim are in `~/.config/nyaovim/`

It's necessary to read the total `init.vim` and read the helping files by `:h <plugin-name>` for knowing how to use all the shortcuts and plugins. Otherwise, all the configuration/plugins is meaningless for being deployed, so just try everything and make it perfect for yourself!

After getting to knowing how to use the plugins installed, the specific configuration is needed for some completion plugins:
- For using c++ completion, you should properly install clang and set the correct path of libclang and headers to enable the deoplete-clang: [deoplete-clang](https://github.com/zchee/deoplete-clang)
- For using python completion(deoplete-jedi), jedi backend should be installed by typing the command:`pip install jedi`
- For making the plugin Neomake(grammar checker/automatical compiler) do the right thing in your style, configure the neomake as you like , such as compiling arguments, etc..

## TODO
Add the description for using this.
