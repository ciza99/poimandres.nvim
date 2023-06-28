local p = require("poimandres.palette")

local theme = {}

theme.normal = {
	a = { fg = p.offWhite, bg = p.focus, gui = "bold" },
	b = { fg = p.white, bg = p.bg },
	c = { fg = p.bluishGrayBrighter, bg = p.none },
}

theme.insert = {
	a = { fg = p.offWhite, bg = p.focus, gui = "bold" },
	b = { fg = p.white, bg = p.bg },
}

theme.visual = {
	a = { fg = p.offWhite, bg = p.focus, gui = "bold" },
	b = { fg = p.white, bg = p.bg },
}

theme.replace = {
	a = { fg = p.offWhite, bg = p.focus, gui = "bold" },
	b = { fg = p.white, bg = p.bg },
}

theme.command = {
	a = { fg = p.offWhite, bg = p.focus, gui = "bold" },
	b = { fg = p.white, bg = p.bg },
}

theme.inactive = {
	a = { fg = p.lightBlue, bg = p.bg, gui = "bold" },
	b = { fg = p.lightBlue, bg = p.bg },
	c = { fg = p.lightBlue, bg = p.none },
}

return theme
