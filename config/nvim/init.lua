require("config.lazy")

-- Réglage généraux
vim.g.mapleader = " "  -- espace comme touche leader
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

-- [[ OIL.NVIM ]] --
require("oil").setup({
	skip_confirm_for_simple_edits = true,

	keymaps = {
		["g?"] = "actions.show_help",
  	  	["-"] = "actions.parent",
		["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
  	  	["gs"] = "actions.change_sort",
  	  	["gh"] = "actions.toggle_hidden",
  	},
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- [[ BÉPO ]]
-- require("bepo").setup()
require "config.bepo".setup()

-- [[ LuaSnip ]]
require("luasnip.loaders.from_vscode").lazy_load()

-- [[ LEAP.NVIM ]] --
vim.keymap.set({'n', 'x', 'o'}, 'k',  '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'K',  '<Plug>(leap-backward)')
vim.keymap.set({'n', 'x', 'o'}, 'gk', '<Plug>(leap-from-window)')
-- Losing s and S ... by doing that but whatever

-- [[ UndoTree ]] --
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- [[ gen.nvim ]] --
vim.keymap.set({ 'n', 'v' }, '<leader>om', ':lua require("gen").select_model()<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>og', ':Gen<CR>')

-- Prompt 
require('gen').prompts['Lorem'] = {
	  prompt = "Generate a long lorem ipsum text",
	  replace = true,
}

-- [[ lualine ]] --
require('lualine').setup()

-- [[ mini.nvim ]] --
require('mini.ai').setup()
require('mini.operators').setup()
require('mini.comment').setup() -- tpope :’(
require('mini.pairs').setup() -- tpope :’(
require('mini.animate').setup()
require('mini.tabline').setup()
require('mini.map').setup()
-- MiniMap.open()
vim.api.nvim_set_keymap('n', '<leader>m', ':lua MiniMap.toggle()<CR>', { noremap = true })

-- vim.api.nvim_set_keymap('n', '<leader>t', '<CMD>TransparentToggle<CR>', { desc = "Toggle transparency "})

-- Quick dashboard access
vim.keymap.set("n", "<leader>d", ":Dashboard<CR>")

-- Quick dashboard access
require "nvim-biscuits".setup()

-- [[ Lua Goodies thx TJ ]] --
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

-- [[ Simple nvim terminal ]] --
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

local job_id = 0
vim.keymap.set("n", "<leader>to", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)

  job_id = vim.bo.channel
end)

local current_command = ""
vim.keymap.set("n", "<leader>te", function()
  current_command = vim.fn.input("Command: ")
end)

vim.keymap.set("n", "<leader>tr", function()
  if current_command == "" then
    current_command = vim.fn.input("Command: ")
  end

  vim.fn.chansend(job_id, { current_command .. "\r\n" })
end)

-- [ Floating terminal ] --
-- require "config.floaterminal"

-- [[ old init.nvim ]] --
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)
