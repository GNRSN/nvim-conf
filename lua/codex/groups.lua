---@class Highlight
---@field fg string color name or "#RRGGBB"
---@field foreground string same fg, color name or "#RRGGBB"
---@field bg string color name or "#RRGGBB"
---@field background string same bg, color name or "#RRGGBB"
---@field sp string color name or "#RRGGBB"
---@field special string same sg, color name or "#RRGGBB"
---@field blend integer value between 0 and 100
---@field bold boolean
---@field standout boolean
---@field underline boolean
---@field undercurl boolean
---@field underdouble boolean
---@field underdotted boolean
---@field underdashed boolean
---@field strikethrough boolean
---@field italic boolean
---@field reverse boolean
---@field nocombine boolean
---@field link string name of another highlight group to link to, see |:hi-link|.
---@field default string Don't override existing definition |:hi-default|
---@field ctermfg integer Sets foreground of cterm color |highlight-ctermfg|
---@field ctermbg integer Sets background of cterm color |highlight-ctermbg|
---@field cterm table cterm attribute map, like |highlight-args|.

---setup highlight groups
---@param configs DefaultConfig
---@return table<string, Highlight>
---@nodiscard
local function setup(configs)
	local colors = configs.colors
	local endOfBuffer = {
		fg = configs.show_end_of_buffer and colors.visual or colors.bg,
	}

	return {
		Normal = { fg = colors.fg, bg = colors.bg },
		NormalFloat = { fg = colors.fg, bg = colors.bg },
		Comment = { fg = colors.comment, italic = configs.italic_comment },
		Constant = { fg = colors.yellow },
		String = { fg = colors.yellow },
		Character = { fg = colors.green },
		Number = { fg = colors.blue_light },
		Boolean = { fg = colors.cyan },
		Float = { fg = colors.blue_light },
		FloatBorder = { fg = colors.white },
		Operator = { fg = colors.purple },
		--Keyword = { fg = colors.cyan },
		--Keywords = { fg = colors.cyan },
		--Identifier = { fg = colors.cyan },
		Function = { fg = colors.yellow },
		Statement = { fg = colors.purple },
		Conditional = { fg = colors.purple },
		Repeat = { fg = colors.pink },
		--Label = { fg = colors.cyan },
		Exception = { fg = colors.purple },
		PreProc = { fg = colors.yellow },
		Include = { fg = colors.purple },
		Define = { fg = colors.purple },
		--Title = { fg = colors.cyan },
		Macro = { fg = colors.purple },
		--PreCondit = { fg = colors.cyan },
		--Type = { fg = colors.cyan },
		StorageClass = { fg = colors.pink },
		Structure = { fg = colors.yellow },
		TypeDef = { fg = colors.yellow },
		Special = { fg = colors.green, italic = true },
		SpecialComment = { fg = colors.comment, italic = true },
		Error = { fg = colors.bright_red },
		Todo = { fg = colors.purple, bold = true, italic = true },
		Underlined = { fg = colors.cyan, underline = true },

		Cursor = { reverse = true },
		CursorLineNr = { fg = colors.fg, bold = true },

		SignColumn = { bg = colors.bg },

		Conceal = { fg = colors.fade },
		CursorColumn = { bg = colors.black },
		CursorLine = { bg = colors.selection },
		ColorColumn = { bg = colors.selection },

		StatusLine = { fg = colors.white, bg = colors.black },
		StatusLineNC = { fg = colors.fade },
		StatusLineTerm = { fg = colors.white, bg = colors.black },
		StatusLineTermNC = { fg = colors.fade },

		Directory = { fg = colors.cyan },
		DiffAdd = { fg = colors.bg, bg = colors.green },
		DiffChange = { fg = colors.orange },
		DiffDelete = { fg = colors.red },
		DiffText = { fg = colors.fade },

		ErrorMsg = { fg = colors.bright_red },
		VertSplit = { fg = colors.black },
		Folded = { fg = colors.fade },
		FoldColumn = {},
		Search = { fg = colors.black, bg = colors.orange },
		IncSearch = { fg = colors.orange, bg = colors.fade },
		LineNr = { fg = colors.fade },
		MatchParen = { fg = colors.fg, underline = true },
		NonText = { fg = colors.nontext },
		Pmenu = { fg = colors.white, bg = colors.menu },
		PmenuSel = { fg = colors.white, bg = colors.selection },
		PmenuSbar = { bg = colors.bg },
		PmenuThumb = { bg = colors.selection },

		Question = { fg = colors.purple },
		QuickFixLine = { fg = colors.black, bg = colors.yellow },
		SpecialKey = { fg = colors.nontext },

		SpellBad = { fg = colors.bright_red, underline = true },
		SpellCap = { fg = colors.yellow },
		SpellLocal = { fg = colors.yellow },
		SpellRare = { fg = colors.yellow },

		TabLine = { fg = colors.fade },
		TabLineSel = { fg = colors.white },
		TabLineFill = { bg = colors.bg },
		Terminal = { fg = colors.white, bg = colors.black },
		Visual = { bg = colors.visual },
		VisualNOS = { fg = colors.visual },
		WarningMsg = { fg = colors.yellow },
		WildMenu = { fg = colors.black, bg = colors.white },

		EndOfBuffer = endOfBuffer,

		DiagnosticUnnecessary = { fg = colors.gutter_fg },

		-- TreeSitter
		-- The list of capture-groups can  be found at:
		-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#parser-configurations
		["@error"] = { fg = colors.bright_red },
		["@punctuation.delimiter"] = { fg = colors.fg },
		["@punctuation.bracket"] = { fg = colors.blue_medium },
		["@punctuation.special"] = { fg = colors.blue },

		["@symbol"] = { fg = colors.purple },

		--["@constant.macro"] = { fg = colors.cyan },
		["@string.regex"] = { fg = colors.red },
		["@string"] = { fg = colors.orange },
		["@string.escape"] = { fg = colors.cyan },
		["@character"] = { fg = colors.yellow },
		["@number"] = { fg = colors.blue_light },
		["@boolean"] = { fg = colors.blue_medium },
		["@float"] = { fg = colors.yellow },
		["@annotation"] = { fg = colors.yellow },
		["@attribute"] = { fg = colors.cyan },
		["@namespace"] = { fg = colors.blue_green },

		["@function.builtin"] = { fg = colors.cyan },
		["@function"] = { fg = colors.yellow },
		["@function.macro"] = { fg = colors.yellow },
		["@parameter"] = { fg = colors.blue_light },
		["@parameter.reference"] = { fg = colors.blue_light },
		["@method"] = { fg = colors.yellow },
		["@field"] = { fg = colors.blue_light },
		["@property"] = { fg = colors.blue_light },
		["@constructor"] = { fg = colors.blue_green },

		["@conditional.ternary"] = { fg = colors.bright_yellow },
		["@repeat"] = { fg = colors.pink },
		--["@label"] = { fg = colors.cyan },

		["@keyword"] = { fg = colors.blue },
		["@keyword.function"] = { fg = colors.blue },
		["@keyword.return"] = { fg = colors.purple },
		["@keyword.export"] = { fg = colors.purple },
		["@keyword.coroutine"] = { fg = colors.purple },
		["@keyword.operator"] = { fg = colors.purple },
		["@operator"] = { fg = colors.bright_white },
		["@exception"] = { fg = colors.red },
		["@structure"] = { fg = colors.purple },
		["@include"] = { fg = colors.purple },

		["@variable"] = { fg = colors.blue_variable_name },
		["@definition"] = { fg = colors.green },
		["@variable.builtin"] = { fg = colors.blue_light },
		["@constant"] = { fg = colors.blue_variable_name },
		["@constant.builtin"] = { fg = colors.blue_medium },

		["@text"] = { fg = colors.orange },
		["@text.strong"] = { fg = colors.orange, bold = true }, -- bold
		["@text.emphasis"] = { fg = colors.yellow, italic = true }, -- italic
		["@text.underline"] = { fg = colors.orange },
		["@text.title"] = { fg = colors.pink, bold = true }, -- title
		["@text.literal"] = { fg = colors.yellow }, -- inline code
		["@text.uri"] = { fg = colors.yellow, italic = true }, -- urls
		["@text.reference"] = { fg = colors.orange, bold = true },

		["@tag"] = { fg = colors.blue },
		["@tag.attribute"] = { fg = colors.blue_light },
		["@tag.delimiter"] = { fg = colors.gutter_fg },

		["@type"] = { fg = colors.blue_green },
		["@type.builtin"] = { fg = colors.blue_green, italic = true },
		["@type.qualifier"] = { fg = colors.pink },

		-- Semantic
		["@class"] = { fg = colors.blue_green },
		["@struct"] = { fg = colors.blue },
		["@enum"] = { fg = colors.blue },
		["@enumMember"] = { fg = colors.purple },
		["@event"] = { fg = colors.blue },
		["@interface"] = { fg = colors.blue_light },
		["@modifier"] = { fg = colors.blue },
		["@regexp"] = { fg = colors.bright_red },
		["@typeParameter"] = { fg = colors.blue_green },
		["@decorator"] = { fg = colors.green },

		-- LSP Semantic tokens
		-- @see https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#textDocument_semanticTokens

		["@lsp.type.class"] = {},
		["@lsp.type.decorator"] = { fg = colors.red },
		["@lsp.type.enum"] = { fg = colors.red },
		["@lsp.type.enumMember"] = { fg = colors.red },
		["@lsp.type.function"] = { fg = colors.yellow },
		["@lsp.type.interface"] = { fg = colors.blue_green },
		["@lsp.type.macro"] = { fg = colors.red },
		["@lsp.type.method"] = { fg = colors.yellow },
		["@lsp.type.namespace"] = { fg = colors.blue_green },
		["@lsp.type.parameter"] = { fg = colors.red },
		["@lsp.type.property"] = { fg = colors.blue_light },
		["@lsp.type.struct"] = { fg = colors.red },
		["@lsp.type.type"] = { fg = colors.blue_green },
		["@lsp.type.typeParameter"] = { fg = colors.red },
		["@lsp.type.variable"] = {},

		["@lsp.mod.deprecated"] = { strikethrough = true },
		-- JS
		-- ["@"]

		-- HTML
		htmlArg = { fg = colors.green },
		htmlBold = { fg = colors.yellow, bold = true },
		htmlEndTag = { fg = colors.cyan },
		htmlH1 = { fg = colors.pink },
		htmlH2 = { fg = colors.pink },
		htmlH3 = { fg = colors.pink },
		htmlH4 = { fg = colors.pink },
		htmlH5 = { fg = colors.pink },
		htmlH6 = { fg = colors.pink },
		htmlItalic = { fg = colors.purple, italic = true },
		htmlLink = { fg = colors.purple, underline = true },
		htmlSpecialChar = { fg = colors.yellow },
		htmlSpecialTagName = { fg = colors.cyan },
		htmlTag = { fg = colors.cyan },
		htmlTagN = { fg = colors.cyan },
		htmlTagName = { fg = colors.cyan },
		htmlTitle = { fg = colors.white },

		-- Markdown
		markdownBlockquote = { fg = colors.yellow, italic = true },
		markdownBold = { fg = colors.orange, bold = true },
		markdownCode = { fg = colors.green },
		markdownCodeBlock = { fg = colors.orange },
		markdownCodeDelimiter = { fg = colors.red },
		markdownH1 = { fg = colors.pink, bold = true },
		markdownH2 = { fg = colors.pink, bold = true },
		markdownH3 = { fg = colors.pink, bold = true },
		markdownH4 = { fg = colors.pink, bold = true },
		markdownH5 = { fg = colors.pink, bold = true },
		markdownH6 = { fg = colors.pink, bold = true },
		markdownHeadingDelimiter = { fg = colors.red },
		markdownHeadingRule = { fg = colors.fade },
		markdownId = { fg = colors.purple },
		markdownIdDeclaration = { fg = colors.cyan },
		markdownIdDelimiter = { fg = colors.purple },
		markdownItalic = { fg = colors.yellow, italic = true },
		markdownLinkDelimiter = { fg = colors.purple },
		markdownLinkText = { fg = colors.pink },
		markdownListMarker = { fg = colors.cyan },
		markdownOrderedListMarker = { fg = colors.red },
		markdownRule = { fg = colors.fade },

		--  Diff
		diffAdded = { fg = colors.green },
		diffRemoved = { fg = colors.red },
		diffFileId = { fg = colors.yellow, bold = true, reverse = true },
		diffFile = { fg = colors.nontext },
		diffNewFile = { fg = colors.green },
		diffOldFile = { fg = colors.red },

		debugPc = { bg = colors.cyan },
		debugBreakpoint = { fg = colors.red, reverse = true },

		-- Git Signs
		GitSignsAdd = { fg = colors.bright_green },
		GitSignsChange = { fg = colors.cyan },
		GitSignsDelete = { fg = colors.bright_red },
		GitSignsAddLn = { fg = colors.black, bg = colors.bright_green },
		GitSignsChangeLn = { fg = colors.black, bg = colors.cyan },
		GitSignsDeleteLn = { fg = colors.black, bg = colors.bright_red },
		GitSignsCurrentLineBlame = { fg = colors.white },

		-- Telescope
		TelescopePromptBorder = { fg = colors.fade },
		TelescopeResultsBorder = { fg = colors.fade },
		TelescopePreviewBorder = { fg = colors.fade },
		TelescopeSelection = { fg = colors.white, bg = colors.selection },
		TelescopeMultiSelection = { fg = colors.purple, bg = colors.selection },
		TelescopeNormal = { fg = colors.fg, bg = colors.bg },
		TelescopeMatching = { fg = colors.green },
		TelescopePromptPrefix = { fg = colors.purple },

		-- NvimTree
		NvimTreeNormal = { fg = colors.fg, bg = colors.menu },
		NvimTreeVertSplit = { fg = colors.bg, bg = colors.bg },
		NvimTreeRootFolder = { fg = colors.fg, bold = true },
		NvimTreeGitDirty = { fg = colors.yellow },
		NvimTreeGitNew = { fg = colors.bright_green },
		NvimTreeImageFile = { fg = colors.pink },
		NvimTreeFolderIcon = { fg = colors.purple },
		NvimTreeIndentMarker = { fg = colors.nontext },
		NvimTreeEmptyFolderName = { fg = colors.fade },
		NvimTreeFolderName = { fg = colors.fg },
		NvimTreeSpecialFile = { fg = colors.pink, underline = true },
		NvimTreeOpenedFolderName = { fg = colors.fg },
		NvimTreeCursorLine = { bg = colors.selection },
		NvimTreeIn = { bg = colors.selection },

		NvimTreeEndOfBuffer = endOfBuffer,

		-- NeoTree
		NeoTreeNormal = { fg = colors.fg, bg = colors.menu },
		NeoTreeNormalNC = { fg = colors.fg, bg = colors.menu },
		NeoTreeDirectoryName = { fg = colors.fg },
		NeoTreeGitUnstaged = { fg = colors.bright_magenta },
		NeoTreeGitModified = { fg = colors.bright_magenta },
		NeoTreeGitUntracked = { fg = colors.bright_green },
		NeoTreeDirectoryIcon = { fg = colors.purple },
		NeoTreeIndentMarker = { fg = colors.nontext },
		NeoTreeDotfile = { fg = colors.fade },

		-- Bufferline
		BufferLineIndicatorSelected = { fg = colors.purple },
		BufferLineFill = { bg = colors.black },
		BufferLineBufferSelected = { bg = colors.bg },

		-- LSP
		DiagnosticError = { fg = colors.red },
		DiagnosticWarn = { fg = colors.yellow },
		DiagnosticInfo = { fg = colors.cyan },
		DiagnosticHint = { fg = colors.cyan },
		DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
		DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
		DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan },
		DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan },
		DiagnosticSignError = { fg = colors.red },
		DiagnosticSignWarn = { fg = colors.yellow },
		DiagnosticSignInfo = { fg = colors.cyan },
		DiagnosticSignHint = { fg = colors.cyan },
		DiagnosticFloatingError = { fg = colors.red },
		DiagnosticFloatingWarn = { fg = colors.yellow },
		DiagnosticFloatingInfo = { fg = colors.cyan },
		DiagnosticFloatingHint = { fg = colors.cyan },
		DiagnosticVirtualTextError = { fg = colors.red },
		DiagnosticVirtualTextWarn = { fg = colors.yellow },
		DiagnosticVirtualTextInfo = { fg = colors.cyan },
		DiagnosticVirtualTextHint = { fg = colors.cyan },

		LspDiagnosticsDefaultError = { fg = colors.red },
		LspDiagnosticsDefaultWarning = { fg = colors.yellow },
		LspDiagnosticsDefaultInformation = { fg = colors.cyan },
		LspDiagnosticsDefaultHint = { fg = colors.cyan },
		LspDiagnosticsUnderlineError = { fg = colors.red, undercurl = true },
		LspDiagnosticsUnderlineWarning = { fg = colors.yellow, undercurl = true },
		LspDiagnosticsUnderlineInformation = { fg = colors.cyan, undercurl = true },
		LspDiagnosticsUnderlineHint = { fg = colors.cyan, undercurl = true },
		LspReferenceText = { fg = colors.orange },
		LspReferenceRead = { fg = colors.orange },
		LspReferenceWrite = { fg = colors.orange },
		LspCodeLens = { fg = colors.cyan },

		--LSP Saga
		LspFloatWinNormal = { fg = colors.fg },
		LspFloatWinBorder = { fg = colors.fade },
		LspSagaHoverBorder = { fg = colors.fade },
		LspSagaSignatureHelpBorder = { fg = colors.fade },
		LspSagaCodeActionBorder = { fg = colors.fade },
		LspSagaDefPreviewBorder = { fg = colors.fade },
		LspLinesDiagBorder = { fg = colors.fade },
		LspSagaRenameBorder = { fg = colors.fade },
		LspSagaBorderTitle = { fg = colors.menu },
		LSPSagaDiagnosticTruncateLine = { fg = colors.fade },
		LspSagaDiagnosticBorder = { fg = colors.fade },
		LspSagaShTruncateLine = { fg = colors.fade },
		LspSagaDocTruncateLine = { fg = colors.fade },
		LspSagaLspFinderBorder = { fg = colors.fade },

		-- IndentBlankLine
		IndentBlanklineContextChar = { fg = colors.bright_red, nocombine = true },

		-- Nvim compe
		CmpItemAbbrDeprecated = { fg = colors.white, bg = colors.menu },
		CmpItemAbbrMatch = { fg = colors.cyan, bg = colors.menu },

		--barbar
		BufferCurrentTarget = { fg = colors.red },
		BufferVisibleTarget = { fg = colors.red },
		BufferInactiveTarget = { fg = colors.red },

		-- Compe
		CompeDocumentation = { link = "Pmenu" },
		CompeDocumentationBorder = { link = "Pmenu" },

		-- Cmp
		CmpItemKind = { link = "Pmenu" },
		CmpItemAbbr = { link = "Pmenu" },
		CmpItemKindMethod = { link = "@method" },
		CmpItemKindText = { link = "@text" },
		CmpItemKindFunction = { link = "@function" },
		CmpItemKindConstructor = { link = "@type" },
		CmpItemKindVariable = { link = "@variable" },
		CmpItemKindClass = { link = "@type" },
		CmpItemKindInterface = { link = "@type" },
		CmpItemKindModule = { link = "@namespace" },
		CmpItemKindProperty = { link = "@property" },
		CmpItemKindOperator = { link = "@operator" },
		CmpItemKindReference = { link = "@parameter.reference" },
		CmpItemKindUnit = { link = "@field" },
		CmpItemKindValue = { link = "@field" },
		CmpItemKindField = { link = "@field" },
		CmpItemKindEnum = { link = "@field" },
		CmpItemKindKeyword = { link = "@keyword" },
		CmpItemKindSnippet = { link = "@text" },
		CmpItemKindColor = { link = "DevIconCss" },
		CmpItemKindFile = { link = "TSURI" },
		CmpItemKindFolder = { link = "TSURI" },
		CmpItemKindEvent = { link = "@constant" },
		CmpItemKindEnumMember = { link = "@field" },
		CmpItemKindConstant = { link = "@constant" },
		CmpItemKindStruct = { link = "@structure" },
		CmpItemKindTypeParameter = { link = "@parameter" },

		-- navic
		NavicIconsFile = { link = "CmpItemKindFile" },
		NavicIconsModule = { link = "CmpItemKindModule" },
		NavicIconsNamespace = { link = "CmpItemKindModule" },
		NavicIconsPackage = { link = "CmpItemKindModule" },
		NavicIconsClass = { link = "CmpItemKindClass" },
		NavicIconsMethod = { link = "CmpItemKindMethod" },
		NavicIconsProperty = { link = "CmpItemKindProperty" },
		NavicIconsField = { link = "CmpItemKindField" },
		NavicIconsConstructor = { link = "CmpItemKindConstructor" },
		NavicIconsEnum = { link = "CmpItemKindEnum" },
		NavicIconsInterface = { link = "CmpItemKindInterface" },
		NavicIconsFunction = { link = "CmpItemKindFunction" },
		NavicIconsVariable = { link = "CmpItemKindVariable" },
		NavicIconsConstant = { link = "CmpItemKindConstant" },
		NavicIconsString = { link = "String" },
		NavicIconsNumber = { link = "Number" },
		NavicIconsBoolean = { link = "Boolean" },
		NavicIconsArray = { link = "CmpItemKindClass" },
		NavicIconsObject = { link = "CmpItemKindClass" },
		NavicIconsKey = { link = "CmpItemKindKeyword" },
		NavicIconsKeyword = { link = "CmpItemKindKeyword" },
		NavicIconsNull = { fg = "blue" },
		NavicIconsEnumMember = { link = "CmpItemKindEnumMember" },
		NavicIconsStruct = { link = "CmpItemKindStruct" },
		NavicIconsEvent = { link = "CmpItemKindEvent" },
		NavicIconsOperator = { link = "CmpItemKindOperator" },
		NavicIconsTypeParameter = { link = "CmpItemKindTypeParameter" },
		NavicText = { fg = "gray" },
		NavicSeparator = { fg = "gray" },

		-- TS rainbow colors
		TSRainbowRed = { fg = colors.yellow_sunflower },
		TSRainbowYellow = { fg = colors.pink },
		TSRainbowBlue = { fg = colors.blue },
		TSRainbowOrange = { fg = colors.pink },
		TSRainbowGreen = { fg = colors.pink },
		TSRainbowViolet = { fg = colors.pink },
		TSRainbowCyan = { fg = colors.green },

		-- Nvim-Scrollbar
		ScrollbarHandle = { fg = nil, bg = colors.bg },
		ScrollbarCursorHandle = { fg = colors.gutter_fg, bg = colors.gutter_fg },
		-- ScrollbarCursor
		-- ScrollbarSearchHandle
		-- ScrollbarSearch
		-- ScrollbarErrorHandle
		-- ScrollbarError
		-- ScrollbarWarnHandle
		-- ScrollbarWarn
		-- ScrollbarInfoHandle
		-- ScrollbarInfo
		-- ScrollbarHintHandle
		-- ScrollbarHint
		-- ScrollbarMiscHandle
		-- ScrollbarMisc
		-- ScrollbarGitAdd
		-- ScrollbarGitAddHandle
		-- ScrollbarGitChange
		-- ScrollbarGitChangeHandle
		-- ScrollbarGitDelete
		-- ScrollbarGitDeleteHandle
	}
end

return {
	setup = setup,
}
