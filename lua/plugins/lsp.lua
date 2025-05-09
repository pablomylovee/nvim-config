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
			require("mason-lspconfig").setup({})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },

		config = function ()
			local capabilities = require('blink.cmp').get_lsp_capabilities()

			require("lspconfig").ts_ls.setup({})
			require("lspconfig").pyright.setup({ capabilities = capabilities })
			require("lspconfig").gopls.setup({ capabilities = capabilities })
		end,
	}

}
