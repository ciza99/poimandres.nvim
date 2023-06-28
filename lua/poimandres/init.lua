local M = {}

function M.colorscheme()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.opt.termguicolors = true
	vim.g.colors_name = "poimandres"

	local theme = require("poimandres.theme")
	theme.set_highlights()
end

return M
