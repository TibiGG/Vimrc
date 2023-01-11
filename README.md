# My Personal Vim/Vimrc Setup

## How to set it up on your own machine?

If you are working within a **Linux** distribution, follow these steps. Although it is possible to set up on Mac/Windows, I have not personally tried to do it.

### Linux Setup

First, clone this repo using your favourite method (try cloning with ssh if you've never tried it before. It's a miracle). Cd into the repo.

Then, there will be two things with which you want to work with:

```bash
.vim
.vimrc
```

Now, there are two ways to set them up for yourself:

1.1.  Just copy paste them within your home directory

   ```bash
   cp -r .vim ~/.vim
   cp .vimrc ~/.vimrc
   ```

1.2. Sym-link the files into your home, so that you can keep your version up to date with mine

   ```bash
   ln -s <path-to-repo>/.vim ~/.vim
   ln -s <path-to-repo>/.vimrc ~/.vimrc
   ln -s <path-to-repo>/.ideavimrc ~/.ideavimrc
   ```

2. Afterwards, Vundle needs to be set up within the .vim directory using this command
  ```bash
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  ```

What I would recommend is for you to use the first version to get better with vim. Then, when ready, make your own repo, add these files into it & use the symlink method to keep your version up to date on your device.

### Install Plugins

I am using Vundle to set up the plugins, so just run `:PluginInstall` in normal mode within VIM and everything should be set up.
