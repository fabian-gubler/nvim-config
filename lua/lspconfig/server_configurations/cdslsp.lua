local util = require 'lspconfig.util'

local root_files = {
  'mta.yaml',
  'manifest.yml',
  'index.cds',
}

return {
  default_config = {
    cmd = { 'cds-lsp', '--stdio' },
    filetypes = { 'cds' },
    root_dir = util.root_pattern(unpack(root_files)),
  },
  docs = {
    description = [[
https://www.npmjs.com/package/@sap/cds-lsp

The CDS language server implements the Language Server Protocol (LSP) for SAP's Core Data Services (CDS).
]],
  },
}
