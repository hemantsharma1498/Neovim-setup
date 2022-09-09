local o=vim.o
local g=vim.g
local A=vim.api

local opts={noremap=true, silent=true}
local keymap=A.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Normal Mode
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)




--
keymap('i', 'cmd', '<ESC>', {noremap=true})
