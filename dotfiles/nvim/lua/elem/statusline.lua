vim.cmd [[packadd express_line.nvim]]

pcall(RELOAD, 'el')

local builtin = require('el.builtin')
local extensions = require('el.extensions')
local sections = require('el.sections')
local subscribe = require('el.subscribe')

local lsp_statusline = require('el.plugins.lsp_status')

-- TODO: Spinning planet extension. Integrated w/ telescope.
-- ◐ ◓ ◑ ◒
-- 🌛︎🌝︎🌜︎🌚︎
-- Show telescope icon / emoji when you open it as well

--[[
let s:left_sep = ' ❯❯ '
let s:right_sep = ' ❮❮ '
--]]

local  generator = function()
  local el_segments = {}
  table.insert(el_segments, extensions.gen_mode {
    format_string = '[%s]'
  })

  table.insert(el_segments,
    subscribe.buf_autocmd(
      "el_git_branch",
      "BufEnter",
      function(window, buffer)
        local branch = extensions.git_branch(window, buffer)
        if branch then
          return ' ' .. extensions.git_icon() .. ' ' .. branch
        end
      end
    )
  )

  table.insert(el_segments,
    subscribe.buf_autocmd(
      "el_git_changes",
      "BufWritePost",
      function(window, buffer)
        return extensions.git_changes(window, buffer)
      end
    )
  )

  table.insert(el_segments, sections.split)

  table.insert(el_segments,
    subscribe.buf_autocmd(
      "el_file_icon",
      "BufRead",
      function(_, buffer)
        local icon = extensions.file_icon(_, buffer)
        if icon then
          return icon .. ' '
        end
        return ''
      end
    )
  )

  table.insert(el_segments, builtin.responsive_file(140, 90))

  table.insert(el_segments,
    sections.collapse_builtin{
      ' ',
      builtin.modified_flag
    }
  )

  table.insert(el_segments, sections.split)

  table.insert(el_segments, lsp_statusline.server_progress)

  table.insert(el_segments, lsp_statusline.current_function)

  local lines_info = {
    '[',
    builtin.line_with_width(3),
    ':',
    builtin.column_with_width(2),
    ':',
    builtin.number_of_lines,
    ']',
    sections.collapse_builtin{
      '[',
      builtin.help_list,
      builtin.readonly_list,
      ']'
    }
  }

  table.insert(el_segments, lines_info)

  table.insert(el_segments, builtin.filetype)

  return el_segments
end

require('el').setup { generator = generator }
