# My Neovim Config

This is my personal configuration.

## Installation

1.  **Backup**: Ensure you back up your existing configuration.
2.  **Install**: Clone this repository into your Neovim configuration directory.

    **Linux / macOS:**
    ```bash
    git clone <your-repo-url> ~/.config/nvim
    ```

    **Windows (PowerShell):**
    ```powershell
    git clone <your-repo-url> $env:LOCALAPPDATA\nvim
    ```

3.  **Run**: Open Neovim (`nvim`). `lazy.nvim` will automatically bootstrap itself, download the plugin manager, and install all plugins defined in `lua/myfuckingshit/lazy.lua`.

4.  **Restart**: Once plugins are installed, restart Neovim.

## Terminal Integration

To use the `<leader>cd` functionality (exit vim and change your terminal directory), add the following to your shell configuration.

**Bash / Zsh (.bashrc / .zshrc):**
```bash
# Define a function for the neovim wrapper
n() {
    # Get the cache dir dynamically or fallback to default
    local cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/nvim"
    local path_file="$cache_dir/curpth.util"
    
    nvim "$@"
    
    if [ -f "$path_file" ]; then
        cd "$(cat "$path_file")"
        rm -f "$path_file"
    fi
}
