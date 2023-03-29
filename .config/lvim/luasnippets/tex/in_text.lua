---@diagnostic disable: undefined-global

return {

      -- LaTeX: Chapter
      s({ trig = ";chap", snippetType = "autosnippet" }, {
        c(1, {
          t("\\chapter{"),
          t("\\chapter*{"),
        }),
        i(2),
        t("}"),
        i(0),
      }, { condition = in_text }),

      -- LaTeX: Section
      s({ trig = ";sec", snippetType = "autosnippet" }, {
        c(1, {
          t("\\section{"),
          t("\\section*{"),
        }),
        i(2),
        t("}"),
        i(0),
      }, { condition = in_text }),

      -- LaTeX: Subsection
      s({ trig = ";ssec", snippetType = "autosnippet" }, {
        c(1, {
          t("\\subsection{"),
          t("\\subsection*{"),
        }),
        i(2),
        t("}"),
        i(0)
      }, { condition = in_text }),

      -- LaTeX: Subsubsection
      s({ trig = ";sssec", snippetType = "autosnippet" }, {
        c(1, {
          t("\\subsubsection{"),
          t("\\subsubsection*{"),
        }),
        i(2),
        t("}"),
        i(0),
      }, { condition = in_text }),
    },
    {
      -- LaTeX: Inline math mode
      s({ trig = "mm", snippetType = "autosnippet" },
        {
          t("$ "),
          i(1),
          t(" $ "),
        }, { condition = in_text }),

      -- LaTeX: Display math mode
      s("dm", {
        t({ "\\[", "\t" }),
        i(0),
        t({ "", ".\\]" }),
      }, { condition = in_text }),

      -- LaTeX: Single-letter variables
      s(
        {
          trig = " ([^aeouAEOUY%^%A%E%O%Y%&y%s%|%$%(%=%)%[%]%{%}%.%,%!%:%?%/%\\%`%;%'%-%_])([%p%s])",
          regTrig = true,
          wordTrig = false
        }
        ,
        f(function(_, snip)
          return " $" .. snip.captures[1] .. "$" .. snip.captures[2]
        end),
        { condition = in_text }
      ),

      -- LaTeX: Quotations
      -- s('"', fmt([[``{}'']], i(1)), { condition = in_text }),
      s({ trig = '"', snippettype = "autosnippet" }, fmt([[``{}'' ]], i(1)), { condition = in_text }),

      -- LaTeX: Emphasis
      s("emph", fmt([[\emph{{{}}}]], i(1)), { condition = in_text }),

      -- LaTeX: hyperlinks
      s({ trig = ';link', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
          [[\href{ <> }{ <> } <> ]],
          {
            i(1, "Link"),
            i(2, "Description"),
            i(0),
          }
        ),
        { condition = in_text }
      ),

      -- LaTeX: Boldface
      s({ trig = "bf", priority = 4, snippetType = "autosnippet" }, fmt([[\textbf{{{}}}]], i(1)), { condition = in_text }),

      -- LaTeX: Teletype
      s("tt", fmt([[\texttt{{{}}}]], i(1)), { condition = in_text }),

      -- LaTeX: Ordinal nth
      s({ trig = "([%d$])th", regTrig = true, wordTrig = false }, {
        f(function(_, snip)
          return snip.captures[1] .. "\\tsup{th}"
        end),
      }, { condition = in_text }),

      -- LaTeX: Image
      s("img", {
        t({ "\\begin{center}", "\t\\resizebox{" }),
        i(1, "5"),
        t("in}{!}{\\includegraphics{./"),
        i(2),
        t({ "}}", "\\end{center}" }),
      }, { condition = in_text }),
      s("trig", c(1, {
        t("Ugh boring, a text node"),
        i(nil, "At least I can edit something now..."),
        f(function(args) return "Still only counts as text!!" end, {})
      }))
    }
