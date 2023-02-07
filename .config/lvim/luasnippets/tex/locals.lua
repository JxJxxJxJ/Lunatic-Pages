---@diagnostic disable: undefined-global

local in_comment = function()
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end

local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local in_text = function()
  return not in_mathzone() and not in_comment()
end

local begins_line = function()
  local cur_line = vim.api.nvim_get_current_line()
  -- Checks if the current line consists of whitespace and then the snippet
  -- TODO: Fix limitation that the snippet cannot contain whitespace itself
  return #cur_line == #string.match(cur_line, "%s*[^%s]+")
end

local get_env = function(name)
  return {
    t({ "\\begin{" .. name .. "}", "\t" }),
    i(0),
    t({ "", "\\end{" .. name .. "}" }),
  }
end
