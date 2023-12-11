# Neovim Configuration
## Installation 
```bash
git clone git@github.com:fabian-gubler/nvim-config.git ~/.config/nvim
```

## My Neovim Configuration
![config preview](https://raw.githubusercontent.com/fabian-gubler/nvim-config/main/doc/preview_full.jpg)

## Nix-based Configuration
The philosophy behind this configuration is to allow for easily configurable and reproducible neovim environments. Enter a directory and have a ready to go neovim configuration that is the same on every machine.


[Nix Neovim Wiki](https://nixos.wiki/wiki/Neovim)
[YouTube Tutorial](https://www.youtube.com/watch?v=rUvjkBuKua4)
[Neovim Flake](https://github.com/jordanisaacs/neovim-flake)

### Discussions
- [How to do it](https://www.reddit.com/r/NixOS/comments/ychz5a/nixos_and_neovim_plugins/)
- [Combination](https://www.reddit.com/r/NixOS/comments/mvk5l9/neovim_homemanager_custom_initvim/)

### Inspiration
- [Gako](https://github.com/Gako358/neovim)
- [nixed](https://github.com/water-sucks/nixed/tree/main/home/profiles/base/nvim)
- [wil](https://github.com/wiltaylor/neovim-flake)

### Refactoring Ideas

When I have the time I want to do the following things...

- Replace null-ls with [conform.nvim](https://github.com/stevearc/conform.nvim) for formatting and [nvim-lint](https://github.com/mfussenegger/nvim-lint) for linting
- Easier lsp management (also take into account nix packages)

I could consider...

- Moving away from auto save
- Having automatic Formatting on save
