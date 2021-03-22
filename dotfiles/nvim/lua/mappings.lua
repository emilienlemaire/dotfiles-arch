--[[--
File              : mappings.lua
Date              : 23.02.2021
Last Modified Date: 23.02.2021
--]]--
local utils = require('utils')

local options = {
  noremap = true,
  silent = true
}

--{{{ genarals
utils.map_lua('n', '<leader>rl', [[require'utils'.reload_plugins()]], options)
--}}}

--{{{ cmake
utils.map('n', '<leader>b', ':CMakeBuild<cr>', options)
utils.map('n', '<leader>g',
':CMakeGenerate -DCMAKE_EXPORT_COMPILE_COMMANDS=1 <cr>',
options)
--}}}

--{{{ completion_nvim
utils.map('i', '<CR>', [[v:lua.utils.completion_confirm()]], {expr = true})
utils.map('i', '<Tab>',
  [[pumvisible() ? "\<C-n>" : vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>']],
  {expr = true}
)
utils.map('i', '<S-Tab>',
  [[ pumvisible() ? "\<C-p>" : vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']],
  {expr = true}
)
-- }}}

-- {{{ vsnip
utils.map('i', '<C-j>', [[vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>']], {expr = true})
utils.map('s', '<C-j>', [[vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>']], {expr = true})

utils.map('i', '<C-j>', [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']], {expr = true})
utils.map('s', '<C-j>', [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']], {expr = true})

utils.map('s', '<Tab>', [[vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : <Tab>]], {expr = true})
utils.map('s', '<S-Tab>', [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : <Tab>]], {expr = true})
-- }}}

-- {{{ diagnostics
utils.map_lua('n', '<leader>dn', [[vim.lsp.diagnostic.goto_next()]], options)
utils.map_lua('n', '<leader>dp', [[vim.lsp.diagnostic.goto_prev()]], options)
-- }}}

-- {{{ EasyAlign
utils.map('x', 'ga', '<Plug>(EasyAlign)')
utils.map('n', 'ga', '<Plug>(EasyAlign)')
-- }}}

-- {{{ Floaterm
utils.map('n', '<leader>tg', ':FloatermNew lazygit<cr>', options)
-- }}}

-- {{{ lsp
utils.map_lua('n', '<c-]>', [[vim.lsp.buf.definition()]], options)
utils.map_lua('n', 'gD', [[vim.lsp.buf.implementation()]], options)
utils.map_lua('n', '<c-K>', [[vim.lsp.buf.signature_help()]], options)
utils.map_lua('n', 'gT', [[vim.lsp.buf.type_definition()]], options)
utils.map_lua('n', 'grf', [[vim.lsp.buf.references()]], options)
utils.map_lua('n', 'g0', [[vim.lsp.buf.document_symbol()]], options)
utils.map_lua('n', 'gW', [[vim.lsp.buf.workspace_symbol()]], options)
utils.map('n', '<leader>sh', ':ClangdSwitchSourceHeader<cr>', options)
-- }}}

-- {{{ ripple
utils.map('n', '<leader>sr', '<Plug>(ripple_send_motion)ip')
-- }}}
--
-- {{{ telescope
utils.map_lua('n', '<leader>sf', [[require'telescope.builtin'.git_files{}]])
utils.map_lua('n', '<leader>p', [[require'telescope.builtin'.find_files{}]])
utils.map_lua('n', '<leader>rg', [[require'telescope.builtin'.live_grep{}]])
utils.map_lua('n', '<leader>ls', [[require'telescope.builtin'.lsp_references{}]])
-- }}}
--
-- {{{ dap
utils.map_lua('n', '<F5>', [[require'elem.dap'.start_c_debugger()]], options)
utils.map_lua('n', '<F10>', [[require'dap'.step_over()]], options)
utils.map_lua('n', '<F11>', [[require'dap'.step_into()]], options)
utils.map_lua('n', '<F12>', [[require'dap'.step_out()]], options)
utils.map_lua('n', '<F9>', [[require'dap'.toggle_breakpoint()]], options)
utils.map_lua('n', '<leader>dr', [[require'dap'.repl.open()]], options)
utils.map_lua('n', '<leader>dl', [[require'dap'.run_last()]], options)
-- }}}

-- {{{ lspsaga
utils.map_lua('n', 'gh', [[require'lspsaga.provider'.lsp_finder()]], options)
utils.map_lua('n', '<leader>ca', [[require('lspsaga.codeaction').code_action()]], options)
utils.map('v', '<leader>ca', [[<cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()]], options)
utils.map_lua('n', 'K', [[require'lspsaga.hover'.render_hover_doc()]], options)
utils.map_lua('n', '<C-f>', [[require'lspsaga.action'.smart_scroll_with_saga(1)]], options)
utils.map_lua('n', '<C-b>', [[require'lspsaga.action'.smart_scroll_with_saga(-1)]], options)
utils.map_lua('n', 'gs', [[require'lspsaga.signaturehelp'.signature_help()]], options)
utils.map_lua('n', '<leader>rn', [[require'lspsaga.rename'.rename()]], options)
utils.map_lua('n', 'gd', [[require'lspsaga.provider'.preview_definition()]], options)
utils.map_lua('n', '<leader>cd', [[require'lspsaga.diagnostic'.show_line_diagnositcs()]], options)
utils.map_lua('n', '[e', [[require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()]], options)
utils.map_lua('n', ']e', [[require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()]], options)
-- }}}

-- {{{ neuron
utils.map_lua('n', '<cr>', [[require'neuron'.enter_link()]])
utils.map_lua('n', 'ni', [[require'neuron'.goto_index()]], {noremap = true})
utils.map_lua('n', 'cnn', [[require'neuron.prompt'.prompt_new_zettel()]], {noremap = true})
utils.map_lua('n', 'ne', [[require'neuron.cmd'.new_edit(require'neuron.config'.neuron_dir)]], {noremap = true})
utils.map_lua('n', 'nz', [[require'neuron.telescope'.find_zettels()]], {noremap = true})
utils.map_lua('n', 'nZ', [[require'neuron.telescope'.find_zettels({insert = true})]], {noremap = true})
utils.map_lua('n', 'nb', [[require'neuron/telescope'.find_backlinks()]], {noremap = true})
utils.map_lua('n', 'nB', [[require'neuron/telescope'.find_backlinks({insert = true})]], {noremap = true})
utils.map_lua('n', 'nt', [[require'neuron/telescope'.find_tags()]])
utils.map_lua('n', 'ns', [[require'neuron'.rib {address = "127.0.0.1:8200", verbose = true}]], {noremap = true})
utils.map_lua('n', 'n]', [[require'neuron'.goto_next_extmark()]], {noremap = true})
utils.map_lua('n', 'n[', [[require'neuron'.goto_prev_extmark()]], {noremap = true})
-- }}}
-- {{{ neofs
utils.map_lua('n', '<leader>f', [[require'neofs'.open()]], options)
-- }}}
