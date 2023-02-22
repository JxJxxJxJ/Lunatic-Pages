---@diagnostic disable: undefined-global
-------------------------------
-- Somewhere in your Neovim startup, e.g. init.lua
require("luasnip").config.set_config({ -- Setting LuaSnip config

  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Enable jump back into older snippets
  history = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",

  -- Update text in repeated nodes lively, not after confirming its content
  update_events = 'TextChanged,TextChangedI',
})

-------------------------------

-- -- load the variables file
-- lvim.builtin.luasnip = vim.tbl_extend("force", lvim.builtin.luasnip, { -- Setting LuaSnip config

--   -- -- load the variables file
--   -- snip_env = require("user.my-things.luasnips.locals"),

--   -- Enable autotriggered snippets
--   enable_autosnippets = true,

--   -- Enable jump back into older snippets
--   history = true,

--   -- Use Tab (or some other key if you prefer) to trigger visual selection
--   store_selection_keys = "<Tab>",

--   -- Update text in repeated nodes lively, not after confirming its content
--   update_events = 'TextChanged,TextChangedI',
-- })
