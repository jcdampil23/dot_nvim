local keymap = vim.keymap.set

keymap("n", "<leader>q", ":Ex<CR>", { desc = "Go Back to File Browser" })

keymap("n", "<leader>i", function()
	vim.lsp.buf.hover()
end, { desc = "LSP Hover" })

keymap("n", "<leader>l", ":Lazy<CR>", { desc = "Open Lazy Plugin Manager" })

-- File Explorer Remaps
keymap("n", "<leader>pf", ":FzfLua files<CR>", { desc = "Find Files" })
keymap("n", "<leader>ps", ":FzfLua live_grep_native<CR>", { desc = "Find Text" })
keymap("n", "<leader>pc", ":FzfLua colorschemes<CR>", { desc = "Find Color Schemes" })

-- LazyGit Remaps
keymap("n", "<leader>gg", ":LazyGit<CR>", { desc = "Lazy Git" })

-- Copy to Clipboard
keymap("v", "<leader>y", '"+y', { desc = "Copy Selection to System Clipboard" })
keymap("n", "<leader>y", '"+y', { desc = "Copy Vim Motion to System Clipboard" })
keymap("n", "<leader>Y", '"+Y', { desc = "Copy Vim Motion to System Clipboard" })

-- Jump Up and Down
keymap("n", "<C-d>", "<C-d>zz", { desc = "Jump Down" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Jump Up" })

-- find and replace remaps
keymap("n", "<leader>r", [[:%s/\<<c-r><c-w>\>/<c-r><c-w>/gi<left><left><left>]], { desc = "Replace word under cursor" })
keymap("v", "<leader>r", [[:s///g<left><left><left>]], { desc = "Replace within selection" })

-- Move Selection Up(K) or Down(J)
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })
