return {
  cmd = { 'postgres-language-server', 'lsp-proxy' },
  filetypes = {
    'sql',
  },
  root_markers = { 'postgres-language-server.jsonc', '.git' },
  workspace_required = true,
}
