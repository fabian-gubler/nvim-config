# Neovim Configuration
## Installation 
```bash
git clone git@github.com:fabian-gubler/nvim-config.git ~/.config/nvim
```

## My Neovim Configuration
![config preview](https://raw.githubusercontent.com/fabian-gubler/nvim-config/main/doc/preview_full.png)

## Reproducible Configuration
The philosophy behind this configuration is to allow for easily configurable and reproducible neovim environments using `lazy` plugin manager and `nix flakes`. Enter a directory using `direnv` and have a ready to go neovim configuration that is the same on every machine.

**Reproducibility**
```
| nvim-config
    | lazy-lock.json    // Lock and restore neovim plugins
    | flake.nix         // Lock neovim devtools & language servers
    | .envrc            // Automatically enter nix environment and install packages
```

## Refactoring Ideas

When I have the time I want to do the following things...

- Replace null-ls with [conform.nvim](https://github.com/stevearc/conform.nvim) for formatting and [nvim-lint](https://github.com/mfussenegger/nvim-lint) for linting
- Easier lsp management (instead of mason consider nix packages for lsp installation)

I am still deciding...

- Moving away from auto save
- Having automatic Formatting on save
