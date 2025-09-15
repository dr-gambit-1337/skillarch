return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		-- local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
		-- vim.fn.mkdir(parser_install_dir, "p")

		configs.setup({
			-- parser_install_dir = parser_install_dir,
			ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "rust",
				"yaml", "xml", "typescript", "scala", "r", "objdump",
				"graphql", "git_config", "bash", "asm", "arduino", "typst",
				"css", "csv", "diff", "dockerfile", "gitcommit", "go", "http", "json",
				"latex", "markdown", "nasm", "perl", "php", "powershell", "python", "ruby" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },

			textobjects = {
				select = {
					enable = false,
				}
			}
		})
	end
}
