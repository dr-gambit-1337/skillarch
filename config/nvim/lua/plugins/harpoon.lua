return {
	"ThePrimeagen/harpoon",
  	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim"
	},
  	opts = {
		menu = {
			width = vim.api.nvim_win_get_width(0) - 4,
  	  	},
  	  	settings = {
			-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
			save_on_toggle = true,

    		-- saves the harpoon file upon every change. disabling is unrecommended.
    		save_on_change = true,

    		-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    		enter_on_sendcmd = false,

    		-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    		tmux_autoclose_windows = false,

    		-- filetypes that you want to prevent from adding to the harpoon list menu.
    		excluded_filetypes = { "harpoon" },

    		-- set marks specific to each git branch inside git repository
    		mark_branch = false,

    		-- enable tabline with harpoon marks
    		tabline = false,
    		tabline_prefix = "   ",
    		tabline_suffix = "   ",
  	  	},
  	},
  	keys = function()
		local keys = {
			{
				"<leader>H",
  	  	  	  	function()
  	  	  	  	  require("harpoon"):list():add()
  	  	  	  	end,
  	  	  	  	desc = "Harpoon File",
  	  	  	},
  	  	  	{
				"<leader>h",
  	  	  	  	function()
  	  	  	  	  local harpoon = require("harpoon")
  	  	  	  	  harpoon.ui:toggle_quick_menu(harpoon:list())
  	  	  	  	end,
  	  	  	  	desc = "Harpoon Quick Menu",
  	  	  	},
  	  	}

		-- local k = { '"', '«', '»', '(', ')' } -- bépo
		local k = { '1', '2', '3', '4', '5' } -- bépolar
		for i = 1, 5 do
			table.insert(keys, {
				"<leader>" .. k[i],
  	  	  	  	function()
  	  	  	  	  require("harpoon"):list():select(i)
  	  	  	  	end,
  	  	  	  	desc = "Harpoon to File " .. i,
  	  	  	})
  	  	end
  	  	return keys
  	end,
}
