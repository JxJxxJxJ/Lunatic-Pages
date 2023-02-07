local cmp_ok, cmp = pcall(require, "cmp")
local luasnip_ok, luasnip = pcall(require, "luasnip")
if cmp_ok and luasnip_ok then
  lvim.builtin.cmp.cmdline.enable = true
  lvim.builtin.cmp.sources[2] = {
    name = "nvim_lsp",
    entry_filter = function(entry)
      local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]
      if kind == "Text" then
        return false
      end
      return true
    end,
  }
  local mappings = lvim.builtin.cmp.mapping

  local is_insert_mode = function()
    ---@diagnostic disable-next-line: undefined-field
    return vim.api.nvim_get_mode().mode:sub(1, 1) == "i"
  end

  mappings["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i" })
  mappings["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" })

  mappings["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() and not luasnip.locally_jumpable(1) then
      cmp.select_next_item()
    elseif luasnip.locally_jumpable(1) then
      luasnip.jump(1)
    else
      fallback()
      return
    end

  end, { "i", "s" })

  mappings["<CR>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      local confirm_opts = vim.deepcopy(lvim.builtin.cmp.confirm_opts)
      if is_insert_mode() then -- prevent overwriting brackets
        confirm_opts.behavior = cmp.ConfirmBehavior.Insert
      end
      if cmp.confirm(confirm_opts) then
        if luasnip.locally_jumpable(1) then
          vim.schedule(function()
            luasnip.jump(1)
          end)
        end
        return -- success, exit early
      end
    end
    fallback()
  end)
end
