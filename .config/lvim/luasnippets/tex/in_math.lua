---@diagnostic disable: undefined-global

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

local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local in_align = function()
  return vim.fn["vimtex#env#is_inside"]("align")[1] ~= 0
end


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
  s({ trig = "langle", snippetType = "snippet" }, { t(" \\langle ") }, { condition = in_mathzone }),
  s({ trig = "rangle", snippetType = "snippet" }, { t(" \\rangle ") }, { condition = in_mathzone }),

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

  --[[ local MATH_MODES = {
    displayed_equation = true,
    inline_formula = true,
    math_environment = true,
}
-- TS isn't updating the syntax tree on edit
local ts_utils = require("nvim-treesitter.ts_utils")
local in_math = function()
    local cur = ts_utils.get_node_at_cursor()
    while cur do
        if MATH_MODES[cur:type()] then
            return true
        end
        cur = cur:parent()
    end
    return false
end ]]
  -- local GREEK_LETTERS = {}
  -- GREEK_LETTERS["a"] = "alpha"
  -- GREEK_LETTERS["b"] = "beta"
  -- GREEK_LETTERS["d"] = "delta"
  -- GREEK_LETTERS["e"] = "eps"
  -- GREEK_LETTERS["g"] = "gamma"
  -- GREEK_LETTERS["l"] = "lam"
  -- GREEK_LETTERS["o"] = "omega"
  -- GREEK_LETTERS["s"] = "sigma"
  -- GREEK_LETTERS["t"] = "tau"
  -- LaTeX: Greek letters
  s({ trig = "alfa", }, t(" \\alpha ")),
  s({ trig = "Alfa", }, t(" \\Alpha ")),
  s({ trig = "beta", }, t(" \\beta ")),
  s({ trig = "Beta", }, t(" \\Beta ")),
  s({ trig = "delta", }, t(" \\delta ")),
  s({ trig = "Delta", }, t(" \\Delta ")),
  s({ trig = "epsilon", }, t(" \\epsilon ")),
  s({ trig = "Epsilon", }, t(" \\Epsilon ")),
  s({ trig = "gamma", }, t(" \\gamma ")),
  s({ trig = "Gamma", }, t(" \\Gamma ")),
  s({ trig = "lambda", }, t(" \\lambda ")),
  s({ trig = "Lambda", }, t(" \\Lambda ")),
  s({ trig = "omega", }, t(" \\omega ")),
  s({ trig = "Omega", }, t(" \\Omega ")),
  s({ trig = "sigma", }, t(" \\sigma ")),
  s({ trig = "Sigma", }, t(" \\Sigma ")),
  s({ trig = "tau", }, t(" \\tau ")),
  s({ trig = "Tau", }, t(" \\Tau ")),

  -- LaTeX: Number Sets
  s({ trig = "RR", snippetType = "autosnippet" }, { t(" \\RR ") }, { condition = in_mathzone }),
  s({ trig = "RN", snippetType = "autosnippet" }, { t(" \\RR^n") }, { condition = in_mathzone }),
  s({ trig = "NN", snippetType = "autosnippet" }, { t(" \\NN ") }, { condition = in_mathzone }),
  s({ trig = "ZZ", snippetType = "autosnippet" }, { t(" \\ZZ ") }, { condition = in_mathzone }),
  s({ trig = "QQ", snippetType = "autosnippet" }, { t(" \\QQ ") }, { condition = in_mathzone }),
  s({ trig = "CC", snippetType = "autosnippet" }, { t(" \\CC ") }, { condition = in_mathzone }),
  s({ trig = "PP", snippetType = "autosnippet" }, { t(" \\PP ") }, { condition = in_mathzone }),
  s({ trig = "HH", snippetType = "autosnippet" }, { t(" \\HH ") }, { condition = in_mathzone }),
  s({ trig = "FF", snippetType = "autosnippet" }, { t(" \\FF ") }, { condition = in_mathzone }),
  s({ trig = "KK", snippetType = "autosnippet" }, { t(" \\KK ") }, { condition = in_mathzone }),

  -- LaTeX: Logic
  s({ trig = "forall", snippetType = "autosnippet" }, { t(" \\forall ") }, { condition = in_mathzone }),
  s({ trig = "exists", snippetType = "autosnippet" }, { t(" \\exists ") }, { condition = in_mathzone }),
  s({ trig = "nexists", snippetType = "autosnippet" }, { t(" \\nexists ") }, { condition = in_mathzone }),
  s({ trig = "neg", snippetType = "autosnippet" }, { t(" \\neg ") }, { condition = in_mathzone }),
  s({ trig = "lor", snippetType = "autosnippet" }, { t(" \\lor ") }, { condition = in_mathzone }),
  s({ trig = "land", snippetType = "autosnippet" }, { t(" \\land ") }, { condition = in_mathzone }),
  s({ trig = "=>", snippetType = "autosnippet" }, { t(" \\Rightarrow ") }, { condition = in_mathzone }),
  s({ trig = "->", snippetType = "autosnippet" }, { t(" \\rightarrow ") }, { condition = in_mathzone }),
  s({ trig = "<-", snippetType = "autosnippet" }, { t(" \\leftarrow ") }, { condition = in_mathzone }),
  s({ trig = "<=>", snippetType = "autosnippet" }, { t(" \\LeftRightarrow ") }, { condition = in_mathzone }),
  s({ trig = "=!", snippetType = "autosnippet" }, { t(" \\neq ") }, { condition = in_mathzone }),
  s({ trig = "=/=", snippetType = "autosnippet" }, { t(" \\neq ") }, { condition = in_mathzone }),
  s({ trig = "neq", snippetType = "autosnippet" }, { t(" \\neq ") }, { condition = in_mathzone }),

  -- LaTeX: # always scaped in mathmode
  s({ trig = "#", snippetType = "autosnippet" }, { t(" \\#") }, { condition = in_mathzone }),
  -- LaTeX: Set Notation
  s({ trig = "en", snippetType = "snippet" }, { t(" \\in ") }, { condition = in_mathzone }),
  s({ trig = "inn", snippetType = "autosnippet" }, { t(" \\in ") }, { condition = in_mathzone }),
  s({ trig = "nen", snippetType = "snippet" }, { t(" \\nin ") }, { condition = in_mathzone }),
  s({ trig = "subset", snippetType = "snippet" }, { t(" \\subset ") }, { condition = in_mathzone }),
  s({ trig = "subcon", snippetType = "snippet" }, { t(" \\subset ") }, { condition = in_mathzone }),
  s({ trig = "UN", snippetType = "snippet" }, { t(" \\cup ") }, { condition = in_mathzone }),
  s({ trig = "IN", snippetType = "snippet" }, { t(" \\cap ") }, { condition = in_mathzone }),

  -- LaTeX: Spaces in mathmode
  s({ trig = "quad", snippetType = "autosnippet" }, { t(" \\quad ") }, { condition = in_mathzone }),
  s({ trig = "qd", snippetType = "autosnippet" }, { t(" \\quad ") }, { condition = in_mathzone }),
  s({ trig = ";;", snippetType = "autosnippet" }, { t(" \\; ") }, { condition = in_mathzone }),
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


  -- LaTeX: mod binary operator
  s({ trig = 'mod', regTrig = false, wordTrig = true, snippetType = "autosnippet" }, { t("\\bmod ") },
    { condition = in_mathzone }),
  -- LaTeX: counting operator
  s({ trig = 'bN', regTrig = false, wordTrig = true, snippetType = "autosnippet" }, { t("\\N ") },
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


  -- -- LaTeX: Lowercase greek letters
  -- s({ trig = ";;(%l)", regTrig = true, wordTrig = false, snippetType = "autosnippet" }, {
  --   f(function(_, snip)
  --     if GREEK_LETTERS[snip.captures[1]] then
  --     if GREEK_LETTERS[snip.captures[1]] then
  --     end
  --     return ""
  --   end),
  -- }, { condition = in_mathzone }),
  -- LaTeX: Uppercase greek letters, AA -> \alpha
  --
  --
  --
  -- s({ trig = "([^%a])([ABDEGLOST])[ABDEGLOST]", regTrig = true, wordTrig = false, snippetType = "autosnippet" }, {

  --   f(function(_, snip)
  --     local greek_letter = GREEK_LETTERS[string.lower(snip.captures[2])]
  --     if greek_letter then
  --       -- return " \\" .. greek_letter:gsub("^%l", string.upper) .. " "
  --       return snip.captures[1] .. " \\" .. greek_letter .. " "
  --     end
  --     return ""
  --   end),
  -- }, { condition = in_mathzone }),
  -- LaTeX: Comma always with space
  -- s({ trig = ",", snippetType = "autosnippet" }, t(" , ")),

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
  -- -- LaTeX: Math exponents
  -- s({ trig = "^", wordTrig = false, snippetType = "autosnippet" }, {
  --   t("^{-"),
  --   i(1),
  --   t("}"),
  -- }, { condition = in_mathzone }),
  -- LaTeX: Max Min quantifiers
  s({ trig = "bmax", wordTrig = false, snippetType = "autosnippet" }, t(" \\Max "), { condition = in_mathzone }),
  s({ trig = "Max", wordTrig = false, snippetType = "autosnippet" }, t(" \\Max "), { condition = in_mathzone }),
  s({ trig = "bmin", wordTrig = false, snippetType = "autosnippet" }, t(" \\Min "), { condition = in_mathzone }),
  s({ trig = "Min", wordTrig = false, snippetType = "autosnippet" }, t(" \\Min "), { condition = in_mathzone }),
  s({ trig = "max", wordTrig = false, snippetType = "autosnippet" }, t(" \\max "), { condition = in_mathzone }),
  s({ trig = "min", wordTrig = false, snippetType = "autosnippet" }, t(" \\min "), { condition = in_mathzone }),
  -- LaTeX: Less than or equal to
  s({ trig = "<=", wordTrig = false, snippetType = "autosnippet" }, t(" \\leq "), { condition = in_mathzone }),
  s({ trig = "leq", wordTrig = false, snippetType = "autosnippet" }, t(" \\leq "), { condition = in_mathzone }),
  -- LaTeX: Greater than or equal to
  s({ trig = ">=", wordTrig = false, snippetType = "autosnippet" }, t(" \\geq "), { condition = in_mathzone }),
  s({ trig = "geq", wordTrig = false, snippetType = "autosnippet" }, t(" \\geq "), { condition = in_mathzone }),
  -- LaTeX: Times
  s({ trig = "xx", wordTrig = false, snippetType = "autosnippet" }, t(" \\times "), { condition = in_mathzone }),
  -- LaTeX: Otimes
  s({ trig = "box", wordTrig = false, snippetType = "autosnippet" }, t(" \\bigotimes "), { condition = in_mathzone }),
  s({ trig = "ox", wordTrig = false, snippetType = "autosnippet" }, t(" \\otimes "), { condition = in_mathzone }),
  -- LaTeX: Oplus
  s({ trig = "bo+", wordTrig = false, snippetType = "autosnippet" }, t(" \\bigoplus "), { condition = in_mathzone }),
  s({ trig = "o+", wordTrig = false, snippetType = "autosnippet" }, t(" \\oplus "), { condition = in_mathzone }),
  -- LaTeX: Odot
  s({ trig = "bo.", wordTrig = false, snippetType = "autosnippet" }, t(" \\bigodot "), { condition = in_mathzone }),
  s({ trig = "o.", wordTrig = false, snippetType = "autosnippet" }, t(" \\odot "), { condition = in_mathzone }),
  -- LaTeX: Center dot
  s({ trig = "**", wordTrig = false, snippetType = "autosnippet" }, t(" \\cdot "), { condition = in_mathzone }),
  -- LaTeX: Function Composition
  s({ trig = "oo", wordTrig = false, snippetType = "snippet" }, t(" \\circ "), { condition = in_mathzone }),
  -- LaTeX: Equivalence
  s({ trig = "===", wordTrig = false, snippetType = "autosnippet" }, t(" \\equiv "), { condition = in_mathzone }),
  s({ trig = "equiv", wordTrig = true, snippetType = "autosnippet" }, t(" \\equiv "), { condition = in_mathzone }),
  -- LaTeX: To
  s({ trig = "->", wordTrig = false, snippetType = "autosnippet" }, t(" \\to "), { condition = in_mathzone }),
  s({ trig = "to", wordTrig = true, snippetType = "autosnippet" }, t(" \\to "), { condition = in_mathzone }),
  -- LaTeX: Infty
  s({ trig = "ooo", wordTrig = true, snippetType = "autosnippet" }, t(" \\infty "), { condition = in_mathzone }),
  s({ trig = "infty", wordTrig = true, snippetType = "snippet" }, t(" \\infty "), { condition = in_mathzone }),
  -- LaTeX: EmptySet
  s({ trig = "empty", wordTrig = true, snippetType = "snippet" }, t(" \\emptyset "), { condition = in_mathzone }),
  -- LaTeX: Math boldface
  s("bf", fmt([[\mathbf{{{}}}]], i(1)), { condition = in_mathzone }),
  -- LaTeX: Romanized math
  s("rm", fmt([[\mathrm{{{}}}]], i(1)), { condition = in_mathzone }),
  -- LaTeX: Math calligraphy
  s("mcal", fmt([[\mathcal{{{}}}]], i(1)), { condition = in_mathzone }),
  -- LaTeX: Math script
  s("mscr", fmt([[\mathscr{{{}}}]], i(1)), { condition = in_mathzone }),
  -- LaTeX: Math text
  s({ trig = "tt", wordTrig = true, snippettype = "autosnippet" }, fmt([[\text{{ {} }}]], i(1)),
    { condition = in_mathzone }),
  -- LaTeX: Binary operator dots
  s({ trig = "...", snippetType = "autosnippet" }, t("\\dots "), { condition = in_mathzone }),
  -- LaTeX: Cdots dots
  s({ trig = "c...", snippetType = "autosnippet" }, t("\\cdots "), { condition = in_mathzone }),
  -- LaTeX: blacktriangleright
  s({ trig = "inlist", wordTrig = false, snippetType = "autosnippet" }, t(" \\inlist "), { condition = in_mathzone }),
  -- LaTeX: better etc in mathmode
  s({ trig = "etc", wordTrig = false, snippetType = "autosnippet" }, t(" \\etc "), { condition = in_mathzone }),
  -- LaTeX: def. symbol
  s({ trig = "def", wordTrig = false, snippetType = "autosnippet" }, t(" \\dot{=} "), { condition = in_mathzone }),
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
  --
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
    end, {})
  ),
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
