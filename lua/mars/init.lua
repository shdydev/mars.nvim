-- lua/lucy/init.lua
-- lucy · cyberpunk edgerunner — nvim theme (high-contrast)
local M = {}

local colors = {
    -- core
    bg             = "#000000",
    fg             = "#f6f8ff",
    selected_bg    = "#262033",
    selected_fg    = "#f6f8ff",
    inactive_fg    = "#9da3b5",
    highlight      = "#00fff6", -- primary neon cyan
    gradient_start = "#c56cff", -- magenta -> cyan gradient for status/lsps
    gradient_mid   = "#8ff7ff",
    gradient_end   = "#00fff6",

    -- basic palette (from alacritty high-contrast)
    black   = "#0b0b10",
    red     = "#ff2d55",
    green   = "#2dffb3",
    yellow  = "#ffd93d",
    blue    = "#00e6ff",
    magenta = "#c56cff",
    cyan    = "#00fff6",
    white   = "#f6f8ff",

    -- bright variants
    bright_black   = "#2a2233",
    bright_red     = "#ff6b86",
    bright_green   = "#7dffc8",
    bright_yellow  = "#ffe58a",
    bright_blue    = "#8ff7ff",
    bright_magenta = "#f0b3ff",
    bright_cyan    = "#b6fff7",
    bright_white   = "#ffffff",

    -- dim / muted
    dim_black   = "#141218",
    dim_red     = "#7a2830",
    dim_green   = "#4f6f57",
    dim_yellow  = "#8f7a53",
    dim_blue    = "#2a5360",
    dim_magenta = "#5c3a60",
    dim_cyan    = "#2b5b57",
    dim_white   = "#9da3b5",
}

M.set_highlights = function()
    -- clear & reset
    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
    end
    vim.g.colors_name = "lucy"

    local hl = vim.api.nvim_set_hl

    -- core ui
    hl(0, "Normal",        { fg = colors.fg, bg = colors.bg })
    hl(0, "NormalFloat",   { fg = colors.fg, bg = colors.dim_black })
    hl(0, "FloatBorder",   { fg = colors.dim_blue, bg = colors.dim_black })
    hl(0, "CursorLine",    { bg = colors.selected_bg })
    hl(0, "CursorLineNr",  { fg = colors.highlight, bg = colors.selected_bg, bold = true })
    hl(0, "LineNr",        { fg = colors.inactive_fg, bg = colors.bg })
    hl(0, "StatusLine",    { fg = colors.selected_fg, bg = colors.selected_bg })
    hl(0, "StatusLineNC",  { fg = colors.inactive_fg, bg = colors.dim_black })
    hl(0, "VertSplit",     { fg = colors.dim_blue, bg = colors.bg })
    hl(0, "TabLine",       { fg = colors.inactive_fg, bg = colors.bg })
    hl(0, "TabLineSel",    { fg = colors.fg, bg = colors.selected_bg, bold = true })
    hl(0, "Pmenu",         { fg = colors.fg, bg = colors.dim_black })
    hl(0, "PmenuSel",      { fg = colors.selected_fg, bg = colors.highlight })
    hl(0, "PmenuSbar",     { bg = colors.dim_black })
    hl(0, "PmenuThumb",    { bg = colors.dim_blue })
    hl(0, "Visual",        { bg = colors.selected_bg })
    hl(0, "Search",        { fg = colors.bg, bg = colors.highlight })
    hl(0, "IncSearch",     { fg = colors.bg, bg = colors.magenta })
    hl(0, "WildMenu",      { fg = colors.bg, bg = colors.highlight })
    hl(0, "Directory",     { fg = colors.green })
    hl(0, "Title",         { fg = colors.fg, bold = true })

    -- syntax
    hl(0, "Comment",       { fg = colors.dim_white, italic = true })
    hl(0, "Constant",      { fg = colors.cyan })
    hl(0, "String",        { fg = colors.yellow })
    hl(0, "Character",     { fg = colors.green })
    hl(0, "Number",        { fg = colors.red })
    hl(0, "Boolean",       { fg = colors.red })
    hl(0, "Float",         { fg = colors.red })
    hl(0, "Identifier",    { fg = colors.cyan })
    hl(0, "Function",      { fg = colors.magenta })
    hl(0, "Statement",     { fg = colors.magenta })
    hl(0, "Conditional",   { fg = colors.magenta })
    hl(0, "Repeat",        { fg = colors.magenta })
    hl(0, "Label",         { fg = colors.magenta })
    hl(0, "Operator",      { fg = colors.fg })
    hl(0, "Keyword",       { fg = colors.magenta, bold = true })
    hl(0, "Exception",     { fg = colors.magenta })
    hl(0, "PreProc",       { fg = colors.yellow })
    hl(0, "Include",       { fg = colors.magenta })
    hl(0, "Type",          { fg = colors.green })
    hl(0, "StorageClass",  { fg = colors.green })
    hl(0, "Structure",     { fg = colors.green })
    hl(0, "Special",       { fg = colors.yellow })
    hl(0, "SpecialChar",   { fg = colors.highlight })
    hl(0, "Tag",           { fg = colors.highlight })
    hl(0, "Delimiter",     { fg = colors.fg })
    hl(0, "Underlined",    { fg = colors.blue, underline = true })
    hl(0, "Error",         { fg = colors.bg, bg = colors.red })
    hl(0, "Todo",          { fg = colors.bg, bg = colors.yellow })

    -- diff & git
    hl(0, "DiffAdd",       { fg = colors.green, bg = colors.dim_black })
    hl(0, "DiffChange",    { fg = colors.yellow, bg = colors.dim_black })
    hl(0, "DiffDelete",    { fg = colors.red, bg = colors.dim_black })
    hl(0, "DiffText",      { fg = colors.fg, bg = colors.selected_bg })

    -- diagnostics
    hl(0, "DiagnosticError",   { fg = colors.red })
    hl(0, "DiagnosticWarn",    { fg = colors.yellow })
    hl(0, "DiagnosticInfo",    { fg = colors.blue })
    hl(0, "DiagnosticHint",    { fg = colors.cyan })

    -- lsp / treesitter-ish groups
    hl(0, "@variable",     { fg = colors.cyan })
    hl(0, "@function",     { fg = colors.magenta })
    hl(0, "@keyword",      { fg = colors.magenta })
    hl(0, "@string",       { fg = colors.yellow })
    hl(0, "@number",       { fg = colors.red })
    hl(0, "@boolean",      { fg = colors.red })
    hl(0, "@comment",      { fg = colors.dim_white, italic = true })
    hl(0, "@type",         { fg = colors.green })
    hl(0, "@constant",     { fg = colors.cyan })
    hl(0, "@operator",     { fg = colors.fg })
    hl(0, "@punctuation",  { fg = colors.fg })

    -- misc
    hl(0, "NonText",       { fg = colors.dim_white })
    hl(0, "SignColumn",    { bg = colors.bg })
    hl(0, "Folded",        { fg = colors.inactive_fg, bg = colors.dim_black })
    hl(0, "FoldColumn",    { fg = colors.inactive_fg })
end

M.setup = function()
    vim.o.termguicolors = true
    M.set_highlights()
end

return M
