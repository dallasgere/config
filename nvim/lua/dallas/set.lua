vim.opt.nu = true
vim.opt.relativenumber = true

-- turning off the background
-- vim.api.nvim_set_hl(0, "Normal", {guibg=NONE, ctermbg=NONE})
-- vim.api.nvim_set_hl(0, "NormalFloat", {guibg=NONE})

-- vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
-- vim.opt.guicursor = "n-v-c-i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.guicursor=""

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- vim.opt.colorcolumn = "81"

vim.g.mapleader = " "

vim.g.netrw_banner = 0

-- trying to get rid of grey bar
-- vim.opt.signcolumn = "no"

-- vim.cmd [[
-- highlight Normal guibg=none
-- highlight NonText guibg=none
-- highlight Normal ctermbg=none
-- highlight NonText ctermbg=none
-- ]]
