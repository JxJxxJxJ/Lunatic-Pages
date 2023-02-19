---@diagnostic disable: undefined-global

-- -- load the variables file
-- dofile('../../lua/user/my-things/luasnips/locals.lua')

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

local GREEK_LETTERS = {}
GREEK_LETTERS["a"] = "alpha"
GREEK_LETTERS["b"] = "beta"
GREEK_LETTERS["d"] = "delta"
GREEK_LETTERS["e"] = "eps"
GREEK_LETTERS["g"] = "gamma"
GREEK_LETTERS["l"] = "lam"
GREEK_LETTERS["o"] = "omega"
GREEK_LETTERS["s"] = "sigma"
GREEK_LETTERS["t"] = "tau"



return {

  -- easy differentials in mathzone
  s({ trig = "df", snippetType = "autosnippet" },
    { t("\\diff") },
    { condition = in_mathzone }
  ),

  -- langles rangles
  s({ trig = 'lrangle', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[\langle{ <> }\rangle <> ]],
      {
        i(1),
        i(0)
      }
    ),
    { condition = in_mathzone }
  ),

  -- ff -> \frac{i(1)}{i(2)}
  s({ trig = '([^%a])ff', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[<>\frac{<>}{<>} ]],
      {
        f(function(_, snip) return snip.captures[1] end),
        i(1),
        i(2)
      }
    ),
    { condition = in_mathzone }
  ),

  -- LaTeX: Matrices
  s({ trig = "([pbv])mat_(%d)(%d)", regTrig = true, snippetType = "autosnippet" }, {
    d(1, function(_, snip)
      local type = snip.captures[1] .. "matrix"
      local rows, cols = snip.captures[2], snip.captures[3]
      local nodes = {}
      local ts = 1
      table.insert(nodes, t("\\begin{" .. type .. "}[rrrrrrrrrr]"))
      for _ = 1, rows, 1 do
        table.insert(nodes, t({ "", "\t" }))
        for _ = 1, cols, 1 do
          table.insert(nodes, i(ts))
          table.insert(nodes, t(" & "))
          ts = ts + 1
        end
        table.remove(nodes, #nodes)
        table.insert(nodes, t(" \\\\"))
      end
      table.remove(nodes, #nodes)
      table.insert(nodes, t({ "", "\\end{" .. type .. "}" }))
      return sn(1, nodes)
    end),
  }, { condition = in_mathzone }),

  -- LaTeX: Lims and stuff
  s({ trig = 'Lim', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[\lim_{ <> }^{ <> }{ <> } <>]],
      {
        i(1),
        i(2),
        i(3),
        i(0),
      }
    ),
    { condition = in_mathzone }),
  s({ trig = 'Sum', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[\sum_{ <> }^{ <> }{ <> } <>]],
      {
        i(1),
        i(2),
        i(3),
        i(0),
      }
    ),
    { condition = in_mathzone }),

  s({ trig = 'Prod', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[\prod_{ <> }^{ <> }{ <> } <>]],
      {
        i(1),
        i(2),
        i(3),
        i(0),
      }
    ),
    { condition = in_mathzone }),

  s({ trig = 'Int', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[\int{ <> }^{ <> }{ <> } <>]],
      {
        i(1),
        i(2),
        i(3),
        i(0),
      }
    ),
    { condition = in_mathzone }),

  s({ trig = 'ssum', regTrig = false, wordTrig = true, snippetType = "autosnippet" }, { t("\\sum ") },
    { condition = in_mathzone }),

  s({ trig = 'sprod', regTrig = false, wordTrig = true, snippetType = "autosnippet" }, { t("\\prod ") },
    { condition = in_mathzone }),

  -- LaTeX: easy () {}
  s({ trig = '()', regTrig = false, wordTrig = true, snippetType = "snippet" },
    fmta(
      [[\paren{ <> } <>]],
      {
        i(1),
        i(0),
      }
    )
  ),

  s({ trig = '{}', regTrig = false, wordTrig = true, snippetType = "snippet" },
    fmta(
      [[\cbrack{ <> } <>]],
      {
        i(1),
        i(0),
      }
    )
  ),

  -- LaTeX: Single-digit subscripts
  s(
    { trig = "([^%a])([abcvwxyz])([ijkn%d])", regTrig = true, wordTrig = false,
      snippetType = "autosnippet" },
    f(function(_, snip)
      return snip.captures[1] .. " " .. snip.captures[2] .. "_" .. snip.captures[3] .. " "
    end),
    { condition = in_mathzone }
  ),

  -- LaTeX: Math subscripts and superscripts
  s({ trig = "([abcvwxyz])([%_%^])", regTrig = true, snippetType = "autosnippet", wordTrig = false }, {
    f(function(_, snip)
      return snip.captures[1] .. snip.captures[2] .. "{"
    end),
    i(1),
    t("} "),
  }, { condition = in_mathzone }),

  -- LaTeX: Math exponents
  s({ trig = "^", wordTrig = false, snippetType = "autosnippet" }, {
    t("^{-"),
    i(1),
    t("}"),
  }, { condition = in_mathzone }),

  -- LaTeX: Math boldface
  s("bf", fmt([[\mathbf{{{}}}]], i(1)), { condition = in_mathzone }),

  -- LaTeX: Romanized math
  s("rm", fmt([[\mathrm{{{}}}]], i(1)), { condition = in_mathzone }),

  -- LaTeX: Math calligraphy
  s("mcal", fmt([[\mathcal{{{}}}]], i(1)), { condition = in_mathzone }),

  -- LaTeX: Math script
  s("mscr", fmt([[\mathscr{{{}}}]], i(1)), { condition = in_mathzone }),

  -- LaTeX: Math text
  s({ trig = "tt", wordTrig = true, snippetType = "autosnippet" }, fmt([[\text{{ {} }}]], i(1)),
    { condition = in_mathzone }),

  -- LaTeX: Square root
  s({ trig = "sqrt", snippetType = "autosnippet", wordTrig = false }, {
    t("\\sqrt[2]{"),
    i(1),
    t("}"),
  }, { condition = in_mathzone }),

  -- LaTeX: Vector
  s({ trig = "vec", snippetType = "autosnippet", wordTrig = false }, {
    t("\\vec{"),
    i(1),
    t("}"),
  }, { condition = in_mathzone }),
  -- LaTeX: bar
  s(
    {
      trig = "(%a)bar",
      wordTrig = false,
      regTrig = true,
      name = "bar",
      priority = 100,
      snippetType = "autosnippet",
    },
    f(function(_, snip)
      return string.format("\\overline{%s}", snip.captures[1])
    end, {}),
    { condition = in_mathzone }),

  -- LaTeX: hat
  s(
    {
      trig = "(%a)hat",
      wordTrig = false,
      regTrig = true,
      name = "hat",
      priority = 100,
      snippetType = "autosnippet",
    },
    f(function(_, snip)
      return string.format("\\hat{%s}", snip.captures[1])
    end, {})
  ),
}
