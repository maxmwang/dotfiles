return {}

-- return {
--   {
--     'SirVer/ultisnips',
--     build = function()
--       vim.g.UltiSnipsExpandTrigger = '<tab>'
--       vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
--       vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
--     end,
--   },
--   {
--     'lervag/vimtex',
--     build = function()
--       vim.g.tex_flavor = 'latex'
--       vim.g.vimtex_view_method = 'zathura'
--       vim.g.vimtex_quickfix_mode = 0
--     end
--   },
--   {
--     'KeitaNakamura/tex-conceal.vim',
--     build = function()
--       vim.opt.conceallevel = 1
--       vim.g.tex_conceal = 'abdmg'
--       vim.cmd('hi Conceal ctermbg=none')
--     end,
--   }
-- }