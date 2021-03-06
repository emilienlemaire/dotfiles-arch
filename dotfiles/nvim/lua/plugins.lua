vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
  function(use)

    use {'wbthomason/packer.nvim', opt = true}
    --{{{ LSP
    use 'neovim/nvim-lspconfig'

    use 'nvim-lua/completion-nvim'
    use 'steelsojka/completion-buffers'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'
    use 'nvim-treesitter/completion-treesitter'
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'kristijanhusak/completion-tags'

    use 'wbthomason/lsp-status.nvim'

    --[[ use 'dense-analysis/ale'
    use 'nathunsmitty/nvim-ale-diagnostic' ]]

    use 'emilienlemaire/clang-tidy.nvim'

    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'kitagry/vs-snippets'

    use 'glepnir/lspsaga.nvim'

    -- TODO: Maybe contribute for MacOS
    --use 'anott03/nvim-lspinstall'
    --}}}

    --{{{ UTILS
    use {
      'vigoux/treesitter-context.nvim',
      requires = { 'nvim-treesitter/nvim-treesitter' }
    }

    use 'windwp/nvim-autopairs'

    use 'nvim-lua/popup.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'}
      }
    }

    use 'nvim-telescope/telescope-fzy-native.nvim'

    use 'arthurxavierx/vim-unicoder'
    use 'machakann/vim-sandwich'
    use {'mg979/vim-visual-multi', branch = 'master'}
    use 'pbrisbin/vim-mkdir'
    use 'junegunn/vim-easy-align'

    use 'alpertuna/vim-header'

    use 'mbbill/undotree'
    use 'voldikss/vim-floaterm'

    use 'emilienlemaire/nvimux-navigator'

    use 'mhinz/vim-startify'
    use 'lervag/vimtex'

    use 'lewis6991/gitsigns.nvim'
    use 'TimUntersberger/neogit'
    use 'onsails/lspkind-nvim'

    -- TODO: Look into how it can be fixed
    use 'TimUntersberger/neofs'

    use {'~/Developpement/lua/neuron.nvim', branch = 'unstable'}

    use 'b3nj5m1n/kommentary'

    use 'kevinhwang91/nvim-hlslens'
    --}}}

    -- {{{ LANGUAGES
    use 'urbainvaes/vim-ripple'
    use 'ocaml/vim-ocaml'
    use 'cdelledonne/vim-cmake'
    use 'tpope/vim-markdown'

    use 'mfussenegger/nvim-dap'
    use 'theHamsta/nvim-dap-virtual-text'

    use 'tjdevries/nlua.nvim'
    use 'euclidianAce/BetterLua.vim'

    use 'tikhomirov/vim-glsl'

    use 'maelvls/gmpl.vim'

    use 'LnL7/vim-nix'

    -- }}}

    -- {{{ COLORSCHEMES
    use 'morhetz/gruvbox'

    use 'tjdevries/colorbuddy.vim'
    use {
      'Th3Whit3Wolf/spacebuddy',
      requires = {
        'tjdevries/colorbuddy.vim'
      }
    }
    use 'liuchengxu/space-vim-dark'

    use 'tjdevries/express_line.nvim'

    use 'ryanoasis/vim-devicons'

    use 'kyazdani42/nvim-web-devicons'

    use 'Th3Whit3Wolf/space-nvim'

    use 'glepnir/indent-guides.nvim'

    use 'lilydjwg/colorizer'
    -- }}}

    -- {{{ maybe later
    --use 'npxbr/glow.nvim'
    -- }}}
  end,
  config =  {
    display = {
      _open_fn = function(name)
        -- Can only use plenary when we have our plugins.
        --  We can only get plenary when we don't have our plugins ;)
        local ok, float_win = pcall(function()
          return require('plenary.window.float').percentage_range_window(0.8, 0.8)
        end)

        if not ok then
          vim.cmd [[65vnew  [packer] ]]
          return vim.api.nvim_get_current_win(), vim.api.nvim_get_current_buf()
        end

        local bufnr = float_win.buf
        local win = float_win.win

        vim.api.nvim_buf_set_name(bufnr, name)
        vim.api.nvim_win_set_option(win, 'winblend', 10)

        return win, bufnr
      end
    },
  }
})
