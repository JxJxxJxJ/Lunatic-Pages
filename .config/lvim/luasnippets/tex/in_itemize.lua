---@diagnostic disable: undefined-global

return {
  -- LaTeX: Recursive/notrecursive itemize
  s("itemi", {
    t({ "\\begin{itemize}", "\t\t\\item " }),
    i(1),
    -- d(2, rec_ls, {}),
    t({ "", "\\end{itemize}" })
  }, { condition = in_text and begins_line }),
  s("ii", {
    t("\\item "),
    i(1),
  }, { condition = in_text and begins_line }),
}
