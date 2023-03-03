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

-- Auto source and re-compile Packer when saving plugins.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | silent! LspStop | silent! LspStart | PackerSync',
	group = packer_group,
	pattern = vim.fn.expand(vim.fn.stdpath('config')..'/lua/core/plugins.lua'),
})

-- Packer configuration
require('packer').init {
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
	max_jobs = 10,
}

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
  		config = require('core.plugin-config.lsp').config,
  	}

  	use { -- Auto completion
  		'hrsh7th/nvim-cmp',
  		requires = {
  			'L3MON4D3/LuaSnip',
				'rafamadriz/friendly-snippets',
  			'onsails/lspkind.nvim',
  			'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-nvim-lua',
				'hrsh7th/cmp-buffer',
  			'saadparwaiz1/cmp_luasnip',
				'hrsh7th/cmp-nvim-lsp-signature-help',
				'hrsh7th/cmp-nvim-lsp-document-symbol',
  		},
  		config = require('core.plugin-config.nvim-cmp').config,
  	}

  	use { -- DAP
  		'mfussenegger/nvim-dap',
  		requires = {
  			'williamboman/mason.nvim',
  			'jay-babu/mason-nvim-dap.nvim',
				'rcarriga/nvim-dap-ui',
				'theHamsta/nvim-dap-virtual-text',
				'nvim-telescope/telescope-dap.nvim',
  		},
  		config = require('core.plugin-config.dap').config,
  	}

		use { -- File explorer
			'nvim-tree/nvim-tree.lua',
			config = require('core.plugin-config.nvim-tree').config,
			after = 'nvim-web-devicons',
		}

  	use { -- Fuzzy finder
  		'nvim-telescope/telescope.nvim', tag = '0.1.1',
  		requires = {
				'nvim-lua/plenary.nvim',
				{
					'nvim-telescope/telescope-fzf-native.nvim',
					run = 'make',
				},
			},
  		config = require('core.plugin-config.telescope').config,
  	}

  	use { -- Code highlighting and navigation
  		'nvim-treesitter/nvim-treesitter',
  		run = function()
  			pcall(require('nvim-treesitter.install').update { with_sync = true })
  		end,
  		config = require('core.plugin-config.treesitter').config,
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
  		config = require('core.plugin-config.autopairs').config,
  	}

  	use { -- Auto close HTML tags
  		'windwp/nvim-ts-autotag',
  		opt = false,
  		after = 'nvim-treesitter',
  		config = require('core.plugin-config.autotag').config,
  	}

		use { -- Smart comments
			'numToStr/Comment.nvim',
			config = function ()
				require('Comment').setup {}
			end,
		}

  	use { -- Git
  		'tpope/vim-fugitive',
  		'tpope/vim-rhubarb',
  		'lewis6991/gitsigns.nvim',
  	}

  	use { -- VSCode theme
  		'Mofiqul/vscode.nvim',
  		config = require('core.plugin-config.vscode').config,
  	}

    use { -- Status line
    	'nvim-lualine/lualine.nvim',
    	after = 'vscode.nvim',
    	config = require('core.plugin-config.lualine').config,
    }

		use { -- Icons
			'nvim-tree/nvim-web-devicons',
			config = function ()
				require('nvim-web-devicons').setup {}
			end,
			after = 'vscode.nvim',
		}

  	use { -- Indentation guides
  		'lukas-reineke/indent-blankline.nvim',
  		config = require('core.plugin-config.indent-blankline').config,
  	}

		use { -- Startup screen
			'goolord/alpha-nvim',
			config = function ()
				require('alpha').setup(require('alpha.themes.dashboard').config)
			end,
			after = 'nvim-web-devicons',
		}

		use { -- Highlight color constants
			'norcalli/nvim-colorizer.lua',
			config = function ()
				require('colorizer').setup {}
			end,
			after = 'vscode.nvim',
		}

		if packer_bootstrap then
			require('packer').sync()
		end
	end,
}

if packer_bootstrap then
	print '╭─────────────────────────────────╮'
	print '│   Plugins are being installed   │'
	print '│   Wait until Packer completes   │'
	print '│        then restart nvim        │'
	print '╰─────────────────────────────────╯'
	return
end
