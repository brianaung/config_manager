return {
	"tpope/vim-surround",

	{
		"echasnovski/mini.indentscope",
		version = false,
		config = function()
			require("mini.indentscope").setup()
		end,
	},

	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup {
				progress = {
					display = {
						done_ttl = 10,
						skip_history = false,
					},
				},
			}
		end,
	},

	{
		-- "brianaung/yasl.nvim",
		dir = "~/projects/yasl.nvim",
		config = function()
			require("yasl").setup {
				components = {
					"mode",
					" ",
					"%<%t%h%m%r%w", -- filename
					" ",
					"branch",
					"%=",
					"diagnostics",
					" ",
					"filetype",
					" ",
					"[%-8.(%l, %c%V%) %P]", -- location, and progress
					" ",
				},
			}
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup {
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				-- current_line_blame = true,
			}
		end,
	},

	-- Everything below is lazy loaded
	{
		"echasnovski/mini.files",
		version = false,
		config = function()
			require("mini.files").setup {
				mappings = {
					close = "<esc>",
					go_in = "",
					go_in_plus = "<cr>",
					go_out = "",
					go_out_plus = "-",
					reset = "<BS>",
					reveal_cwd = "@",
					show_help = "g?",
					synchronize = "=",
					trim_left = "<",
					trim_right = ">",
				},
			}
		end,
		keys = { { "<leader>fe", "<cmd>lua MiniFiles.open()<cr>" } },
	},

	{
		"ThePrimeagen/harpoon",
		keys = {
			{ "<leader>a", "<cmd>lua require 'harpoon.mark'.add_file()<cr>" },
			{ "<leader>h", "<cmd>lua require 'harpoon.ui'.toggle_quick_menu()<cr>" },
			{ "<leader>1", "<cmd>lua require 'harpoon.ui'.nav_file(1)<cr>" },
			{ "<leader>2", "<cmd>lua require 'harpoon.ui'.nav_file(2)<cr>" },
			{ "<leader>3", "<cmd>lua require 'harpoon.ui'.nav_file(3)<cr>" },
			{ "<leader>4", "<cmd>lua require 'harpoon.ui'.nav_file(4)<cr>" },
		},
	},

	{
		"tpope/vim-fugitive",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"fugitive",
					"fugitiveblame",
				},
				command = [[
					nnoremap <buffer><silent> <esc> :bd<cr>
					setl bufhidden=wipe
				]],
			})
		end,
		cmd = { "G", "Git" },
		keys = { { "<leader>gs", "<cmd>G<cr>" } },
	},

	{
		"mbbill/undotree",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "undotree" },
				command = [[ nnoremap <buffer><silent> <esc> :UndotreeHide<cr> ]],
			})
		end,
		cmd = {
			"UndotreeToggle",
			"UndotreeShow",
		},
		keys = { { "<leader>u", "<cmd>UndotreeToggle | UndotreeFocus<cr>" } },
	},

	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
		},
		keys = {
			{ "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		},
	},
}
