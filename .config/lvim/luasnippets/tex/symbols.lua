---@diagnostic disable: undefined-global

return {
  -- LaTeX: Binary operator dots
  s({ trig = "...", snippetType = "autosnippet" }, t(" \\dots "), { condition = in_mathzone }),
  s({ trig = "...", snippetType = "autosnippet" }, t("$\\dots$"), { condition = in_text }),

  -- LaTeX: Cdots dots
  s({ trig = "c...", snippetType = "autosnippet" }, t(" \\cdots "), { condition = in_mathzone }),
  s({ trig = "c...", snippetType = "autosnippet" }, t("$\\cdots$"), { condition = in_text }),

  -- LaTeX: listoperators
  s({ trig = "inlist", wordTrig = false, snippetType = "autosnippet" }, t("\\inlist"), { condition = in_mathzone }),
  s({ trig = "inlist", wordTrig = false, snippetType = "autosnippet" }, t("$\\inlist$"), { condition = in_text }),
  s({ trig = "|>", wordTrig = false, snippetType = "autosnippet" }, t(" \\inlist "), { condition = in_mathzone }),
  s({ trig = "|>", wordTrig = false, snippetType = "autosnippet" }, t("$\\inlist$"), { condition = in_text }),
  s({ trig = "take", wordTrig = false, snippetType = "autosnippet" }, t(" \\take "), { condition = in_mathzone }),
  s({ trig = "take", wordTrig = false, snippetType = "autosnippet" }, t("$\\take$"), { condition = in_text }),
  s({ trig = "drop", wordTrig = false, snippetType = "autosnippet" }, t(" \\drop "), { condition = in_mathzone }),
  s({ trig = "drop", wordTrig = false, snippetType = "autosnippet" }, t("$\\drop$"), { condition = in_text }),

  -- LaTeX: better etc in mathmode
  s({ trig = "etc", wordTrig = false, snippetType = "autosnippet" }, t(" \\etc "), { condition = in_mathzone }),

  -- LaTeX: def. symbol
  s({ trig = "def", wordTrig = false, snippetType = "autosnippet" }, t(" \\dot{=} "), { condition = in_mathzone }),
  s({ trig = "=.", wordTrig = false, snippetType = "autosnippet" }, t(" \\dot{=} "), { condition = in_mathzone }),
  s({ trig = "=.", wordTrig = false, snippetType = "autosnippet" }, t("$\\dot{=}$"), { condition = in_text }),

  -- LaTeX: leadsto symbol
  s({ trig = "leadsto", wordTrig = false, snippetType = "autosnippet" }, t(" \\leadsto "), { condition = in_mathzone }),
  s({ trig = "leadsto", wordTrig = false, snippetType = "autosnippet" }, t("$\\leadsto$"), { condition = in_text }),
  s({ trig = "lto", wordTrig = false, snippetType = "autosnippet" }, t(" \\leadsto "), { condition = in_mathzone }),

  -- LaTeX: lrangle
  s({ trig = "langle", snippetType = "snippet" }, { t(" \\langle ") }, { condition = in_mathzone }),
  s({ trig = "rangle", snippetType = "snippet" }, { t(" \\rangle ") }, { condition = in_mathzone }),

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
  s({ trig = "FA", snippetType = "autosnippet" }, { t(" \\forall ") }, { condition = in_mathzone }),
  s({ trig = "exists", snippetType = "autosnippet" }, { t(" \\exists ") }, { condition = in_mathzone }),
  s({ trig = "EX", snippetType = "autosnippet" }, { t(" \\exists ") }, { condition = in_mathzone }),
  s({ trig = "nexists", snippetType = "autosnippet" }, { t(" \\nexists ") }, { condition = in_mathzone }),
  s({ trig = "NEX", snippetType = "autosnippet" }, { t(" \\nexists ") }, { condition = in_mathzone }),
  s({ trig = "neg", snippetType = "autosnippet" }, { t(" \\neg ") }, { condition = in_mathzone }),
  s({ trig = "lor", snippetType = "autosnippet" }, { t(" \\lor ") }, { condition = in_mathzone }),
  s({ trig = "lor", snippetType = "autosnippet" }, { t(" $\\lor$ ") }, { condition = in_text }),
  s({ trig = "land", snippetType = "autosnippet" }, { t(" \\land ") }, { condition = in_mathzone }),
  s({ trig = "land", snippetType = "autosnippet" }, { t(" $\\land$ ") }, { condition = in_text }),
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
  s({ trig = "in", snippetType = "snippet" }, { t(" \\in ") }, { condition = in_mathzone }),
  -- s({ trig = "inn", snippetType = "autosnippet" }, { t(" \\in ") }, { condition = in_mathzone }),
  s({ trig = "nen", snippetType = "snippet" }, { t(" \\nin ") }, { condition = in_mathzone }),
  s({ trig = "nin", snippetType = "snippet" }, { t(" \\nin ") }, { condition = in_mathzone }),
  s({ trig = "subset", snippetType = "snippet" }, { t(" \\subset ") }, { condition = in_mathzone }),
  s({ trig = "subcon", snippetType = "snippet" }, { t(" \\subset ") }, { condition = in_mathzone }),
  s({ trig = "UN", snippetType = "snippet" }, { t(" \\cup ") }, { condition = in_mathzone }),
  s({ trig = "union", snippetType = "snippet" }, { t(" \\cup ") }, { condition = in_mathzone }),
  s({ trig = "disjunction", snippetType = "snippet" }, { t(" \\cap ") }, { condition = in_mathzone }),
  s({ trig = "disjuncion", snippetType = "snippet" }, { t(" \\cap ") }, { condition = in_mathzone }),

  -- LaTeX: Spaces in mathmode
  s({ trig = "quad", snippetType = "autosnippet" }, { t(" \\quad ") }, { condition = in_mathzone }),
  s({ trig = "qd", snippetType = "autosnippet" }, { t(" \\quad ") }, { condition = in_mathzone }),
  s({ trig = ";;", snippetType = "autosnippet" }, { t(" \\; ") }, { condition = in_mathzone }),

  -- LaTeX: mod binary operator
  s({ trig = 'mod', regTrig = false, wordTrig = true, snippetType = "autosnippet" }, { t("\\bmod ") },
    { condition = in_mathzone }),

  -- LaTeX: counting operator
  s({ trig = 'bN', regTrig = false, wordTrig = true, snippetType = "autosnippet" }, { t("\\N ") },
    { condition = in_mathzone }),

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

}
