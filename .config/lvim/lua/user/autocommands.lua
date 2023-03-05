lvim.autocommands.custom_groups = {
  { "BufRead", "*.tex", "execute '!cd ' .. vim.fn.expand('%:p:h') .. ' && inkscape-figures watch'" }
}
