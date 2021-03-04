local M = {}

M.chain_completion_list = {
  default = {
    {complete_items = {'lsp', 'snippet', 'ts'}},
    {complete_items = {'path'}, triggered_only = {'/'}},
    {complete_items = {'buffers'}},
  },
}

return M
