# nvim-config

## Introduction
uhhh, I just got bored of the basic LazyVim config and all its bloatware so I just made one myself

## Features : 
This nvim config is relatively minimalist and contain only the important stuff
- Integrated terminal ( leader + /)
- FuzzyFind ( leader + f)
- File explorer ( leader + e)
- Harpoon ( cntrl + e)
- Treesitter
- UndoTree
- CMP
- AutoPairs

Note: 
I might add some new plugins in the future


## Installation 
```bash
git clone --depth 1 https://github.com/enzzzh/nvim-config.git
cd nvim-config
sudo cp -r nvim ~/.config
rm -fr .git
nvim
```
After this you should be in the neovim config. 
When you are in nvim, Type 
```bash
  :PackerSync
  :lua ColorMyPencils()
```
This should sync and install all the packages on your system
