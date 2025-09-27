-- just enable lspconfig, all settings in after/plugin for each programming
-- language
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ 'mason-org/mason.nvim', opts = {} },
		'mason-org/mason-lspconfig.nvim'
	}
}
