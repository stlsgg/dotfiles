-- clear search by pressing Esc
vim.keymap.set("n", "<Esc>", "<cmd>nohls<CR>")

-- exit terminal in terminal mode by pressing double Esc
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- move selected in visual mode code vertically
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- move half page down\up and centerize cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- coping text (yank!)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<C-c>", [["+y]])

-- also hightlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = "Hightlight text when yanking",
	group = vim.api.nvim_create_augroup("kickstart-hightlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.local/bin/tmux_sessionizer.sh<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- file managing (save, quit)
vim.keymap.set('n', '<leader>sf', vim.cmd.w)
vim.keymap.set('n', '<leader>sq', vim.cmd.wq)
vim.keymap.set('n', '<leader>q', vim.cmd.q)

-- file manager (netrw)
vim.keymap.set('n', '<leader>oe', vim.cmd.Ex)
vim.g.netrw_keepdir = 0

