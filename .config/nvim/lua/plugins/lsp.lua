return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local mason = require("mason")
			mason.setup()

			local mason_lsp = require("mason-lspconfig")
			mason_lsp.setup({
				ensure_installed = {
					"biome",
                    "lua_ls"
				}
			})

			local lspconf = require("lspconfig")
		end
	}
}
