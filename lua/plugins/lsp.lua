return {

	{
		"williamboman/mason.nvim",
		config = function ()
			require("mason").setup({})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function ()
			require("mason-lspconfig").setup({
				ensure_installed = { "pyright", "biome", "lua_ls", "bashls" }
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },

		config = function ()
			local capabilities = require('blink.cmp').get_lsp_capabilities()

			require("lspconfig").lua_ls.setup({ capabilities = capabilities })
			require("lspconfig").pyright.setup({ capabilities = capabilities })
			require("lspconfig").biome.setup({ capabilities = capabilities })
			require("lspconfig").bashls.setup({ capabilities = capabilities })
		end,
	}

}
