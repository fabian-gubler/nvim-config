# Neovim Configuration

## Getting Started

Clone the repository:

```bash
git clone git@github.com:fabian-gubler/nvim-config.git ~/.config/nvim
```
Enter nix development environment:

```bash
# if direnv installed
direnv allow

# without direnv installed
nix develop
```

## My Neovim Configuration
![config preview](https://raw.githubusercontent.com/fabian-gubler/nvim-config/main/doc/preview_full.png)

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

**Using column more often**: e.g., replace tabularize with this unix magic command (memorize before replacing)

Write the table comma separated, like

```
name,birthday,present
John Doe,1990-01-12,Coffee Mug
Jane Doe,1982-02-01,Headphones
```

For simple format select visually with `!column -s, -t`. Where -s is the
separator and -t tells column that you want a table. 

To get github-markdown tables;

1. copy the first line downwards (yyp)
2. run `s/[^,]/-/g` on the copy
3. Select it visually, and run this command `! column -s, -t -o' |`
