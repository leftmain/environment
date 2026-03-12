-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
  { "junegunn/fzf", build = "./install --all" },
  { "junegunn/fzf.vim" },
})

-- Theme
vim.cmd("colorscheme mine")
vim.opt.ruler = true
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.fillchars:append("vert: ")
vim.opt.showtabline = 2
vim.opt.title = true
vim.opt.termguicolors = false
vim.cmd("set t_Co=256")
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wildmenu = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

-- Search
vim.cmd("nohl")
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Keyboard layout (Cyrillic langmap)
vim.opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

-- Keybindings
vim.keymap.set("n", "<C-m>", ":nohl<CR><C-l>", { silent = true })
vim.keymap.set("", ";", ":FZF<CR>")
vim.keymap.set("n", "\\", ":terminal<CR>")
vim.keymap.set("", "<C-d>", ":q<CR>")
vim.keymap.set("", "<C-h>", ":tabprevious<CR>")
vim.keymap.set("", "<C-l>", ":tabnext<CR>")
vim.keymap.set("", "<C-j>", "10j")
vim.keymap.set("", "<C-k>", "10k")
vim.keymap.set("", "<C-t>", ":tabnew<CR>")
vim.keymap.set("", "<C-u>", "<C-w>h")
vim.keymap.set("", "<C-i>", "<C-w>l")
vim.keymap.set("", "<C-v>", "<C-w>v<C-w>l")
