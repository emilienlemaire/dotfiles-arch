vim.cmd [[ packadd completion-nvim ]]

local lsp = require('lspconfig')
local nvim_status = require('lsp-status')
local completion = require('completion')
local status = require('elem.lsp_status')
local clang_tidy = require('clang-tidy')

vim.lsp.set_log_level("trace")

-- require('vim.lsp.log').set_level("debug")

status.activate()

local custom_attach = function(client)
  completion.on_attach({
    chain_completion_list=require('elem.completion').chain_completion_list,
  })
  status.on_attach(client)
end

local custom_attach_clangd = function(client)
  clang_tidy.setup{
    checks = {
      '-*',
      'bugprone-*',
      'cert-*',
      'clang-analyzer-*',
      'cppcoreguidelines-*',
      'hicpp-*',
      'portability-*',
      'misc-*',
      'modernize-*',
      'performance-*',
      'readability-*',
      'fushia-multiple-inheritance',
      'fuchsia-statically-constructed-objects',
      'fuchsia-trailing-return',
      'google-build-using-namespace',
      'google-default-arguments',
      'google-runtime-int',
      'llvm-namespace-comment',
      'llvm-prefer-isa-or-dyn-cast-in-conditionals',
      'llvm-twine-local',
      '-modernize-use-trailing-return-type',
      '-misc-no-recursion'
    }
  }
  completion.on_attach({
    chain_completion_list=require('elem.completion').chain_completion_list,
  })
  status.on_attach(client)
end

local capabilities = nvim_status.capabilities;
capabilities.textDocument.completion.completionItem.snippetSupport = true

local clangd_capabilities = capabilities;
clangd_capabilities.textDocument.semanticHighlighting = true;

lsp.clangd.setup({
  cmd = {"clangd",
  "--background-index",
  "--suggest-missing-includes",
  "--clang-tidy",
  "--header-insertion=iwyu",
  "--cross-file-rename"},
  on_attach = custom_attach_clangd,
  init_options = {
    clangdFileStatus = true,
    clangdSemanticHighlighting = true
  },
  handlers = nvim_status.extensions.clangd.setup(),
  capabilities = clangd_capabilities,
})

lsp.vimls.setup({
  on_attach = custom_attach,
})

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path = "/Users/emilienlemaire/Developpement/lsp/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

lsp.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}

lsp.texlab.setup({
  on_attach = custom_attach,
})

lsp.cmake.setup({
  on_attach = custom_attach,
  capabilities = capabilities
})

require('nlua.lsp.nvim').setup(require('lspconfig'), {
  on_attach = custom_attach,

  -- Include globals you want to tell the LSP are real :)
  globals = {
    -- Colorbuddy
    "Color", "c", "Group", "g", "s",
  }
})

lsp.pyls.setup({
  on_attach = custom_attach
})

lsp.tsserver.setup({
  on_attach = custom_attach
})

lsp.rnix.setup({
  on_attach = custom_attach
})

local configs = require('lspconfig/configs')

configs.ocamlls = {
  default_config = {
    cmd = {'ocamllsp'};
    filetypes = {'ocaml'};
    root_dir = function(fname)
      return lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
    settings = {};
  };
}

lsp.ocamlls.setup{
  on_attach = custom_attach
}

configs.nasm_lsp = {
  default_config = {
    cmd = {'nasm-lsp'};
    filetypes = {'nasm'};
    root_dir = function(fname)
      return lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
    settings = {};
  };
}

lsp.nasm_lsp.setup({
  on_attach = custom_attach
})


