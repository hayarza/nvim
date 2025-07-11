-- Auto commands
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Close some filetypes with <q>
autocmd("FileType", {
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})
