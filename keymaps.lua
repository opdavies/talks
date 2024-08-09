-- Generate the PDF for the currently-open talk.
vim.keymap.set("n", "<leader>gp", function()
  local talk_path = vim.fn.expand "%:p"
  local talk_name = talk_path:match "src/([^/]+)/"

  if talk_name ~= nil then
    vim.cmd(string.format("!./run generate %s", talk_name))
  end
end, { noremap = true, silent = true })
