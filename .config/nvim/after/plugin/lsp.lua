-- keymaps for lsp, runs when an lsp attaches to a particular buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
	callback = function(event)
		-- function that lets more easily define mappings specific
		-- for LSP related items. It sets the mode, buffer and description for us each time.
		local map = function(keys, func, desc, mode)
			mode = mode or 'n'
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
		end

		-- Rename the variable under your cursor.
		--  Most Language Servers support renaming across files, etc.
		map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

		-- Execute a code action, usually your cursor needs to be on top of an error
		-- or a suggestion from your LSP for this to activate.
		map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

		-- Find references for the word under your cursor.
		map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

		-- Jump to the implementation of the word under your cursor.
		--  Useful when your language has ways of declaring types without an actual implementation.
		map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

		-- Jump to the definition of the word under your cursor.
		--  This is where a variable was first declared, or where a function is defined, etc.
		--  To jump back, press <C-t>.
		map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

		-- WARN: This is not Goto Definition, this is Goto Declaration.
		--  For example, in C this would take you to the header.
		map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

		-- Fuzzy find all the symbols in your current document.
		--  Symbols are things like variables, functions, types, etc.
		map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

		-- Fuzzy find all the symbols in your current workspace.
		--  Similar to document symbols, except searches over your entire project.
		map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

		-- Jump to the type of the word under your cursor.
		--  Useful when you're not sure what type a variable is and you want to see
		--  the definition of its *type*, not where it was *defined*.
		map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

		-- The following code creates a keymap to toggle inlay hints in your
		-- code, if the language server you are using supports them
		--
		-- This may be unwanted, since they displace some of your code
		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map('<leader>th', function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
			end, '[T]oggle Inlay [H]ints')
		end

		local function client_supports_method(client, method, bufnr)
			if vim.fn.has 'nvim-0.11' == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end
		vim.api.nvim_create_autocmd('LspDetach', {
			group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
			callback = function(event2)
				vim.lsp.buf.clear_references()
				vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
			end,
		})
	end
})

	-- Diagnostic Config
	-- See :help vim.diagnostic.Opts
	vim.diagnostic.config {
		severity_sort = true,
		float = { border = 'rounded', source = 'if_many' },
		underline = { severity = vim.diagnostic.severity.ERROR },
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = '󰅚 ',
				[vim.diagnostic.severity.WARN] = '󰀪 ',
				[vim.diagnostic.severity.INFO] = '󰋽 ',
				[vim.diagnostic.severity.HINT] = '󰌶 ',
			},
		},
		virtual_text = {
			source = 'if_many',
			spacing = 2,
			format = function(diagnostic)
				local diagnostic_message = {
					[vim.diagnostic.severity.ERROR] = diagnostic.message,
					[vim.diagnostic.severity.WARN] = diagnostic.message,
					[vim.diagnostic.severity.INFO] = diagnostic.message,
					[vim.diagnostic.severity.HINT] = diagnostic.message,
				}
				return diagnostic_message[diagnostic.severity]
			end,
		},
	}

	local capabilities = require('cmp_nvim_lsp').default_capabilities()

	local servers = {
		clangd = {
			capabilities =  {
				offsetEncoding = { "utf-8", "utf-16" },
				textDocument = {
					completion = {
						editsNearCursor = true
					}
				}
			},
			cmd = { "clangd" },
			filetypes =  { "c", "cpp", "objc", "objcpp", "cuda" },
			root_markers = { ".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", "configure.ac", ".git" },
		},

		-- biomejs 
		biome = {

		},
		eslint = {},
		emmet_language_server = {}
	}

	-- mason lsp attach
	require("mason").setup()
	require("mason-lspconfig").setup({
		handlers = {
			function(server_name)
				local server =  servers[server_name]
				require('lspconfig')[server_name].setup(server)
			end
		}
	}
)
