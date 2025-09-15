return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function()
			require('telescope').setup {
				pickers = {
					find_files = {
						theme = "ivy",
					},
				},
				extensions = {
					fzf = {},
				},
			}

			-- Charger l'extension fzf
			require('telescope').load_extension('fzf')

			-- Keymaps
			vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags)
			vim.keymap.set("n", "<leader>fd", require('telescope.builtin').find_files)
			vim.keymap.set("n", "<leader>en", function()
				require('telescope.builtin').find_files {
					cwd = vim.fn.stdpath("config"),
				}
			end)
			vim.keymap.set("n", "<leader>ep", function()
				require('telescope.builtin').find_files {
					cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
				}
			end)

			-- Votre module multigrep
			require "config.multigrep".setup()
		end,
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim' },
		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = require("telescope.themes").get_dropdown {},
				},
			}
			-- Charger l'extension ui-select
			require("telescope").load_extension("ui-select")
		end,
	},
}
-- return {
-- 	{
-- 		'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- 		dependencies = { 'nvim-lua/plenary.nvim' }
-- 	},
-- 	{
-- 		'nvim-telescope/telescope-ui-select.nvim',
-- 		config = function()
-- 			require("telescope").setup({
-- 			  extensions = {
-- 				 ["ui-select"] = {
-- 					require("telescope.themes").get_dropdown {
-- 					}
-- 				 }
-- 			  }
-- 			})
-- 		require("telescope").load_extension("ui-select")
-- 		end
-- 	},
-- }
