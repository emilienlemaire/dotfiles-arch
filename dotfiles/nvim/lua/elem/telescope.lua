local telescope = require('telescope')

telescope.setup{
  defaults = {
    file_ignore_patterns = {[[undodir/%.*]]},

    prompt_position = "top",
    color_devicons = true,

    file_sorter = require("telescope.sorters").get_fzy_sorter,

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true
      }
    }
  }
}

pcall(require('telescope').load_extension, 'fzy_native')
