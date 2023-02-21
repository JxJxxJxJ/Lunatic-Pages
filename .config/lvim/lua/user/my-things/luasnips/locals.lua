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
  -- LuaSnips defaults
  s = function() return require("luasnip.nodes.snippet").S end,
  sn = function() return require("luasnip.nodes.snippet").SN end,
  isn = function() return require("luasnip.nodes.snippet").ISN end,
  t = function() return require("luasnip.nodes.textNode").T end,
  i = function() return require("luasnip.nodes.insertNode").I end,
  f = function() return require("luasnip.nodes.functionNode").F end,
  c = function() return require("luasnip.nodes.choiceNode").C end,
  d = function() return require("luasnip.nodes.dynamicNode").D end,
  r = function() return require("luasnip.nodes.restoreNode").R end,
  events = function() return require("luasnip.util.events") end,
  ai = function() return require("luasnip.nodes.absolute_indexer") end,
  extras = function() return require("luasnip.extras") end,
  l = function() return require("luasnip.extras").lambda end,
  rep = function() return require("luasnip.extras").rep end,
  p = function() return require("luasnip.extras").partial end,
  m = function() return require("luasnip.extras").match end,
  n = function() return require("luasnip.extras").nonempty end,
  dl = function() return require("luasnip.extras").dynamic_lambda end,
  fmt = function() return require("luasnip.extras.fmt").fmt end,
  fmta = function() return require("luasnip.extras.fmt").fmta end,
  conds = function() return require("luasnip.extras.expand_conditions") end,
  postfix = function() return require("luasnip.extras.postfix").postfix end,
  types = function() return require("luasnip.util.types") end,
  parse = function() return require("luasnip.util.parser").parse_snippet end,

  -- my locals
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
