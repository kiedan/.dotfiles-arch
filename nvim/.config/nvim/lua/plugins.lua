-- automatically install and set up packer.nvim if it doesn't exist
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
	return true
	end
	return false
end

local packer_bootstrap = ensure_packer()


-- Plugins to install 
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'           -- let Packer manage itself
	use "ellisonleao/gruvbox.nvim"         -- Colorscheme

	use 'nvim-lua/plenary.nvim'            -- required by Telescope
	use {'nvim-telescope/telescope.nvim', tag = '0.1.0',}      -- fuzzyfinder
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}  -- better highlighting rzx

	--  LSP Setup and configuration (-> lsp-config.lua)
	use {"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",}
	
	-- Autocompletion Setup (->autocomplete-config-lua)
	use {'hrsh7th/nvim-cmp',         -- Autocompletion plugin
		'hrsh7th/cmp-nvim-lsp',      -- LSP source for nvim-cmp
		'saadparwaiz1/cmp_luasnip',  -- Snippets source for nvim-cmp
		'L3MON4D3/LuaSnip',          -- Snippets plugin
		'hrsh7th/cmp-buffer',      -- autocomplete based on words in active buffer
		'hrsh7th/cmp-path',      -- autocomplete File Paths
		'hrsh7th/cmp-nvim-lua',      -- autocomplete special nvim lua stuff
	}
	use 'vimwiki/vimwiki'
	use 'junegunn/goyo.vim'


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
