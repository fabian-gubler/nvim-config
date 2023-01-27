# Neovim Configuration
## Installation 
```bash
git clone git@github.com:fabian-gubler/nvim-config.git ~/.config/nvim
```

## My Neovim Configuration
![config preview](https://raw.githubusercontent.com/fabian-gubler/nvim-config/main/doc/preview_full.jpg)

## Possible: Move towards declarative nix configuration
- Goal would be to declare everything that should be reproducible (lsp, formatters, plugins)
- Use nixpkgs wherever possible (decouple from neovim)
- Further configuration should be in lua

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
