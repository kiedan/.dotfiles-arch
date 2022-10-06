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

packer_autoinstall = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'           -- let Packer manage itself
	use "ellisonleao/gruvbox.nvim"         -- Colorscheme
	use 'nvim-lua/plenary.nvim'            -- required by Telescope
	use {'nvim-telescope/telescope.nvim', tag = '0.1.0',}
	use {'vimwiki/vimwiki'}


end)
