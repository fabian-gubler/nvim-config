# Neovim Configuration

## Getting Started

Clone the repository:

```bash
git clone git@github.com:fabian-gubler/nvim-config.git ~/.config/nvim
```

## My Neovim Configuration
![config preview](https://raw.githubusercontent.com/fabian-gubler/nvim-config/main/doc/preview_full.png)

## Nix Environment

> [!IMPORTANT]
> **Optional: Installing additional devtools**:
> 1. **Install nix:** Instructions for installation can be found [here](https://nixos.org/download.html).
> 2. **Enable experimental features**: Flake still considered experimental, more infos [here](https://nixos.wiki/wiki/Flakes).

Enter nix development environment:

```bash
# if direnv installed
direnv allow

# without direnv installed
nix develop
```

## Reproducible Configuration
The philosophy behind this configuration is to allow for easily configurable and reproducible neovim environments using `lazy` plugin manager and `nix flakes`. Enter a directory using `direnv` and have a ready to go neovim configuration that is the same on every machine.

**Reproducibility**
```
~/.config/nvim
├── lazy-lock.json    // Lock and restore neovim plugins
├── flake.nix         // Lock neovim devtools & lua language servers
└── .envrc            // Automatically enter nix environment and install pkgs
```

## Refactoring Ideas

Using quarto with quarto-nvim for data science notebooks...

- [Neovim Repository](https://github.com/quarto-dev/quarto-nvim)
- [Tutorial Series](https://www.youtube.com/watch?v=3sj7clNowlA&list=PLabWm-zCaD1axcMGvf7wFxJz8FZmyHSJ7&index=1)

I am still deciding...

- Moving away from auto save
- Having automatic Formatting on save
