print 'Running custom code in the Knifewrench folder'

local dap = require 'dap'

dap.adapters.coreclr = {
  type = 'executable',
  command = '.local/share/nvim/mason/packages/netcoredbg',
  args = { '--interpreter=vscode' },
}

dap.configurations.cs = {
  {
    type = 'coreclr',
    name = 'launch - netcoredbg',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}
