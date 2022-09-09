local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})



return require('packer').startup(function()
	--Have packer manage itself
	use 'wbthomason/packer.nvim'

	--colorscheme
	use 'gruvbox-community/gruvbox'
    --    use("lunarvim/darkplus.nvim")

    --Useful lua functions used in lots of plugins
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    
    use "hrsh7th/nvim-cmp"          -- The completion plugin
	use "hrsh7th/cmp-buffer"        -- Buffer completions
	use "hrsh7th/cmp-path"          -- Path completions
	use "saadparwaiz1/cmp_luasnip"  -- Snippet completions


    --Snippet engine
    use "L3MON4D3/LuaSnip" 
    use "rafamadriz/friendly-snippets"
   
end)
