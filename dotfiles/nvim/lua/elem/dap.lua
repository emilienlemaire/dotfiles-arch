local dap = require('dap')

dap.adapters.cpp = {
  type = 'executable',
  attach = {
    pidProperty = "pid",
    pidSelect = "ask"
  },
  command = 'lldb-vscode',
  name = 'lldb'
}

dap.defaults.fallback.external_terminal = {
  command = '/Applications/kitty.app/Contents/MacOS/kitty';
}

local M = {}
local last_lldb_config

M.start_c_debugger = function(args, mi_mode, mi_debugger_path)
    if args and #args > 0 then
        last_lldb_config = {
            type = "cpp",
            name = args[1],
            request = "launch",
            program = table.remove(args, 1),
            args = args,
            cwd = vim.fn.getcwd(),
            externalConsole = true,
            MIMode = mi_mode or "lldb",
            MIDebuggerPath = mi_debugger_path
          }
    end

    if not last_lldb_config then
        print('No binary to debug set! Use ":DebugC <binary> <args>" or ":DebugRust <binary> <args>"')
        return
    end

    dap.run(last_lldb_config)
    dap.repl.open()
end

return M
