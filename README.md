# My neovim config

This is mostly for me, but I keep forgetting how to configure this, so I am putting this in to remind me

first run: 
```git
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
Literally anywhere it uses absolute paths

Then open up `lua/myfuckingshit/packer.lua` and run `:so` Then `:PackerSync`. You can then exit the packer window and restart neovim.
It should now work. Though there is a change some of the stuff is outdated and needs fixing, so you can also run:
**Need to remember what to put here**

Then you can optionally add these to your bashrc:
```bash
if [ -f "$HOME/tmp/vim/curpth.util" ]; then
  cd $(cat $HOME/tmp/vim/curpth.util)
  rm -f "$HOME/tmp/vim/curpth.util"
fi
```
This is for the <leader>qc remap that allows you to exit vim into the directory of the file you were editing
I find this pretty useful when I start in a tests dir but move to the scripts inside vim.

```bash
alias vi="vim . && source ~/.bashrc"
```
This is so you can vim into the current dir then exit (with <leader>qc) into the current dir

```
alias sb="source ~/.bashrc"
```
This is optional, I just use this because typing source ~/.bashrc is annoying

And here are some useful remaps to remember

`u` does nothing. To undo use `<leader>uu`, I changed this because I kept fat fingering u when trying to insert (which was
annoying as hell).
`<leader>w` saves, I just find `:w<CR> ` quite annoying
`<leader>q` saves and exits, again just found `:wq<CR>` annoying
I haven't changed `:q!<CR>` because its not something that should be easy to do

`<leader>r` Runs the current file in a terminal window. This doesn't support all files. What you can do is enter run_code.lua
and add your file extentions and commands for them. Currently only works for single file no linker c and python. 
Though, I will be defaulting to make for c, since I consider that easier

`<leader>fa` is format all, which should format everything (it doesn't work very well, so use with caution)
`<leader>da` is delete all, I do a lot of arbitrary code testing so being able to delete all the code is pretty usefil
`<leader>df` is delete from, which deletes all the code from the current line (it might be inclusive, I can't remember)
`<leader>ca` is copy all, which copies the whole file into "+
And, as indicated earlier `<leader>qc` will exit the vim (writes the current file), but saves the path in `~/tmp/vim/curpth.util`. (Make sure 
you make `~/tmp/vim/ ` if it doesn't exist). You can run `source ~/.bashrc` or open a new terminal and `~/tmp/vim/curpth.util` is deleted 
(just the file), and you are moved to the directory you left vim with. 

`<leader>hm, hj, hp, ha` are harpoon remaps, hm opens the harpoon menu, hj, goes to the next file in the list,
hp goes to the previous, and ha adds the current file

`y` in visual mode copies to both the vim buffer and your "+ buffer (C-c, C-v buffer), so when you delete stuff, you can still
paste it in
Similarly `yy` copied the line into "+
