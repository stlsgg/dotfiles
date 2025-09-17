return {
	"nvim-treesitter/nvim-treesitter",
	config = function ()
		require'nvim-treesitter.configs'.setup {
			ensure_installed = { "cpp", "python", "json", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "html", "css", "bash", "latex" },

			sync_install = true,

			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false
			},
		}
	end
}
