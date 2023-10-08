local options = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 2,
	completeopt = { "menuone", "noselect" },
	encoding = "utf-8",
	errorbells = false,
	expandtab = true,
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	number = true,
	relativenumber = true,
	shiftwidth = 2,
	pumheight = 10,
	scrolloff = 10,
	showmode = true, 
	showtabline = 0,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	timeoutlen = 1000,
	undofile = true,
	updatetime = 500,
	writebackup = false,
	tabstop = 2,
	cursorline = false,
	numberwidth = 4,
	signcolumn = "yes",
	wrap = false,
	sidescrolloff = 8,
	guifont = "monospace:h17",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
