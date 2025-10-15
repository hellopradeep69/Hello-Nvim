# Hello-Nvim

---

### Introduction

- This is neovim config namely as Hello-Nvim
- This config is made for personal use only . but still , feel free to use
- And as for keymaps Hello-Nvim use which key so you can figure it out easily !
- Also it uses [Lazy.vim](https://lazy.folke.io/) plugin manager which is beautiful and works well
- [folke , oh folke , oh my boy folke](https://youtu.be/ZWWxwwUsPNw?t=505). you get it right

---

### File Structure Overview (October 2025)

```bash

Hello-Nvim
│
├── after
│   └── ftplugin
│       ├── c.lua
│       ├── cpp.lua
│       ├── java.lua
│       └── python.lua
├── colors
│   └── custom.vim
├── init.lua
├── lazy-lock.json
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       ├── autosession.lua
│       ├── barbar.lua
│       ├── blink.lua
│       ├── colorizer.lua
│       ├── colorscheme.lua
│       ├── conform.lua
│       ├── dashboard.lua
│       ├── flash.lua
│       ├── gitsigns.lua
│       ├── grapple.lua
│       ├── grugfar.lua
│       ├── live-preview.lua
│       ├── lualine.lua
│       ├── mason.lua
│       ├── miniai.lua
│       ├── minipairs.lua
│       ├── minisurround.lua
│       ├── neo-tree.lua
│       ├── nvim-lsp.lua
│       ├── render-markdown.lua
│       ├── screenkey.lua
│       ├── session.lua
│       ├── snacks.lua
│       ├── treesitter.lua
│       ├── trouble.lua
│       ├── ts-comments.lua
│       ├── undotree.lua
│       └── whichkey.lua
├── README.md
└── snippets
    ├── css.json
    ├── html.json
    ├── java.json
    ├── markdown.json
    └── python.json
```

---

### Installation

- Lets get straight to the point **Installation**
- Follow the below mention steps

---

### Before Installation

- make sure to create a backup of your current nvim config

```bash
# required
mv ~/.config/nvim{,.bak}
# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

- or remove your config if you are risky enough

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

---

### Steps (Actual installation)

1. Linux / macos [ if you are using mac and trying to use nvim :-)]

```bash
mkdir .config/nvim
git clone https://github.com/hellopradeep69/Hello-Nvim.git ~/.config/nvim/
```

2. window

- may god have mercy on you ;-)
- just use your boring vs code .

---

### After Installation

- Remove the .git folder, so you can add it to your own repo later

```bash
rm -rf ~/.config/nvim/.git
```

- Remove README.md [ you dont need that ]

```bash
rm -rf ~/.config/nvim/README.md
```

- Start Neovim!

```bash
nvim
```

- and btw you can quit nvim using

```nvim
:q!
```

---

### Honourable mention

- if you want to try something powerfull try [Lazynvim](https://www.lazyvim.org/installation) by folke .
- or my version of Lazyvim that is almost alike Hello-Nvim [Lazyvimed](https://github.com/hellopradeep69/Lazyvimed.git).

---

## **THANK YOU**

## that's it ! HAVE A GREAT DAY

                                         with love @ hellopradeep69
