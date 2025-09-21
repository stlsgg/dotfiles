-- encoding and file format
vim.opt.encoding = "utf-8"
vim.opt.ff = "unix"

-- line numbers
vim.o.rnu = true
vim.o.nu = true

-- centrelized cursor
vim.o.so = 999

-- cursor-block
vim.opt.guicursor = ""

-- cursor line
vim.o.cursorline = true

-- confirmation before leaving
vim.o.confirm = true

-- tabs and indentation
vim.opt.ts = 4
vim.opt.sts = 4
vim.opt.sw = 4
vim.opt.et = false
vim.opt.si = true

-- disable swap and backups
-- but keep undo history
vim.opt.swf = false
vim.opt.bk = false
vim.opt.udir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.udf = true

-- search in buffer
vim.opt.hls = false
vim.opt.is = true
-- smartcase and ignorecase
vim.opt.scs = true
vim.opt.ic = true

-- i guess, add more colors to the nvim terminals?
vim.opt.tgc = true

vim.opt.scl = "yes"
vim.opt.isfname:append("@-@")

-- update time
vim.opt.ut = 500

-- color column, vertical line
vim.opt.textwidth = 80
vim.opt.cc = "+1"

-- whitespace chars displaying
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = '·', nbsp = '␣' }
