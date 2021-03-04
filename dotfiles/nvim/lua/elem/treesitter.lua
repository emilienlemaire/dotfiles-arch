vim.cmd [[ packadd nvim-treesitter ]]

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

parser_config.yapl = {
    install_info = {
        url = "~/Developpement/treesitter/tree-sitter-yapl",
        files = {"src/parser.c"}
    },
    filetype = "yapl"
}

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },

  incremental_selection = {
    enable = true,
    keymaps = { -- mappings for incremental selection (visual mappings)
      init_selection = 'gnn',    -- maps in normal mode to init the node/scope selection
      node_incremental = 'gnn',  -- increment to the upper named parent
      scope_incremental = 'gns', -- increment to the upper scope (as defined in locals.scm)
      node_decremental = 'grm',  -- decrement to the previous node
    },
  },

  refactor = {
    highlight_definitions = {enable = true},
    highlight_current_scope = {enable = false},
    smart_rename = {
      enable = true,
      keymaps = {
        -- mapping to rename reference under cursor
        smart_rename = 'grn',
      },
    },

    -- TODO: This seems broken...
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = 'gnd', -- mapping to go to definition of symbol under cursor
        list_definitions = 'gnD', -- mapping to list all definitions in current file
      },
    },
  },
   textobjects = { -- syntax-aware textobjects
     enable = true,
     disable = {},
     keymaps = {
       ['iL'] = { -- you can define your own textobjects directly here
         python = '(function_definition) @function',
         cpp = '(function_definition) @function',
         c = '(function_definition) @function',
         java = '(method_declaration) @function',
       },
       -- or you use the queries from supported languages with textobjects.scm
       ['af'] = '@function.outer',
       ['if'] = '@function.inner',
       ['aC'] = '@class.outer',
       ['iC'] = '@class.inner',
       ['ac'] = '@conditional.outer',
       ['ic'] = '@conditional.inner',
       ['ae'] = '@block.outer',
       ['ie'] = '@block.inner',
       ['al'] = '@loop.outer',
       ['il'] = '@loop.inner',
       ['is'] = '@statement.inner',
       ['as'] = '@statement.outer',
       ['ad'] = '@comment.outer',
       ['am'] = '@call.outer',
       ['im'] = '@call.inner',
     },
   },
  ensure_installed = 'all', -- one of 'all', 'language', or a list of languages
}
