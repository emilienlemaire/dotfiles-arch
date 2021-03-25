--[[--
File              : globals.lua
Author            : Emilien Lemaire <emilien.lem@icloud.com>
Date              : 23.02.2021
Last Modified Date: 23.02.2021
Last Modified By  : Emilien Lemaire <emilien.lem@icloud.com>
--]]--
--{{
vim.g.lexima_no_default_rules = true
--}}
-- {{ completion
vim.g.completion_confirm_key = ""
vim.g.completion_enable_snippet = 'vim-vsnip'
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
-- }}
-- {{ diagnostic
vim.g.diagnostic_enable_virtual_text = true
-- }}

-- {{ Floaterm
vim.g.floaterm_keymap_new = '<F33>'
vim.g.floaterm_keymap_prev = '<F34>'
vim.g.floaterm_keymap_next = '<F35>'
vim.g.floaterm_keymap_toggle = '<F36>'
-- }}

-- {{ NERDCommenter
vim.g.NERDCompactSexyComs = true
-- }}

-- {{ vimspector
vim.g.vimspector_enable_mappings = 'HUMAN'
-- }}

-- {{ Vimtex
vim.g.tex_flavor = 'latex'
vim.g.vimtex_compiler_latexmk = {
  options = {
    '-pdf',
    '-shell-escape',
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode'
  }
}
-- }}
-- {{ ALE
vim.g.ale_linters = {
  cpp = {
    'clangtidy'
  },
  c = {
    'clangtidy'
  }
}
vim.g.ale_fixers = {
  cpp = {
    'clangtidy'
  },
  c = {
    'clangtidy'
  }
}
vim.g.ale_disable_lsp = true
vim.g.ale_linters_explicit = true
vim.g.ale_c_clangtidy_checks = {
  '-*',
  'bugprone-*',
  'cppcoreguidelines-avoid-',
  'readability-identifier-naming',
  'misc-assert-side-effect',
  'readability-container-size-empty*',
  ' modernize-*',
  '-modernize-use-trailing-return-type'
}
vim.g.ale_cpp_clangtidy_checks = {
  '-*',
  'bugprone-*',
  'cppcoreguidelines-avoid-',
  'readability-identifier-naming',
  'misc-assert-side-effect',
  'readability-container-size-empty*',
  ' modernize-*',
  '-modernize-use-trailing-return-type',
  '-modernize-use-override'
}
vim.g.ale_virtualtext_cursor = 1
vim.g.ale_sign_info = "כֿ"
vim.g.ale_sign_warning = ""
vim.g.ale_sign_error = "栗"
-- }}
--
-- {{ dap
vim.g.dap_virtual_text = true
-- }}
--
-- {{
vim.g.markdown_fenced_languages = {
  'plsql', 'sql', 'python', 'lua'
}
-- }}
-- {{ gruvbox
vim.g.gruvbox_transparent_bg = true
vim.g.gruvbox_improved_strings = true
vim.g.gruvbox_constrast_dark = 'hard'
-- }}
-- {{ auto header
vim.g.header_field_author = 'Emilien Lemaire'
vim.g.header_field_author_email = 'emilien.lem@icloud.com'
vim.g.header_auto_add_header = false
-- }}
-- {{{ space.nvim
vim.g.space_nvim_transparent_bg = true
-- }}}
