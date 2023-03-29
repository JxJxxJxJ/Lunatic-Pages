---@diagnostic disable: undefined-global

return {

  -- align (note: it has to be used in text and without $$, it already is in mathmode)
  s({ trig = 'align', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[
\begin{align*}
    <> &= <> \\
     &= <> \\
\end{align*}

      ]],
      {
        i(1),
        i(2),
        i(3),
      }
    ),
    { condition = in_text }
  ),
  -- for quick &=
  s({ trig = "alii", snippetType = "autosnippet" }, {
    t("&= "),
    i(1),
  }, { condition = in_align }),

  -- easy newline
  s({ trig = 'nn', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[
\\
<>
      ]],
      {
        i(1),
      }
    ),
    { condition = in_align }
  ),

}
