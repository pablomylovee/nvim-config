local quotes_and_shii = { "I THINK - Bunny Hop", "icl ts shi pmo 🥀🥀", "PLEASEEEEE TYLER DROP NUMBER, NUMBER 😭🙏🙏", "show ya how to stunt, show ya how to stunt", "neovim >>>>", "23 * 3 = ?", "CALL ME IF YOU GET LOST", "whats that... whats a father 🥀🥀", "do you have any relationship with your father?" }

math.randomseed(os.time())

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
	  sections = {
		{ section = "header" },
		{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
		{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
		{ icon = " ", title = "Recent Folders", section = "projects", indent = 2, padding = 1 },
		{ section = "startup" },
	  },

	  preset = {
		header = string.format([[
██╗     ███████╗██╗  ██╗  ██╗   ██╗██╗███╗   ███╗
██║     ██╔════╝██║  ██║  ██║   ██║██║████╗ ████║
██║     ███████╗███████║  ██║   ██║██║██╔████╔██║
██║     ╚════██║██╔══██║  ╚██╗ ██╔╝██║██║╚██╔╝██║
███████╗███████║██║  ██║██╗╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝╚══════╝╚═╝  ╚═╝╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝
%s
	]], quotes_and_shii[math.random(1, #quotes_and_shii)]),
		}
},
}
	
}

