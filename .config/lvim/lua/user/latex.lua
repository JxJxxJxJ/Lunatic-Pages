-- This is necessary for VimTeX to load properly. The --indent-- is optional.
-- Note that most plugin managers will do this automatically.
-- vim.g.filetype.plugin.indent.on = true

-- This enables Vim's and neovim's syntax-related features. Without this, some
-- VimTeX features will not work (see --:help vimtex-requirements-- for more
-- info).
-- vim.g.syntax.enable = true

-- Viewer options: One may configure the viewer either by specifying a built-in
-- viewer method:
-- vim.g.vimtex_view_method = 'okular'
vim.g.vimtex_view_method = 'zathura'

-- -- Or with a generic interface:
-- vim.g.vimtex_view_general_viewer = 'okular'
-- vim.g.vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

-- VimTeX uses latexmk as the default compiler backend. If you use it, which is
-- strongly recommended, you probably don't need to configure anything. If you
-- want another compiler backend, you can change it as follows. The list of
-- supported backends and further explanation is provided in the documentation,
-- see --:help vimtex-compiler--.
-- vim.g.vimtex_compiler_method = 'latexmk'

-- Most VimTeX mappings rely on localleader and this can be changed with the
-- following line. The default is usually fine and is the symbol --\--.
vim.g.maplocalleader = '\\'

--
vim.g.tex_flavor = 'latex'
vim.g.vimtex_quickfix_mode = 0
vim.opt.conceallevel = 2
vim.opt.wrap = true
vim.g.tex_conceal = 'abdmg'


vim.g.vimtex_compiler_latexmk = {
  options = {
    '-shell-escape',
    -- '-verbose',
    -- '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode'
  }
}

-- vim.g.vimtex_compiler_latexmk_engines = 'luatex'
