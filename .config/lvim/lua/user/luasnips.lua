---@diagnostic disable: undefined-global

require("luasnip").config.set_config({
                                       -- Setting LuaSnip config

  -- Fix dumb tab behavior supposedely
  region_check_events = 'InsertEnter',
  delete_check_events = 'InsertLeave',
  -- load the variables file
  snip_env = require("user.my-things.luasnips.locals"),
  -- Enable autotriggered snippets
  enable_autosnippets = true,
  -- Enable jump back into older snippets
  history = true,
  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
  -- Update text in repeated nodes lively, not after confirming its content
  update_events = 'TextChanged,TextChangedI',
})
