-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Just for magic workflow

-- Insert mode mapping for creating figures
-- lvim.keys.insert_mode["<C-f>"] = '<Esc>:silent exec "!inkscape-figures create \\""..vim.fn.getline(".").."\\" \\""..vim.b.vimtex.root.."/figures/\\""<CR><CR>:w<CR>'
-- lvim.keys.insert_mode["<C-f>"] = {
--   '<Esc>:silent exec "!inkscape-figures create \\""..vim.fn.getline(".").."\\" \\""..vim.b.vimtex.root.."/figures/\\""<CR><CR>:w<CR>',
--   {noremap = true}
-- }
-- vim.api.nvim_set_keymap('i', '<C-f>',
--   '<Esc>:silent exec "!inkscape-figures create \\""..vim.fn.getline(".").."\\" \\""..vim.b.vimtex.root.."/figures/\\""<CR><CR>:w<CR>'
--   , { noremap = true })

-- Normal mode mapping for editing figures
-- vim.api.nvim_set_keymap('n', '<C-f>',
--   ':silent exec "!inkscape-figures edit \\""..vim.b.vimtex.root.."/figures/\\" > /dev/null 2>&1 &"<CR><CR>:redraw!<CR>',
--   { noremap = true })



-- vim.keymap.set('i', '<C-f>',
--   [[<Esc>: silent exec ".!inkscape-figures create \\""..vim.fn.getline(".").."\\" \\""..vim.b.vimtex.root.."/figures/\\""..<CR><CR>:w<CR>]]
--   , { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-f>',
--   [[: silent exec "!inkscape-figures edit \\""..vim.b.vimtex.root.."/figures/\\"" > /dev/null 2>&1 &"<CR><CR>:redraw!<CR>]]
--   , { noremap = true, silent = true })

vim.keymap.set('i', '<C-f>',
  [[ <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>]])

vim.cmd [[nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>]]
