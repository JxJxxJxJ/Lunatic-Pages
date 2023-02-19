---@diagnostic disable: undefined-global

local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local in_comment = function()
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end

local in_text = function()
  return not in_mathzone() and not in_comment()
end

local in_align = function()
  return vim.fn["vimtex#env#is_inside"]("align")[1] ~= 0
end

local in_enumerate = function()
  return vim.fn["vimtex#env#is_inside"]("enumerate")[1] ~= 0
end

local in_itemize = function()
  return vim.fn["vimtex#env#is_inside"]("itemize")[1] ~= 0
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

return {
  in_mathzone = in_mathzone,
  in_comment = in_comment,
  in_text = in_text,
  in_align = in_align,
  in_enumerate = in_enumerate,
  in_itemize = in_itemize,
  begins_line = begins_line,
  -- get_env = get_env,
  -- add more functions here as needed
}
