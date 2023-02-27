---@diagnostic disable: undefined-global

return {
  -- LaTeX: Enumerate environment
  s({ trig = "enumerate", snippetType = "autosnippet" }, {
    t("\\begin{enumerate}"),
    c(1, {
      t("[label=(\\arabic*)]"),
      t("[label=(\\alph*)]"),
      t("[label=(\\roman*)]"),
    }),
    t({ "", "\t\t\\item " }),
    i(2),
    t({ "", "\t\t\\item " }),
    i(3),
    t({ "", "\t\t\\item " }),
    i(4),
    -- i(0),
    t({ "", "\\end{enumerate}" }),
  }, { condition = in_text and begins_line }),

  s({ trig = "ii", snippetType = "autosnippet" }, {
    t("\\item "),
    i(1),
  }, { condition = in_enumerate }),

}
