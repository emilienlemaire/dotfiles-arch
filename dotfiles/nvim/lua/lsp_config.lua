local lsp = require('lspconfig')
local nvim_status = require('lsp-status')
local status = require('elem.lsp_status')
local clang_tidy = require('clang-tidy')

vim.lsp.set_log_level("trace")

-- require('vim.lsp.log').set_level("debug")

status.activate()

local custom_attach = function(client)
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

local sumneko_root_path = "/Users/emilienlemaire/.cache/nvim/nlua/sumneko_lua/lua-language-server"
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
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  on_attach = custom_attach,

  -- Include globals you want to tell the LSP are real :)
  globals = {
    -- Colorbuddy
    "Color", "c", "Group", "g", "s",
  }
})

local htmlCapabilities = vim.lsp.protocol.make_client_capabilities()
htmlCapabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.html.setup {
  on_attach = custom_attach,
  capabilities = htmlCapabilities
}

lsp.pyls.setup({
  on_attach = custom_attach
})

local format_async = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then return end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        if bufnr == vim.api.nvim_get_current_buf() then
            vim.api.nvim_command("noautocmd :update")
        end
    end
end

vim.lsp.handlers["textDocument/formatting"] = format_async

_G.lsp_organize_imports = function()
    local params = {
        command = "_typescript.organizeImports",
        arguments = {vim.api.nvim_buf_get_name(0)},
        title = ""
    }
    vim.lsp.buf.execute_command(params)
end

local on_attach_js = function(client, bufnr)
  local buf_map = vim.api.nvim_buf_set_keymap
  vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
  vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
  vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
  vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
  vim.cmd("command! LspOrganize lua lsp_organize_imports()")
  vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
  vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
  vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
  vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
  vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
  vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
  vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
  buf_map(bufnr, "n", "gd", ":LspDef<CR>", {silent = true})
  buf_map(bufnr, "n", "gr", ":LspRename<CR>", {silent = true})
  buf_map(bufnr, "n", "gR", ":LspRefs<CR>", {silent = true})
  buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>", {silent = true})
  buf_map(bufnr, "n", "K", ":LspHover<CR>", {silent = true})
  buf_map(bufnr, "n", "gs", ":LspOrganize<CR>", {silent = true})
  buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>", {silent = true})
  buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>", {silent = true})
  buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>", {silent = true})
  buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>", {silent = true})
  buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>",
  {silent = true})
  custom_attach(client)
end

lsp.tsserver.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach_js(client)
  end
}

local filetypes = {
  typescript = "eslint",
  typescriptreact = "eslint",
  javascript = "eslint",
  javascriptreact = "eslint"
}
local linters = {
  eslint = {
    sourceName = "eslint",
    command = "eslint_d",
    rootPatterns = {".eslintrc.js", ".eslintrc.json", "package.json"},
    debounce = 100,
    args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
    parseJson = {
      errorsRoot = "[0].messages",
      line = "line",
      column = "column",
      endLine = "endLine",
      endColumn = "endColumn",
      message = "${message} [${ruleId}]",
      security = "severity"
    },
    securities = {[2] = "error", [1] = "warning"}
  }
}
local formatters = {
  prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}}
}
local formatFiletypes = {
  typescript = "prettier",
  typescriptreact = "prettier",
  javascript = "prettier",
  javascriptreact = "prettier"
}

lsp.diagnosticls.setup {
  on_attach = on_attach_js,
  filetypes = vim.tbl_keys(filetypes),
  init_options = {
    filetypes = filetypes,
    linters = linters,
    formatters = formatters,
    formatFiletypes = formatFiletypes
  }
}

lsp.rnix.setup({
  on_attach = custom_attach
})

local configs = require('lspconfig/configs')

configs.ocamlls = {
  default_config = {
    cmd = {'ocamllsp'};
    filetypes = {'ocaml', 'ocaml_interface', 'ocaml.ocaml_interface', 'menhir', 'ocamllex'};
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


