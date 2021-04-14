local g = vim.g
local o = vim.o
local cmd = vim.cmd
local w = vim.wo
local b = vim.bo

local utils = require('utils')

g.mapleader = ';'

b.autoindent = true
b.expandtab = true
b.softtabstop = 4
b.shiftwidth = 4
b.tabstop = 4
b.smartindent = true
b.modeline = false
b.swapfile = false

o.backspace = [[indent,eol,start]]
o.hidden = true
w.winfixwidth = true

o.lazyredraw = true

o.splitbelow = true
o.splitright = true

w.cursorline = true
b.synmaxcol = 4000

w.number = true
w.relativenumber = true

w.list = true
if vim.fn.has('multi_byte') == 1 and vim.o.encoding == 'utf-8' then
  o.listchars = [[tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:…]]
else
  o.listchars = [[tab:> ,extends:>,precedes:<,nbsp:.,trail:_]]
end

w.colorcolumn = [[100]]
w.wrap = false

o.termguicolors = true

o.clipboard = [[unnamed,unnamedplus]]

o.scrolloff = 4

o.timeoutlen = 300

o.mouse = 'a'

if o.shell == 'fish$' then
  o.shell = [[/bin/bash]]
end


o.completeopt = [[menuone,noselect]]

-- General mappings, not depending on any plugins
vim.api.nvim_set_keymap('v', 'J', [[:m '>+1<cr>gv=gv]], {noremap = true})
vim.api.nvim_set_keymap('v', 'K', [[:m '<-2<cr>gv=gv]], {noremap = true})

vim.api.nvim_set_keymap('n', '<A-Tab>', ':tabnext<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-S-Tab>', ':tabprev<cr>', {noremap = true})

vim.api.nvim_set_keymap('n', '<Up>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Down>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Left>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Right>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})

utils.create_augroup({
  {'FileType', '*', 'setlocal', 'shiftwidth=4'},
  {'FileType', 'ocaml,lua,nix', 'setlocal', 'shiftwidth=2'},
  {'FileType', 'dap-rel', [[lua require('dap.ext.autocompl').attach()]]}
}, 'Tab2')

utils.create_augroup({
  {'BufNewFile,BufReadPost', '*.md', 'set', 'filetype=markdown'},
  {'BufRead,BufNewFile', '*.yapl', 'set', 'filetype=yapl'},
  {'BufRead,BufNewFile', '*.mli', 'set', 'filetype=ocaml_interface'}
}, 'BufE')

local home = os.getenv('HOME')

vim.api.nvim_set_var('python_host_prog', home .. '/opt/anaconda3/envs/anaconda2/bin/python')
vim.api.nvim_set_var('python3_host_prog', home .. '/opt/anaconda3/envs/anaconda3/bin/python')
vim.api.nvim_set_var('ruby_host_prog', home .. '/.gem/ruby/2.6.0/gems/neovim-0.8.1/exe/neovim-ruby-host')

vim.api.nvim_set_var('opamshare', home .. '/.opam/default/share')

vim.api.nvim_set_var('merlin_python_version', 3)

utils.add_rtp(home .. '/.opam/default/share/merlin/vim/doc')
utils.add_rtp(home .. '/.opam/default/share/merlin/vim')
utils.add_rtp(home .. '/.opam/default/share/merlin/vimbufsync')

cmd [[packadd vimball]]

local ok, _ = pcall(function() require('lsp_config') end)

if not ok then
  print("No LSP")
end

RELOAD = require('plenary.reload').reload_module

R = function(name)
  RELOAD(name)
  return require(name)
end

R('plugins')
R('nvim-web-devicons').setup()
R('gitsigns').setup()
R('lspkind').init()
R('indent_guides').setup()
RELOADER = function()
  R('elem.lspsaga')
  R('elem.nvim-compe')
  R('elem.treesitter')
  R('elem.statusline')
  R('elem.plenary')
  R('elem.telescope')
  R('elem.neuron')
  R('elem.neofs')
  R('mappings')
  R('globals')
  R('elem.dap')
end

RELOADER()

utils.map_lua('n', '<leader>rc', 'RELOADER()', {noremap = true})

cmd [[colorscheme space-nvim]]
cmd [[highlight LspDiagnosticsUnderline cterm=undercurl gui=undercurl]]

cmd [[
command! -complete=file -nargs=* DebugC lua require "elem.dap".start_c_debugger({<f-args>}, "lldb")
]]
