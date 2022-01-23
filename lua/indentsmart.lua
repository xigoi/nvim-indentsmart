local map_to_function = function(mode, lhs, name)
  vim.api.nvim_set_keymap(mode, lhs, ("<cmd>lua IndentSmart.%s()<cr>"):format(name), { noremap = true })
end

local cursor_char = function()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local col_num = cursor_pos[2]
  local line = vim.api.nvim_get_current_line()
  return line:sub(col_num + 1, col_num + 1)
end

IndentSmart = {
  config = {
    set_mappings = true,
  },

  go_up = function()
    while not (cursor_char():find "%S" or vim.fn.line "." == 1) do
      vim.cmd [[normal! k]]
    end
  end,

  setup = function(config)
    IndentSmart.config = vim.tbl_extend("force", IndentSmart.config, config)
    if IndentSmart.config.set_mappings then
      map_to_function("n", "[k", "go_up")
    end
  end,
}

return IndentSmart
