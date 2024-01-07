# @GNRSN Neovim config

### Goals

- Replace all features I like with VScode
- Acceptable performance
- Extendable & maintainable

### Features

##### Highlighting

- Treesitter
- Illuminate (cursor word)
- Rainbow params
- Todo-comments
- Gitsigns (git status based highlighting)
- Ccc (colorpicker + highlighting)

##### "Intellisense"

- Lsp-config (langue server)
  - Typescript tools
- Null-ls (linting)
  - Cspell
- Conform (formatting)
- Mason (installer)
- Nvim cmp + a bunch of sources (completion)
- Lua snip (snippet engines)
- Friendly snippets (snippet library)
- Neodev (neovim development/configuration)

##### Text traversal

- Leap & Flit (better f/t hopping)
- Neowords (customize w/e/b/ge behavior, e.g. support snake_case)

##### Text manipulation

- Nvim surround
- Substitute
- Yanky
- Comment.nvim

##### UI

- Noice (message router including a bunch of UI components, e.g. notifications, messages feed, cmdline as prompt)
- Dressing (replaces "native" input and select)
- Lualine
- Status-col
- Lspsaga (better menu prompt for e.g. lsp diagnostics & actions)
- Whichkey (display keybind descriptions)

##### Navigation

- Telescope (fuzzy finding)
- Harpoon (bookmarks)
- Trouble (list and step trough diagnostics)

##### File manipulation

- NeoTree

##### Project recognition

- Neoconf (project configuration file incl. parsing vscode settings.json)

#### Util plugins

##### Git

- Lazygit (git)
- Octo (github)

##### AI

- Gen.nvim (communicate with Ollama)

### Upcomming Projects

- [ ] DAP debugger
- [ ] Neoconf controlled format on save
- [ ] Vscode style combined diagnostics and hover
- [ ] Insert undo breakpoint before performing completion
