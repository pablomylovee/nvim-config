return {
	{
	  'saghen/blink.cmp',
	  dependencies = 'rafamadriz/friendly-snippets',
	  version = '*',
	  opts = {
		keymap = { preset = 'enter' },

		cmdline = {
			enabled = false
		},

		completion = {
			keyword = { range = "prefix" },
			accept = { auto_brackets = { enabled = true }, },
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
			list = {
				selection = { preselect = true, auto_insert = false }
			},
		},

		appearance = {
			 use_nvim_cmp_as_default = true,
			 nerd_font_variant = 'mono'
		},

		sources = {
		  default = { 'lsp', 'path', 'snippets', 'buffer' },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" }
	  },
	  opts_extend = { "sources.default" }

  },

  {
	  'm4xshen/autoclose.nvim',
	  config = function ()
	  	require("autoclose").setup({})
	  end,
  },

  {
	  'nvim-treesitter/nvim-treesitter',
	  config = function()
    	require('nvim-treesitter.install').update({ with_sync = true })
	  end,
  }
}

