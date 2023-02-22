---@diagnostic disable: undefined-global

return {
  s({ -- Table 1: snippet parameters
    trig = "generate-preamble",
    dscr = "Añade lo basico para comenzar a escribir un documento.",
    regTrig = false,
    priority = 1000,
    snippetType = "autosnippet"
  }, -- Table 2: snippet nodes
    fmt(-- Uso fmt para que lo que ponga abajo sea mas parecido a lo generado por el snippet.
    -- [[ ]] are for multiline of text
      [[
\documentclass{report}


\input{\string~/mi-preamble-latex/preamble.tex}
\input{\string~/mi-preamble-latex/macros.tex}
\input{\string~/mi-preamble-latex/letterfonts.tex}


\tittle{\Huge{<>}\\<>}
\autohor{\Huge{<>}}
\date{<>}

\begin{document}

\maketitle
\newpage
\pdfbookmark[section]{\contentsname}{toc}
\tableofcontents
\pagebreak

\chapter{<>}
\section{<>}

<>

  ]]   ,
      -- The insert node is placed in the <> angle brackets
      { -- Nodes in each delimitier, in this case "<>"
        i(1, "Título:"),
        i(2, "Subtítulo:"),
        i(3, "Autor:"),
        f(function()
          return os.date("%d-%m-%Y")
        end),
        i(5, "Capítulo:"),
        i(6, "Sección: "),
        i(0),
      },
      -- This is where I specify that angle brackets are used as node positions.
      { delimiters = "<>" }
    )
  )
}
