# nvim-indentsmart

A Neovim plugin for navigating code based on indentation

## Usage

```lua
-- This is the default configuration
require("indentsmart").setup {
  set_mappings = true,
}
```

## Functions

All of these can be accessed as fields of the global table `IndentSmart`.

- `go_up()` (default mapping = `[k`):
