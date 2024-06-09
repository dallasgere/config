-- setting my leaders
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Explore)

-- these are really cool and make me able to move stuff up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- gets rid of currend line 
vim.keymap.set("n", "J", "mzJ`z")

-- jump half of the file
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- i think this will seachs
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- remaping escape
vim.keymap.set("n", "<C-c>", "<Esc>")

-- copy and pase
vim.keymap.set("v", "<leader>c", ":w !pbcopy <CR>")
vim.keymap.set("n", "<leader>v", "!pbpaste")

-- lsp
-- vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>lua vim.lsp.buf.declaration()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>j", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
