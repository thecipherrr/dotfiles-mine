local status, toggleterm = pcall(require, 'toggleterm')
if (not status) then return end

local powershell_options = {
  shell = vim.fn.executable 'pwsh' == 1 and 'pwsh' or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end

toggleterm.setup {
  size = 10,
  open_mapping = [[<C-\>]],
  persist_size = true,
  persist_mode = true,
  direction = 'horizontal',
  shade_filetypes = {},
  shade_terminals = false,
  start_in_insert = true,
  close_in_exit = true,
  shell = 'pwsh.exe'
}
