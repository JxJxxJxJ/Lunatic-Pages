---@diagnostic disable: undefined-global

local in_comment = function()
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end

local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local in_text = function()
  return not in_mathzone() and not in_comment()
end

local rec_ls
rec_ls = function()
  return sn(
    nil,
    c(1, {
      -- Order is important, sn(...) first would cause infinite loop of expansion.
      t(""),
      sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
    })
  )
end

return {
  -- LaTeX: Enumerate environment
  s("enume", {
    t("\\begin{enumerate}"),
    c(1, {
      t("[label=(\\alph*)]"),
      t("[label=(\\roman*)]"),
      t("[label=(\\arabic*)]"),
    }),
    t({ "", "\t\\item " }),
    i(2),
    d(3, rec_ls, {}),
    -- i(0),
    t({ "", "\\end{enumerate}" }),
  }, { condition = in_text and begins_line }),
  -- LaTeX: Recursive itemize
  s("itemi", {
    t({ "\\begin{itemize}", "\t\\item " }),
    i(1),
    d(2, rec_ls, {}),
    t({ "", "\\end{itemize}" })
  }, { condition = in_text and begins_line }),
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
          i(0),
        }, { condition = in_text }),
      -- LaTeX: Display math mode
      s("dm", {
        t({ "\\[", "\t" }),
        i(0),
        t({ "", "\\]" }),
      }, { condition = in_text }),
      -- LaTeX: Single-letter variables
      s(
        { trig = " ([^aeouy%$%(%)%[%]%{%}%.%,%!])([%p%s])", regTrig = true, wordTrig = false },
        f(function(_, snip)
          return " $" .. snip.captures[1] .. "$" .. snip.captures[2]
        end),
        { condition = in_text }
      ),
      -- LaTeX: Quotations
      -- s('"', fmt([[``{}'']], i(1)), { condition = in_text }),
      s('"', fmt([[``{}]], i(1)), { condition = in_text }),
      -- LaTeX: Emphasis
      s("emph", fmt([[\emph{{{}}}]], i(1)), { condition = in_text }),
      -- LaTeX: Boldface
      s("bf", fmt([[\textbf{{{}}}]], i(1)), { condition = in_text }),
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
