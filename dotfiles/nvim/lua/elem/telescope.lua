if not pcall(require, 'telescope') then
  return
end

local should_reload = true

local reloader = function()
  if should_reload then
    RELOAD('plenary')
    RELOAD('popup')
    RELOAD('telescope')
  end
end

reloader()

local themes = require('telescope.themes')

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {[[undodir/%.*]]},

    prompt_position = "top",

    file_sorter = require("telescope.sorters").get_fzy_sorter,

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    extensions = {
      --[[ fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true
      }, ]]
      fzf = {
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      }
    }
  }
}

pcall(require('telescope').load_extension, 'fzf_native')

local M = {}

function M.edit_config()
  require('telescope.builtin').git_files {
    prompt_title = "~ config ~",
    shorten_path = false,
    cwd = "~/.config/nixpkgs"
  }
end

function M.curbuf()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false
  }

  require('telescope.builtin').current_buffer_fuzzy_find(opts)
end

return setmetatable({}, {
  __index = function(_, k)
    reloader()

    if M[k] then
      return M[k]
    else
      return require('telescope.builtin')[k]
    end
  end
})
