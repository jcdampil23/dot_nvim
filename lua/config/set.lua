-- set the <leader> to be space, change as you like
vim.g.mapleader = " "
vim.g.netrw_fastbrowse = 2
-- enables relative line numbers in netrw (netrw is the default file explorer for nvim)
vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nbl nowrap ro']])

-- enable line number then relative line number for files
vim.opt.nu = true
vim.opt.relativenumber = true

-- vim.opt.columns = 120

-- making vim tabs to be 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- disable highlight after search
vim.opt.hlsearch = false

-- highlights search while you type
vim.opt.incsearch = true

-- enables 24bit color (if terminal doesn't support it, color schemes look like shit)
vim.opt.termguicolors = true
vim.opt.pumblend = 0
vim.opt.cursorline = true

-- makes it so that theres always (n) lines above and below when scrolling
vim.opt.scrolloff = 8

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.colorcolumn = "80"

-- :help updatetime if you want sepecifics but its here for plugin responsiveness
vim.opt.updatetime = 250

vim.opt.splitright = true
vim.showtabline = true

-- changes netrw to display only current directory with details
-- 0(no details), 1(details), 2(Why tho), 3(looks like vscode file explorer)
vim.g.netrw_liststyle = 0

-- Removes netrw banner
-- vim.g.netrw_banner = 0;
vim.g.netrw_special_syntax = 3

vim.opt.conceallevel = 0
vim.opt.cmdheight = 2
