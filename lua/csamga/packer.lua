-- Auto install Packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

	if fn.empty(fn.glob(install_path)) > 0 then
  	fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  	vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Plugins
require('packer').startup {
	function(use)
		use 'wbthomason/packer.nvim' -- Packer can manage itself

  	use {	-- LSP
  		'neovim/nvim-lspconfig',
  		requires = {
  			'williamboman/mason.nvim',
  			'williamboman/mason-lspconfig.nvim',
  			{
  				'folke/neodev.nvim',
  				config = function()
  					require('neodev').setup {}
  				end,
  			},
  			{
  				'j-hui/fidget.nvim',
  				config = function()
  					require('fidget').setup {}
  				end,
  			},
  			'jose-elias-alvarez/nvim-lsp-ts-utils',
  		},
  		config = require('csamga.lsp').config,
  	}

  	use { -- Auto completion
  		'hrsh7th/nvim-cmp',
  		requires = {
  			'hrsh7th/cmp-nvim-lsp',
  			'L3MON4D3/LuaSnip',
  			'saadparwaiz1/cmp_luasnip',
  			'onsails/lspkind.nvim',
  		},
  		config = require('csamga.nvim-cmp').config,
  	}

  	use { -- DAP
  		'mfussenegger/nvim-dap',
  		requires = {
  			'rcarriga/nvim-dap-ui',
  			'williamboman/mason.nvim',
  			'jay-babu/mason-nvim-dap.nvim',
  		},
  		config = require('csamga.dap').config,
  	}

  	use { -- Fuzzy finder
  		'nvim-telescope/telescope.nvim', tag = '0.1.1',
  		requires = 'nvim-lua/plenary.nvim',
  		config = require('csamga.telescope').config,
  	}

  	use { -- Code highlighting and navigation
  		'nvim-treesitter/nvim-treesitter',
  		run = function()
  			pcall(require('nvim-treesitter.install').update { with_sync = true })
  		end,
  		config = require('csamga.treesitter').config,
  	}

  	use {
  		'nvim-treesitter/nvim-treesitter-textobjects',
  		requires = 'nvim-treesitter/nvim-treesitter',
  		after = 'nvim-treesitter',
  		opt = false,
  	}

  	use { -- Auto close pairs of brackets, parentheses, ...
  		'windwp/nvim-autopairs',
  		opt = false,
  		after = {
  			'nvim-treesitter',
  			'nvim-cmp',
  		},
  		config = require('csamga.autopairs').config,
  	}

  	use { -- Auto close HTML tags
  		'windwp/nvim-ts-autotag',
  		opt = false,
  		after = 'nvim-treesitter',
  		config = require('csamga.autotag').config,
  	}

  	use { -- Git
  		'tpope/vim-fugitive',
  		'tpope/vim-rhubarb',
  		'lewis6991/gitsigns.nvim',
  	}

  	use { -- VSCode theme
  		'Mofiqul/vscode.nvim',
  		config = require('csamga.vscode').config,
  	}

    use { -- Status line
    	'nvim-lualine/lualine.nvim',
    	requires = {
    		'kyazdani42/nvim-web-devicons',
    		opt = true,
    	},
    	after = 'vscode.nvim',
    	config = require('csamga.lualine').config,
    }

  	use { -- Indentation guides
  		'lukas-reineke/indent-blankline.nvim',
  		config = require('csamga.indent-blankline').config,
  	}

		if packer_bootstrap then
			require('packer').sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				local result, window, buffer = require('packer.util').float {
					border = {
						{ '╭', 'FloatBorder' },
						{ '─', 'FloatBorder' },
						{ '╮', 'FloatBorder' },
						{ '│', 'FloatBorder' },
						{ '╯', 'FloatBorder' },
						{ '─', 'FloatBorder' },
						{ '╰', 'FloatBorder' },
						{ '│', 'FloatBorder' },
					},
				}
				vim.api.nvim_win_set_option(window, 'winhighlight', 'NormalFloat:Normal')
				return result, window, buffer
			end,
		},
	},
}

if packer_bootstrap then
	print '╭─────────────────────────────────╮'
	print '│   Plugins are being installed   │'
	print '│   Wait until Packer completes   │'
	print '│        then restart nvim        │'
	print '╰─────────────────────────────────╯'
	return
end

-- Auto source and re-compile Packer when saving init.lua
--local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
--vim.api.nvim_create_autocmd('BufWritePost', {
--	command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
--	group = packer_group,
--	pattern = vim.fn.expand '$MYVIMRC',
--})
