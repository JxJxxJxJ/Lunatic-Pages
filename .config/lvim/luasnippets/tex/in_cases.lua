---@diagnostic disable: undefined-global

return {

  -- cases in text
  s({ trig = 'cases', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[
$<> = \begin{cases}
      <> &\text{si } <> \\
      <> &\text{si } <> \\
     \end{cases}$ 
      ]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
        i(5),
      }
    ),
    { condition = in_text }
  ),

  -- cases in math
  s({ trig = 'cases', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[
<> = \begin{cases}
      <> &\text{si } <> \\
      <> &\text{si } <> \\
     \end{cases} 
      ]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
        i(5),
      }
    ),
    { condition = in_math }
  ),
}
