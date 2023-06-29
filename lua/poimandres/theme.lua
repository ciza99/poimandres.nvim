local p = require("poimandres.palette")
local blend = require("poimandres.utils").blend

local hl = vim.api.nvim_set_hl

local theme = {}

local groups = {
	hint = p.lightBlue,
	warn = p.brightYellow,
	error = p.hotRed,
	panel = p.bg,
}

local highlights = {
	-- highlights
	Normal = { fg = p.white, bg = p.bg },
	SignColumn = { fg = "NONE", bg = p.bg },
	Pmenu = { fg = "NONE", bg = p.bg },
	PmenuSel = { fg = "NONE", bg = p.focus },
	CursorLineNr = { fg = p.gray, bg = p.none },
	LineNr = { fg = p.bluishGray, bg = p.none },
	Comment = { fg = p.bluishGray, bg = p.none, italic = false },
	Folded = { fg = p.white, bg = p.none },
	FoldColumn = { fg = p.darkerGray, bg = p.bg },
	FloatBorder = { fg = p.focus, bg = p.bg },
	FloatTitle = { fg = p.darkerGray, bg = p.bg, bold = true },
	VertSplit = { fg = p.focus, bg = p.none },
	CursorLine = { fg = p.none, bg = p.focus },
	CursorColumn = { fg = p.none, bg = p.focus },
	ColorColumn = { fg = p.none, bg = p.bluishGray },
	NormalFloat = { fg = p.offWhite, bg = p.bg, sp = "NONE", blend = 0 },
	Visual = { link = "VisualActive" },
	VisualActive = { fg = "NONE", bg = p.focus },
	VisualInactive = { fg = "NONE", bg = p.bg },
	DiffAdd = { fg = p.none, bg = blend(p.lowerMint, p.bg, 0.3) },
	DiffChange = { fg = p.none, bg = blend(p.focus, p.bg, 0.3) },
	DiffDelete = { fg = p.none, bg = blend(p.hotRed, p.bg, 0.3) },
	DiffText = { fg = p.none, bg = blend(p.lowerMint, p.focus, 0.3) },
	-- QuickFixLine = { fg = p.none, bg = p.quickfix_line },
	MatchParen = { fg = p.none, bg = p.focus },
	Cursor = { fg = p.white, bg = p.none },
	-- lCursor = { fg = c.cursor_fg, bg = "NONE" },
	-- CursorIM = { fg = c.cursor_fg, bg = "NONE" },
	-- TermCursor = { fg = c.cursor_fg, bg = "NONE" },
	-- TermCursorNC = { fg = c.cursor_fg, bg = "NONE" },
	Underlined = { fg = p.lightBlue, underline = true },
	Directory = { fg = p.lowerBlue, bg = p.none },
	Title = { fg = p.offWhite, bg = "NONE", bold = true },
	Error = { fg = p.hotRed, bg = "NONE" },
	ErrorMsg = { link = "Error" },
	Todo = { link = "Warning" },
	RedrawDebugClear = { bg = p.brightYellow },
	RedrawDebugCompose = { bg = p.brightMint },
	RedrawDebugRecompose = { bg = p.hotRed },
	WildMenu = { bg = p.pink },
	MoreMsg = { fg = p.lowerBlue },
	Warning = { fg = p.brightYellow },
	WarningMsg = { link = "Warning" },
	Search = { fg = "NONE", bg = p.focus },
	IncSearch = { fg = "NONE", bg = p.bluishGray },
	NonText = { fg = p.desaturatedBlue, bg = "NONE" },
	Variable = { fg = p.white, bg = "NONE" },
	String = { fg = p.brightMint, bg = "NONE" },
	Constant = { fg = p.white, bg = "NONE", italic = false },
	Number = { fg = p.brightMint, bg = "NONE" },
	Boolean = { fg = p.hotRed, bg = "NONE", italic = false },
	Identifier = { fg = p.white, bg = "NONE" },
	Function = { fg = p.lightBlue, bg = "NONE", italic = false },
	Operator = { fg = p.desaturatedBlue, bg = "NONE" },
	Type = { fg = p.bluishGrayBrighter, bg = "NONE" },
	Keyword = { fg = p.desaturatedBlue, bg = "NONE" },
	Statement = { fg = p.offWhite, bg = "NONE", italic = false },
	Conditional = { fg = p.bluishGrayBrighter, bg = "NONE" },
	Include = { fg = p.brightMint, bg = "NONE", italic = false },
	PreProc = { fg = p.offWhite, bg = "NONE" },
	Special = { fg = p.bluishGrayBrighter, bg = "NONE" },
	Tag = { fg = p.offWhite, bg = "NONE" },
	Delimiter = { fg = p.gray, bg = "NONE" },
	IndentChar = { fg = p.focus, bg = "NONE" },
	IndentContextChar = { fg = p.bluishGray, bg = "NONE" },
	TabLineSel = { fg = p.white, bg = p.bg },
	TabLine = { fg = p.focus, bg = p.bg },
	TabLineFill = { fg = p.none, bg = "NONE" },

	-- Treesitter
	["@constructor"] = { fg = p.brightMint, bg = p.none },
	["@class.constructor"] = { fg = p.desaturatedBlue, bg = "NONE", italic = false },
	["@class.field.function"] = { link = "Function" },
	["@type"] = { link = "Type" },
	["@type.class"] = { link = "Type" },
	--["@type.inheritedClass"] = { fg = c.green, bg = "NONE", nocombine = true },
	--["@type.toml"] = { fg = c.green, bg = "NONE", italic = true },
	-- tomlTable = { fg = c.green, bg = "NONE", italic = true },
	--["@type.builtin"] = { fg = c.green, bg = "NONE" },
	["@include"] = { link = "Include" },
	["@include.identifier"] = { fg = p.lightBlue },
	["@keyword"] = { link = "Keyword" },
	["@keyword.return"] = { fg = p.lowerMint, bg = p.none },
	["@keyword.export"] = { link = "Include" },
	--["@keyword.function.lua"] = { fg = p.magenta, bg = "NONE", italic = true },
	--["@keyword.function.vim"] = { fg = c.magenta, bg = "NONE", italic = true },
	["@keyword.function.return"] = { link = "Keyword" },
	--["@keyword.abort"] = { fg = c.magenta, bg = "NONE", italic = true },
	["@keyword.default"] = { link = "Keyword" },
	["@keyword.static"] = { link = "Keyword" },
	["@keyword.extends"] = { link = "Keyword" },
	["@keyword.coroutine"] = { link = "Include" },
	["@keyword.operator"] = { link = "Include" },
	--["@keyword.jsdoc"] = { fg = c.magenta, bg = "NONE", nocombine = true },
	--["@keyword.command"] = { fg = c.green, bg = "NONE", nocombine = true },
	--["@command"] = { fg = c.green, bg = "NONE", nocombine = true },
	--["@label"] = { fg = c.cyan2, bg = "NONE" },
	--["@namespace.vim"] = { fg = c.light_blue, bg = "NONE", italic = true },
	--["@conditional.lua"] = { link = "Conditional" },
	["@constant"] = { link = "Constant" },
	["@constant.identifier"] = { link = "Constant" },
	["@constant.builtin"] = { link = "Constant" },
	["@constant.builtin.null"] = { fg = p.hotRed, bg = "NONE" },
	["@variable"] = { link = "Variable" },
	["@variable.builtin"] = { link = "Variable" },
	["@variable.object"] = { link = "Variable" },
	--["@variable.lua"] = { fg = c.green, bg = "NONE" },
	--["@variable.vim"] = { fg = c.green, bg = "NONE" },
	["@property"] = { fg = p.gray, bg = "NONE" },
	["@repeat"] = { fg = p.gray, bg = "NONE" },
	-- tomlKey = { fg = c.magenta, bg = "NONE", nocombine = true },
	--["@property.toml"] = { link = "@property" },
	tomlKeySq = { fg = p.pink, bg = "NONE", nocombine = true },
	["@object.property"] = { fg = p.lightBlue, bg = "NONE", italic = false },
	["@object.key"] = { fg = p.lightBlue, bg = "NONE", italic = false },
	["@field"] = { fg = p.offWhite, bg = "NONE" },
	["@parameter"] = { fg = p.offWhite, bg = "NONE" },
	["@parameter.jsdoc"] = { fg = p.offWhite, bg = "NONE" },
	--["@text.literal"] = { fg = c.green, bg = "NONE" },
	--["@text.uri"] = { fg = c.light_red, bg = "NONE", underline = true },
	--["@text.emphasis"] = { fg = c.magenta, bg = "NONE", italic = false },
	--["@text.strong"] = { fg = c.green, bg = "NONE", bold = true },
	--["@text.todo"] = { fg = c.bg, bg = c.fg },
	--["@operator.lua"] = { fg = c.cyan2, bg = "NONE" },
	--["@operator.toml"] = { fg = c.fg, bg = "NONE" },
	--["@operator.of"] = { fg = c.cyan2, bg = "NONE" },
	["@tag.component.jsx"] = { fg = p.brightMint, bg = "NONE", nocombine = true },
	["@tag"] = { fg = p.brightMint, bg = "NONE", nocombine = true },
	["@tag.delimiter"] = { fg = p.offWhite, bg = "NONE" },
	["@tag.attribute"] = { fg = p.desaturatedBlue, bg = "NONE", italic = false },
	--["@punctuation.string.delimiter"] = { fg = c.string_delimiter, bg = "NONE", nocombine = true },
	--["@punctuation.accessor"] = { link = "Statement" },
	["@string"] = { fg = p.gray },
	["@string.fragment"] = { link = "String" },
	["@string.regex"] = { fg = p.lowerBlue, bg = "NONE", nocombine = true },
	["@string.regexFlags"] = { fg = p.lightBlue, bg = "NONE", nocombine = true },
	["@string.json"] = { link = "String" },
	["@function.call"] = { fg = p.offWhite, bg = p.none },
	["method.call"] = { fg = p.offWhite, bg = p.none },
	--["@function.builtin.lua"] = { fg = p.blue, bg = "NONE", italic = false },

	-- custom queries
	["@boolean.true"] = { fg = p.brightMint },
	["@boolean.false"] = { fg = p.hotRed },

	-- rust
	["@string.rust"] = { link = "String" },
	["@namespace.rust"] = { link = "Keyword" },
	["@keyword.function"] = { link = "Include" },
	["@type.qualifier"] = { link = "Include" },
	["@keyword.special"] = { link = "Include" },

	-- Whichkey

	-- Git
	GitSignsAdd = { fg = p.brightMint, bg = "NONE" },
	GitSignsChange = { fg = p.desaturatedBlue, bg = "NONE" },
	GitSignsDelete = { fg = p.pink, bg = "NONE" },
	GitSignsChangedelete = { fg = p.brightYellow, bg = "NONE" },
	GitGutterAdd = { fg = p.brightMint, bg = "NONE" },
	GitGutterChange = { fg = p.desaturatedBlue, bg = "NONE" },
	GitGutterDelete = { fg = p.pink, bg = "NONE" },
	GitGutterChangeDelete = { fg = p.brightYellow, bg = "NONE" },

	-- Diagnostics
	DiagnosticError = { link = "Error" },
	DiagnosticHint = { fg = groups.hint },
	DiagnosticInfo = { fg = groups.info },
	DiagnosticWarn = { fg = groups.warn },
	DiagnosticDefaultError = { fg = groups.error },
	DiagnosticDefaultHint = { fg = groups.hint },
	DiagnosticDefaultInfo = { fg = groups.info },
	DiagnosticDefaultWarn = { fg = groups.warn },
	DiagnosticFloatingError = { fg = groups.error },
	DiagnosticFloatingHint = { fg = groups.hint },
	DiagnosticFloatingInfo = { fg = groups.info },
	DiagnosticFloatingWarn = { fg = groups.warn },
	DiagnosticSignError = { fg = groups.error },
	DiagnosticSignHint = { fg = groups.hint },
	DiagnosticSignInfo = { fg = groups.info },
	DiagnosticSignWarn = { fg = groups.warn },
	DiagnosticStatusLineError = { fg = groups.error, bg = groups.panel },
	DiagnosticStatusLineHint = { fg = groups.hint, bg = groups.panel },
	DiagnosticStatusLineInfo = { fg = groups.info, bg = groups.panel },
	DiagnosticStatusLineWarn = { fg = groups.warn, bg = groups.panel },
	DiagnosticUnderlineError = { sp = groups.error },
	DiagnosticUnderlineHint = { sp = groups.hint },
	DiagnosticUnderlineInfo = { sp = groups.info },
	DiagnosticUnderlineWarn = { sp = groups.warn },
	DiagnosticVirtualTextError = { fg = groups.error },
	DiagnosticVirtualTextHint = { fg = groups.hint },
	DiagnosticVirtualTextInfo = { fg = groups.info },
	DiagnosticVirtualTextWarn = { fg = groups.warn },

	-- LSP
	LspInfoBorder = { fg = p.focus, bg = "NONE" },

	-- SemanticTokens
	["@lsp.type.parameter"] = { fg = p.white, bg = "NONE" },
	["@lsp.type.property"] = { fg = p.white, bg = "NONE" },
	["@lsp.type.variable"] = { fg = p.white, bg = "NONE" },
	["@lsp.type.variable.lua"] = { fg = p.white, bg = "NONE" },

	-- Telescope
	TelescopeSelection = { fg = "NONE", bg = p.focus, bold = true },
	TelescopeMatching = { fg = p.white, bg = "NONE", bold = true },
	TelescopeBorder = { fg = p.focus, bg = "NONE" },

	-- NvimTree
	-- NvimTreeIndentMarker = { fg = c.nvim_tree_indent_marker, bg = "NONE" },
	-- NvimTreeNormal = { fg = c.dark_white, bg = "NONE" },
	-- NvimTreeNormalNC = { fg = c.ui_border, bg = "NONE" },
	-- NvimTreeSpecialFile = { fg = c.orange, bg = "NONE" },
	-- NvimTreeOpenedFile = { fg = "NONE", bg = "NONE", bold = true },
	-- NvimTreeImageFile = { fg = c.nvim_tree_file, bg = "NONE" },
	-- NvimTreeCursorLine = { fg = "NONE", bg = c.quickfix_line },
	-- NvimTreeGitStaged = { fg = c.sign_change, bg = "NONE" },
	-- NvimTreeGitNew = { fg = c.green, bg = "NONE" },
	-- NvimTreeGitRenamed = { fg = c.sign_add, bg = "NONE" },
	-- NvimTreeGitDeleted = { fg = c.sign_delete, bg = "NONE" },
	-- NvimTreeGitDirty = { fg = c.changed, bg = "NONE" },
	-- NvimTreeRootFolder = { fg = c.magenta, bg = "NONE" },
	-- NvimTreeWindowPicker = { fg = c.orange2, bg = c.dark, bold = true, italic = true },

	-- nvim-ts-rainbow
	rainbowcol1 = { fg = p.brightYellow },
	rainbowcol2 = { fg = p.lowerBlue },
	rainbowcol3 = { fg = p.hotRed },
	rainbowcol4 = { fg = p.brightYellow },
	rainbowcol5 = { fg = p.lowerBlue },
	rainbowcol6 = { fg = p.hotRed },
	rainbowcol7 = { fg = p.offWhite },

	-- barbar
	BufferCurrent = { fg = p.white, bg = p.bg },
	BufferCurrentIndex = { fg = p.white, bg = p.bg },
	BufferCurrentMod = { fg = p.white, bg = p.bg },
	BufferCurrentSign = { fg = p.white, bg = p.bg },
	BufferCurrentTarget = { fg = p.white, bg = p.bg },
	BufferInactive = { fg = p.gray },
	BufferInactiveIndex = { fg = p.gray },
	BufferInactiveMod = { fg = p.gray },
	BufferInactiveSign = { fg = p.gray },
	BufferInactiveTarget = { fg = p.gray },
	BufferTabpageFill = { fg = p.bg, bg = p.bg },
	BufferVisible = { fg = p.gray },
	BufferVisibleIndex = { fg = p.gray },
	BufferVisibleMod = { fg = p.brightMint },
	BufferVisibleSign = { fg = p.brightMint },
	BufferVisibleTarget = { fg = p.brightMint },

	-- glepnir/lspsaga.nvim
	TitleString = { fg = p.white },
	TitleIcon = { fg = p.offWhite },
	SagaBorder = { bg = p.none, fg = p.focus },
	SagaNormal = { bg = p.bg },
	SagaExpand = { fg = p.offWhite },
	SagaCollapse = { fg = p.offWhite },
	SagaBeacon = { bg = p.bluishGrayBrighter, fg = p.none },

	-- code action
	ActionPreviewNormal = { link = "SagaNormal" },
	ActionPreviewBorder = { link = "SagaBorder" },
	ActionPreviewTitle = { fg = p.white, bg = p.bg },

	CodeActionNormal = { link = "SagaNormal" },
	CodeActionBorder = { link = "SagaBorder" },
	CodeActionText = { fg = p.offWhite },
	CodeActionNumber = { fg = p.darkerGray },

	FinderSelection = { fg = p.offWhite, bg = p.none },
	FinderFName = { fg = p.lowerBlue },
	FinderCode = { fg = p.bluishGray },
	FinderCount = { link = "Constant" },
	FinderIcon = { fg = p.white },
	FinderType = { fg = p.white },
	FinderStart = { link = "Function" },

	-- nvim cmp
	CmpItemAbbr = { fg = p.offWhite },
	CmpItemAbbrDeprecated = { fg = p.hotRed, strikethrough = true },
	CmpItemAbbrMatch = { fg = p.white, bold = true },
	CmpItemAbbrMatchFuzzy = { fg = p.brightMint, bold = true },
	CmpItemKind = { fg = p.lightBlue },
	CmpItemKindClass = { fg = p.brightYellow },
	CmpItemKindFunction = { fg = p.hotRed },
	CmpItemKindInterface = { fg = p.bluishGray },
	CmpItemKindMethod = { fg = p.hotRed },
	CmpItemKindSnippet = { fg = p.desaturatedBlue },
	CmpItemKindVariable = { fg = p.white },

	-- Buffer

	-- StatusLine

	-- IndentBlankline
	IndentBlanklineChar = { link = "IndentChar" },
	IndentBlanklineSpaceChar = { link = "IndentChar" },
	IndentBlanklineSpaceCharBlankline = { link = "IndentChar" },
	IndentBlanklineContextChar = { link = "IndentContextChar" },
	IndentBlanklineContextStart = { fg = "NONE", bg = "NONE", sp = p.focus, underline = true },

	-- Dashboard

	-- Cmp

	-- Illuminate
	-- IlluminatedWordText = { fg = "NONE", bg = c.word_highlight },
	-- IlluminatedWordRead = { fg = "NONE", bg = c.word_highlight },
	-- IlluminatedWordWrite = { fg = "NONE", bg = c.word_highlight },

	-- DevIcons
	DevIconLua = { fg = p.lightBlue, bg = "NONE" },
}

theme.set_highlights = function()
	for group, value in pairs(highlights) do
		hl(0, group, value)
	end
end

return theme
