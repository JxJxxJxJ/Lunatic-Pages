-- ---@diagnostic disable: undefined-global

-- -- local in_comment = function()
-- --   return vim.fn["vimtex#syntax#in_comment"]() == 1
-- -- end

-- -- local in_mathzone = function()
-- --   return vim.fn["vimtex#syntax#in_mathzone"]() == 1
-- -- end

-- -- local in_text = function()
-- --   return not in_mathzone() and not in_comment()
-- -- end

-- -- local begins_line = function()
-- --   local cur_line = vim.api.nvim_get_current_line()
-- --   -- Checks if the current line consists of whitespace and then the snippet
-- --   -- TODO: Fix limitation that the snippet cannot contain whitespace itself
-- --   return #cur_line == #string.match(cur_line, "%s*[^%s]+")
-- -- end

-- -- local get_env = function(name)
-- --   return {
-- --     t({ "\\begin{" .. name .. "}", "\t" }),
-- --     i(0),
-- --     t({ "", "\\end{" .. name .. "}" }),
-- --   }
-- -- end

return {
  -- Custom environment using LaTeX redefinitions.
  s({
    trig = ";defi",
    dscr = "Inicia el definition environment.",
    regTrig = false,
    priority = 1000,
    snippetType = "autosnippet"

  }, fmt(
  -- String of text
    [[
\dfn{<>}{<>}

<>
]]   ,
    { -- Nodes
      i(1, "Nombre:"),
      i(2, "Contenido:"),
      i(0),
    },
    { -- Establezco que <> son los delimiters
      delimiters = "<>"
    }
  )
  ),

  --   s(
  --     {
  --       trig = ";prob",
  --       dscr = "Inicia el problem environment.",
  --       regTrig = false,
  --       priority = 1000,
  --       snippetType = "autosnippet"
  --     },
  --     fmt(
  --     -- String of text
  --       [[
  -- \prob{<>}{<>}

  -- <>
  -- ]]     ,
  --       { -- Nodes
  --         i(1, "Nombre:"),
  --         i(2, "Contenido:"),
  --         i(0),
  --       },
  --       { -- Establezco que <> son los delimiters
  --         delimiters = "<>"
  --       }
  --     )
  --   ),

  --   s(
  --     {
  --       trig = ";preg",
  --       dscr = "Inicia el question environment.",
  --       regTrig = false,
  --       priority = 1000,
  --       snippetType = "autosnippet"
  --     },
  --     fmt(
  --     -- String of text
  --       [[
  -- \qs{<>}{<>}

  -- <>
  -- ]]     ,
  --       { -- Nodes
  --         i(1, "Nombre:"),
  --         i(2, "Contenido:"),
  --         i(0),
  --       },
  --       { -- Establezco que <> son los delimiters
  --         delimiters = "<>"
  --       }
  --     )
  --   ),

  --   s(
  --     {
  --       trig = ";sol",
  --       dscr = "Inicia el solution environment.",
  --       regTrig = false,
  --       priority = 1000,
  --       snippetType = "autosnippet"
  --     },
  --     fmt(
  --     -- String of text
  --       [[
  -- \sol{<>}

  -- <>
  -- ]]     ,
  --       { -- Nodes
  --         i(1, "Contenido:"),
  --         i(0),
  --       },
  --       { -- Establezco que <> son los delimiters
  --         delimiters = "<>"
  --       }
  --     )
  --   ),

  --   s(
  --     {
  --       trig = ";nota",
  --       dscr = "Inicia el question environment.",
  --       regTrig = false,
  --       priority = 1000,
  --       snippetType = "autosnippet"
  --     },
  --     fmt(
  --     -- String of text
  --       [[
  -- \nt{<>}

  -- <>
  -- ]]     ,
  --       { -- Nodes
  --         i(1, "Contenido:"),
  --         i(0),
  --       },
  --       { -- Establezco que <> son los delimiters
  --         delimiters = "<>"
  --       }
  --     )
  --   ),

  --   s(
  --     {
  --       trig = ";obs",
  --       dscr = "Inicia el claim environment.",
  --       regTrig = false,
  --       priority = 1000,
  --       snippetType = "autosnippet"
  --     },
  --     fmt(
  --     -- String of text
  --       [[
  -- \clm{<>}{}{<>}

  -- <>
  -- ]]     ,
  --       { -- Nodes

  --         i(1, "Nombre:"),
  --         i(2, "Contenido:"),
  --         i(0),
  --       },
  --       { -- Establezco que <> son los delimiters
  --         delimiters = "<>"
  --       }
  --     )
  --   ),

  --   s(
  --     {
  --       trig = ";ej",
  --       dscr = "Inicia el example environment.",
  --       regTrig = false,
  --       priority = 1000,
  --       snippetType = "autosnippet"
  --     },
  --     fmt(
  --     -- String of text
  --       [[
  -- \ex{<>}{<>}

  -- <>
  -- ]]     ,
  --       { -- Nodes

  --         i(1, "Nombre:"),
  --         i(2, "Contenido:"),
  --         i(0),
  --       },
  --       { -- Establezco que <> son los delimiters
  --         delimiters = "<>"
  --       }
  --     )
  --   ),

  --   s(
  --     {
  --       trig = ";teo",
  --       dscr = "Inicia el theorem environment.",
  --       regTrig = false,
  --       priority = 1000,
  --       snippetType = "autosnippet"
  --     },
  --     fmt(
  --     -- String of text
  --       [[
  -- \thm{<>}{<>}

  -- <>
  -- ]]     ,
  --       { -- Nodes

  --         i(1, "Nombre:"),
  --         i(2, "Contenido:"),
  --         i(0),
  --       },
  --       { -- Establezco que <> son los delimiters
  --         delimiters = "<>"
  --       }
  --     )
  --   ),

  --   s(
  --     {
  --       trig = ";demo",
  --       dscr = "Inicia el myproof environment.",
  --       regTrig = false,
  --       priority = 1000,
  --       snippetType = "autosnippet"
  --     },
  --     fmt(
  --     -- String of text
  --       [[
  -- \begin{myproof}

  -- <>

  -- \end{myproof}

  -- <>
  -- ]]     ,
  --       { -- Nodes

  --         i(1, "Contenido:"),
  --         i(0),
  --       },
  --       { -- Establezco que <> son los delimiters
  --         delimiters = "<>"
  --       }
  --     )
  --   ),

  --   s(
  --     {
  --       trig = ";corol",
  --       dscr = "Inicia el cor environment.",
  --       regTrig = false,
  --       priority = 1000,
  --       snippetType = "autosnippet"
  --     },
  --     fmt(
  --     -- String of text
  --       [[
  -- \cor{<>}{<>}

  -- <>
  -- ]]     ,
  --       { -- Nodes

  --         i(1, "Nombre:"),
  --         i(2, "Contenido:"),
  --         i(0),
  --       },
  --       { -- Establezco que <> son los delimiters
  --         delimiters = "<>"
  --       }
  --     )
  --   ),

  --   s(
  --     {
  --       trig = ";lema",
  --       dscr = "Inicia el mlenma environment.",
  --       regTrig = false,
  --       priority = 1000,
  --       snippetType = "autosnippet"
  --     },
  --     fmt(
  --     -- String of text
  --       [[
  -- \mlenma{<>}{<>}

  -- <>
  -- ]]     ,
  --       { -- Nodes

  --         i(1, "Nombre:"),
  --         i(2, "Contenido:"),
  --         i(0),
  --       },
  --       { -- Establezco que <> son los delimiters
  --         delimiters = "<>"
  --       }
  --     )
  --   ),

  --   s(
  --     {
  --       trig = ";prop",
  --       dscr = "Inicia el mprop environment.",
  --       regTrig = false,
  --       priority = 1000,
  --       snippetType = "autosnippet"
  --     },
  --     fmt(
  --     -- String of text
  --       [[
  -- \mprop{<>}{<>}

  -- <>
  -- ]]     ,
  --       { -- Nodes
  --         i(1, "Nombre:"),
  --         i(2, "Contenido:"),
  --         i(0),
  --       },
  --       { -- Establezco que <> son los delimiters
  --         delimiters = "<>"
  --       }
  --     )
  --   ),

  --   -- Steps
  --   s(
  --     {
  --       trig = ";steps",
  --       dscr = "pasos logicos",
  --       regTrig = false,
  --       priority = 1000,
  --       snippetType = "autosnippet"
  --     },
  --     fmt(
  --     -- String of text
  --       [[

  -- \steps{

  -- <>

  -- }
  -- ]]     ,
  --       { -- Nodes
  --         i(1, "Contenido"),
  --       },
  --       { -- Establezco que <> son los delimiters
  --         delimiters = "<>"
  --       }
  --     )
  --   ),

  --   -- Lstep
  --   s(
  --     {
  --       trig = ";lstep",
  --       dscr = "=== { } mas facil.",
  --       regTrig = false,
  --       priority = 1000,
  --       snippetType = "autosnippet"
  --     },
  --     fmt(
  --     -- String of text
  --       [[

  -- \lstep{<>}

  -- <>
  -- ]]     ,
  --       { -- Nodes
  --         i(1, "Contenido"),
  --         i(0),
  --       },
  --       { -- Establezco que <> son los delimiters
  --         delimiters = "<>"
  --       }
  --     )
  --   ),
  --   -- LaTeX: Code Enviroments using minted
  --   s(
  --     {
  --       trig = ";src",
  --       dscr = "Inicia el code environment.",
  --       regTrig = false,
  --       priority = 1000,
  --       snippetType = "autosnippet"
  --     },
  --     fmt(
  --     -- String of text
  --       [[
  --     \begin{<>code}

  --     <>

  --     \end{<>code}
  --     ]] ,
  --       { -- Nodes
  --         i(1),
  --         i(2, "Codigo:"),
  --         rep(1),
  --       },
  --       { -- Establezco que <> son los delimiters
  --         delimiters = "<>"
  --       }
  --     )
  --   ),
  --   s(
  --     {
  --       trig = ";code",
  --       dscr = "Inicia el code environment.",
  --       regTrig = false,
  --       priority = 1000,
  --       snippetType = "autosnippet"
  --     },
  --     fmt(
  --     -- String of text
  --       [[
  --     \begin{<>code}

  --     <>

  --     \end{<>code}
  --     ]] ,
  --       { -- Nodes
  --         i(1),
  --         i(2, "Codigo:"),
  --         rep(1),
  --       },
  --       { -- Establezco que <> son los delimiters
  --         delimiters = "<>"
  --       }
  --     )
  --   ),

}
