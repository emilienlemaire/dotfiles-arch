" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/emilienlemaire/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/emilienlemaire/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/emilienlemaire/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/emilienlemaire/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/emilienlemaire/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/BetterLua.vim"
  },
  ["clang-tidy.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/clang-tidy.nvim"
  },
  ["colorbuddy.vim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/colorbuddy.vim"
  },
  colorizer = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/colorizer"
  },
  ["completion-buffers"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/completion-buffers"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["completion-tags"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/completion-tags"
  },
  ["completion-treesitter"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/completion-treesitter"
  },
  ["express_line.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/express_line.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gmpl.vim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/gmpl.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["indent-guides.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/indent-guides.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  neofs = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/neofs"
  },
  neogit = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["neuron.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/neuron.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["nvimux-navigator"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/nvimux-navigator"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["space-nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/space-nvim"
  },
  ["space-vim-dark"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/space-vim-dark"
  },
  spacebuddy = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/spacebuddy"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["treesitter-context.nvim"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/treesitter-context.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-cmake"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-cmake"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-glsl"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-glsl"
  },
  ["vim-header"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-header"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-mkdir"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-mkdir"
  },
  ["vim-nix"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-nix"
  },
  ["vim-ocaml"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-ocaml"
  },
  ["vim-ripple"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-ripple"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-unicoder"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-unicoder"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  vimtex = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vimtex"
  },
  ["vs-snippets"] = {
    loaded = true,
    path = "/Users/emilienlemaire/.local/share/nvim/site/pack/packer/start/vs-snippets"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
