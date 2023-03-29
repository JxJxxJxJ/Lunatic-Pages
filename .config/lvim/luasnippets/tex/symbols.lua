---@diagnostic disable: undefined-global

return {
  -- LaTeX: Binary operator dots
  s({ trig = "...", snippetType = "autosnippet" }, t(" \\dots "), { condition = in_mathzone }),
  s({ trig = "...", snippetType = "autosnippet" }, t("$\\dots$"), { condition = in_text }),
  s({ trig = "dots", snippetType = "autosnippet" }, t(" \\dots "), { condition = in_mathzone }),

  -- LaTeX: Cdots dots
  s({ trig = "c...", snippetType = "autosnippet" }, t(" \\cdots "), { condition = in_mathzone }),
  s({ trig = "c...", snippetType = "autosnippet" }, t("$\\cdots$"), { condition = in_text }),
  s({ trig = "cdots", snippetType = "autosnippet" }, t(" \\cdots "), { condition = in_mathzone }),

  -- LaTeX: More Dots
  s({ trig = "v...", snippetType = "autosnippet" }, t(" \\vdots "), { condition = in_mathzone }),
  s({ trig = "vdots", snippetType = "autosnippet" }, t(" \\vdots "), { condition = in_mathzone }),
  s({ trig = "d...", snippetType = "autosnippet" }, t(" \\ddots "), { condition = in_mathzone }),
  s({ trig = "ddots", snippetType = "autosnippet" }, t(" \\ddots "), { condition = in_mathzone }),

  -- Easy Conj
  s({ trig = 'conj', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[  \overline{<>} ]],
      {
        i(1)
      }
    ),
    { condition = in_mathzone }
  ),

  --Easy abs
  s({ trig = 'abs', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[  | <> | ]],
      {
        i(1)
      }
    ),
    { condition = in_mathzone }
  ),

  -- LaTeX: []1...[]n

  s({ trig = '(%l)1(%l)n', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[ <>_{1}, \dots, <>_n <> ]],
      {
        f(function(_, snip) return snip.captures[1] end),
        f(function(_, snip) return snip.captures[1] end),
        i(0)
      }
    ),
    { condition = in_mathzone }
  ),
  s({ trig = '(%l)1(%l)n', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[ \(<>_{1}, \dots, <>_n \) <> ]],
      {
        f(function(_, snip) return snip.captures[1] end),
        f(function(_, snip) return snip.captures[1] end),
        i(0)
      }
    ),
    { condition = in_text }
  ),


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
  s({ trig = "alpha", snippetType = "autosnippet" }, t(" \\alpha "), { condition = in_mathzone }),
  s({ trig = "Alpha", snippetType = "autosnippet" }, t(" \\Alpha "), { condition = in_mathzone }),
  s({ trig = "beta", snippetType = "autosnippet" }, t(" \\beta "), { condition = in_mathzone }),
  s({ trig = "Beta", snippetType = "autosnippet" }, t(" \\Beta "), { condition = in_mathzone }),
  s({ trig = "gamma", snippetType = "autosnippet" }, t(" \\gamma "), { condition = in_mathzone }),
  s({ trig = "Gamma", snippetType = "autosnippet" }, t(" \\Gamma "), { condition = in_mathzone }),
  s({ trig = "delta", snippetType = "autosnippet" }, t(" \\delta "), { condition = in_mathzone }),
  s({ trig = "Delta", snippetType = "autosnippet" }, t(" \\Delta "), { condition = in_mathzone }),
  s({ trig = "epsilon", snippetType = "autosnippet" }, t(" \\epsilon "), { condition = in_mathzone }),
  s({ trig = "Epsilon", snippetType = "autosnippet" }, t(" \\Epsilon "), { condition = in_mathzone }),
  s({ trig = "zeta", snippetType = "autosnippet" }, t(" \\zeta "), { condition = in_mathzone }),
  s({ trig = "Zeta", snippetType = "autosnippet" }, t(" \\Zeta "), { condition = in_mathzone }),
  s({ trig = "eta", snippetType = "autosnippet" }, t(" \\eta "), { condition = in_mathzone }),
  s({ trig = "Eta", snippetType = "autosnippet" }, t(" \\Eta "), { condition = in_mathzone }),
  s({ trig = "theta", snippetType = "autosnippet" }, t(" \\theta "), { condition = in_mathzone }),
  s({ trig = "Theta", snippetType = "autosnippet" }, t(" \\Theta "), { condition = in_mathzone }),
  s({ trig = "iota", snippetType = "autosnippet" }, t(" \\iota "), { condition = in_mathzone }),
  s({ trig = "Iota", snippetType = "autosnippet" }, t(" \\Iota "), { condition = in_mathzone }),
  s({ trig = "kappa", snippetType = "autosnippet" }, t(" \\kappa "), { condition = in_mathzone }),
  s({ trig = "Kappa", snippetType = "autosnippet" }, t(" \\Kappa "), { condition = in_mathzone }),
  s({ trig = "lambda", snippetType = "autosnippet" }, t(" \\lambda "), { condition = in_mathzone }),
  s({ trig = "Lambda", snippetType = "autosnippet" }, t(" \\Lambda "), { condition = in_mathzone }),
  s({ trig = "mu", snippetType = "autosnippet" }, t(" \\mu "), { condition = in_mathzone }),
  s({ trig = "Mu", snippetType = "autosnippet" }, t(" \\Mu "), { condition = in_mathzone }),
  s({ trig = "nu", snippetType = "autosnippet" }, t(" \\nu "), { condition = in_mathzone }),
  s({ trig = "Nu", snippetType = "autosnippet" }, t(" \\Nu "), { condition = in_mathzone }),
  s({ trig = "xi", snippetType = "autosnippet" }, t(" \\xi "), { condition = in_mathzone }),
  s({ trig = "Xi", snippetType = "autosnippet" }, t(" \\Xi "), { condition = in_mathzone }),
  s({ trig = "omicron", snippetType = "autosnippet" }, t(" o "), { condition = in_mathzone }),
  s({ trig = "Omicron", snippetType = "autosnippet" }, t(" O "), { condition = in_mathzone }),
  s({ trig = "pi", snippetType = "autosnippet" }, t(" \\pi "), { condition = in_mathzone }),
  s({ trig = "Pi", snippetType = "autosnippet" }, t(" \\Pi "), { condition = in_mathzone }),
  s({ trig = "rho", snippetType = "autosnippet" }, t(" \\rho "), { condition = in_mathzone }),
  s({ trig = "Rho", snippetType = "autosnippet" }, t(" \\Rho "), { condition = in_mathzone }),
  s({ trig = "sigma", snippetType = "autosnippet" }, t(" \\sigma "), { condition = in_mathzone }),
  s({ trig = "Sigma", snippetType = "autosnippet" }, t(" \\Sigma "), { condition = in_mathzone }),
  s({ trig = "tau", snippetType = "autosnippet" }, t(" \\tau "), { condition = in_mathzone }),
  s({ trig = "Tau", snippetType = "autosnippet" }, t(" \\Tau "), { condition = in_mathzone }),
  s({ trig = "upsilon", snippetType = "autosnippet" }, t(" \\upsilon "), { condition = in_mathzone }),
  s({ trig = "Upsilon", snippetType = "autosnippet" }, t(" \\Upsilon "), { condition = in_mathzone }),
  s({ trig = "phi", snippetType = "autosnippet" }, t(" \\phi "), { condition = in_mathzone }),
  s({ trig = "Phi", snippetType = "autosnippet" }, t(" \\Phi "), { condition = in_mathzone }),
  s({ trig = "chi", snippetType = "autosnippet" }, t(" \\chi "), { condition = in_mathzone }),
  s({ trig = "Chi", snippetType = "autosnippet" }, t(" \\Chi "), { condition = in_mathzone }),
  s({ trig = "psi", snippetType = "autosnippet" }, t(" \\psi "), { condition = in_mathzone }),
  s({ trig = "Psi", snippetType = "autosnippet" }, t(" \\Psi "), { condition = in_mathzone }),
  s({ trig = "omega", snippetType = "autosnippet" }, t(" \\omega "), { condition = in_mathzone }),
  s({ trig = "Omega", snippetType = "autosnippet" }, t(" \\Omega "), { condition = in_mathzone }),

  -- LaTeX: Number Sets
  s({ trig = "RR", snippetType = "autosnippet" }, { t(" \\RR ") }, { condition = in_mathzone }),
  s({ trig = "R2", snippetType = "autosnippet" }, { t(" \\RR^{2} ") }, { condition = in_mathzone }),
  s({ trig = "R3", snippetType = "autosnippet" }, { t(" \\RR^{3} ") }, { condition = in_mathzone }),
  s({ trig = "RN", snippetType = "autosnippet" }, { t(" \\RR^{n}") }, { condition = in_mathzone }),
  s({ trig = "NN", snippetType = "autosnippet" }, { t(" \\NN ") }, { condition = in_mathzone }),
  s({ trig = "ZZ", snippetType = "autosnippet" }, { t(" \\ZZ ") }, { condition = in_mathzone }),
  s({ trig = "ZP", snippetType = "autosnippet" }, { t(" \\ZZ_{p} ") }, { condition = in_mathzone }),
  s({ trig = "QQ", snippetType = "autosnippet" }, { t(" \\QQ ") }, { condition = in_mathzone }),
  s({ trig = "CC", snippetType = "autosnippet" }, { t(" \\CC ") }, { condition = in_mathzone }),
  s({ trig = "PP", snippetType = "autosnippet" }, { t(" \\PP ") }, { condition = in_mathzone }),
  s({ trig = "HH", snippetType = "autosnippet" }, { t(" \\HH ") }, { condition = in_mathzone }),
  s({ trig = "FF", snippetType = "autosnippet" }, { t(" \\FF ") }, { condition = in_mathzone }),
  s({ trig = "KK", snippetType = "autosnippet" }, { t(" \\KK ") }, { condition = in_mathzone }),

  -- LaTeX: Logic
  s({ trig = "forall", snippetType = "autosnippet" }, { t(" \\forall ") }, { condition = in_mathzone }),
  s({ trig = "forall", snippetType = "autosnippet" }, { t(" $\\forall$ ") }, { condition = in_text }),
  s({ trig = "FA", snippetType = "autosnippet" }, { t(" \\forall ") }, { condition = in_mathzone }),
  s({ trig = "exists", snippetType = "autosnippet" }, { t(" \\exists ") }, { condition = in_mathzone }),
  s({ trig = "exists", snippetType = "autosnippet" }, { t(" $\\exists$ ") }, { condition = in_text }),
  s({ trig = "EX", snippetType = "autosnippet" }, { t(" \\exists ") }, { condition = in_mathzone }),
  s({ trig = "nexists", snippetType = "autosnippet" }, { t(" \\nexists ") }, { condition = in_mathzone }),
  s({ trig = "nexists", snippetType = "autosnippet" }, { t(" $\\nexists$ ") }, { condition = in_text }),
  s({ trig = "NEX", snippetType = "autosnippet" }, { t(" \\nexists ") }, { condition = in_mathzone }),
  s({ trig = "neg", snippetType = "autosnippet" }, { t(" \\neg ") }, { condition = in_mathzone }),
  s({ trig = "lno", snippetType = "autosnippet" }, { t(" \\neg ") }, { condition = in_mathzone }),
  s({ trig = "lor", snippetType = "autosnippet" }, { t(" \\lor ") }, { condition = in_mathzone }),
  s({ trig = "lor", snippetType = "autosnippet" }, { t(" $\\lor$ ") }, { condition = in_text }),
  s({ trig = "land", snippetType = "autosnippet" }, { t(" \\land ") }, { condition = in_mathzone }),
  s({ trig = "land", snippetType = "autosnippet" }, { t(" $\\land$ ") }, { condition = in_text }),
  s({ trig = "=>", snippetType = "autosnippet" }, { t(" \\Rightarrow ") }, { condition = in_mathzone }),
  s({ trig = "->", snippetType = "autosnippet" }, { t(" \\rightarrow ") }, { condition = in_mathzone }),
  s({ trig = "->", snippetType = "autosnippet" }, { t(" $\\rightarrow$ ") }, { condition = in_text }),
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
  s({ trig = "inn", snippetType = "autosnippet" }, { t(" \\in ") }, { condition = in_mathzone }),
  s({ trig = "enn", snippetType = "autosnippet" }, { t(" \\in ") }, { condition = in_mathzone }),
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

  -- LaTeX: Haskell
  s({ trig = 'Ord', regTrig = false, wordTrig = true, snippetType = "autosnippet" }, { t("\\Ord ") },
    { condition = in_mathzone }),
  s({ trig = 'Eq', regTrig = false, wordTrig = true, snippetType = "autosnippet" }, { t("\\Eq ") },
    { condition = in_mathzone }),

  -- LaTeX: counting operator
  s({ trig = 'cN', regTrig = false, wordTrig = true, snippetType = "autosnippet" }, { t("\\N ") },
    { condition = in_mathzone }),
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
  s({ trig = "Ox", wordTrig = false, snippetType = "autosnippet" }, t(" \\bigotimes "), { condition = in_mathzone }),
  s({ trig = "ox", wordTrig = false, snippetType = "autosnippet" }, t(" \\otimes "), { condition = in_mathzone }),

  -- LaTeX: Oplus
  s({ trig = "bo+", wordTrig = false, snippetType = "autosnippet" }, t(" \\bigoplus "), { condition = in_mathzone }),
  s({ trig = "O+", wordTrig = false, snippetType = "autosnippet" }, t(" \\bigoplus "), { condition = in_mathzone }),
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
  s({ trig = "xto", wordTrig = true, snippetType = "autosnippet" }, { t(" \\xrightarrow{ "), i(1), t(" }") },
    { condition = in_mathzone }),

  -- LaTeX: Infty
  s({ trig = "ooo", wordTrig = true, snippetType = "autosnippet" }, t(" \\infty "), { condition = in_mathzone }),
  s({ trig = "infty", wordTrig = true, snippetType = "snippet" }, t(" \\infty "), { condition = in_mathzone }),

  -- LaTeX: EmptySet
  s({ trig = "empty", wordTrig = true, snippetType = "snippet" }, t(" \\emptyset "), { condition = in_mathzone }),


}
