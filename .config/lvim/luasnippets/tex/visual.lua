---@diagnostic disable: undefined-global

local function has_tm_select()
  return vim.b.LUASNIP_TM_SELECT ~= nil
end

return {

  -- Visually selected bf
  s({ trig = 'bf', wordTrig = true, snippetType = "autosnippet", priority = 100 },
    {
      choice({
        -- When there is selected text
        sn(nil, {
          require('luasnip').function_node(function(_, snip)
            local selected_text = snip.env.TM_SELECTED_TEXT or {}
            local text = table.concat(selected_text, '\n')
            return "\\textbf{" .. text .. "}"
          end, {})
        }),
        -- When there is no selected text
        sn(nil, {
          t("\\textbf{"),
          i(1),
          t("}")
        }),
      }),
    },
    { condition = in_text, has_tm_select }
  ),

  -- Visually underline with colors
  s({ trig = 'ul([brg])', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    {
      require('luasnip').function_node(function(_, snip)
        local selected_text = snip.env.TM_SELECTED_TEXT or {}
        local text = table.concat(selected_text, '\n')
        return "\\ul" .. snip.captures[1] .. "{" .. text .. "}"
      end, {})
    },
    { condition = has_tm_select, in_text }
  ),

  -- Visually change colors
  s({ trig = 'vcc([brg])', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    {
      require('luasnip').function_node(function(_, snip)
        local selected_text = snip.env.TM_SELECTED_TEXT or {}
        local text = table.concat(selected_text, '\n')

        -- Define the colors
        local colors = {
          b = "myb",
          r = "myr",
          g = "myg",
        }
        -- Get the selected color or use the default (black) if not found
        local color = colors[snip.captures[1]] or "black"

        return "\\textcolor{" .. color .. "}{" .. text .. "}"
      end, {})
    },
    { condition = in_text }
  ),
}
