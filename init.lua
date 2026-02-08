local vim = vim
local Plug = vim.fn["plug#"]
vim.call("plug#begin")

Plug("nvim-lua/plenary.nvim")
Plug("ThePrimeagen/harpoon")
Plug("nvim-telescope/telescope.nvim", { ["version"] = "*" })
Plug("nvim-treesitter/nvim-treesitter", { ["build"] = ":TSUpdate" })

---R
Plug("R-nvim/R.nvim")

---lspconfig
Plug("neovim/nvim-lspconfig")
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")
Plug("j-hui/fidget.nvim")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
Plug("L3MON4D3/LuaSnip", { ["tag"] = "v2.4.1", ["do"] = "make install_jsregexp" })
Plug("saadparwaiz1/cmp_luasnip")
Plug("rafamadriz/friendly-snippets")
--auto-format
Plug("stevearc/conform.nvim")

---latex
Plug("lervag/vimtex")

---prettify
Plug("nvim-lualine/lualine.nvim")
Plug("lukas-reineke/indent-blankline.nvim")

---useful plugins
Plug("numToStr/Comment.nvim")
Plug("tpope/vim-fugitive")
Plug("mbbill/undotree")
Plug("https://codeberg.org/andyg/leap.nvim")
Plug("tpope/vim-repeat")
Plug("windwp/nvim-autopairs")

---obsidian/markdown
Plug("iamcco/markdown-preview.nvim", { ["do"] = "cd app && npx --yes yarn install" })
Plug("epwalsh/obsidian.nvim")
Plug("img-paste-devs/img-paste.vim")

---cication in vim
Plug("Shougo/unite.vim")
Plug("rafaqz/citation.vim")

---theme
Plug("blazkowolf/gruber-darker.nvim")
vim.call("plug#end")

vim.cmd("colorscheme gruber-darker")
--- basic settings
vim.cmd([[let g:netrw_banner = 0]])
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "C:\\Users\\wujac\\.nvim\\undo"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.api.nvim_set_keymap("n", "<Space>", "", {})
vim.g.mapleader = " "

-- from the primeagen
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--lualine
require("lualine").setup({
	options = {
		theme = "auto",
		component_separators = "|",
		section_separators = "",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "filename" },
		lualine_c = {},
		lualine_x = { "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

---harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader><Tab>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>q", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<leader>w", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<leader>e", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<leader>r", function()
	ui.nav_file(4)
end)

---telescope
require("telescope").setup({})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope help tags" })

---treesitter
require("nvim-treesitter").install({ "rust", "c", "python", "lua", "r", "markdown", "yaml", "vim" })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "py", "r", "rs", "c", "go" },
	callback = function()
		vim.treesitter.start()
	end,
})

---undotree
vim.keymap.set("n", "<F6>", vim.cmd.UndotreeToggle)

---git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

---leap
vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
vim.keymap.set("n", "S", "<Plug>(leap-from-window)")

---comment
require("Comment").setup()

---indent-blankline
require("ibl").setup()

---R.nvim
vim.keymap.set("n", "<leader>rf", "<PLug>Rstart<CR>", { desc = "R stop terminal" })
vim.keymap.set("n", "<Enter>", "<Plug>RDSendLine<CR>", { desc = "R stop terminal" })
require("r").setup({
	R_app = "radian", -- 指定使用radian作为R终端
	R_args = {}, -- 额外的启动参数
	bracketed_paste = true, -- 启用括号粘贴模式
	silent_term = true,
	auto_start = "on startup",
	close_term = true,
	register_treesitter = false,
})

---obsidian
require("obsidian").setup({
	preferred_link_style = "markdown",
	workspaces = {
		{
			name = "note",
			path = "D:\\learning\\note",
		},
	},
	-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
	completion = {
		-- Set to false to disable completion.
		nvim_cmp = true,
		-- Trigger completion at 2 chars.
		min_chars = 2,
	},
})

vim.keymap.set("n", "<C-f>", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Search cheese by file name" })
vim.keymap.set("n", "<C-j>", "<cmd>ObsidianSearch<CR>", { desc = "Search cheese by content" })
vim.keymap.set("n", "<leader>n", "<cmd>ObsidianNew<CR>", { desc = "Cheese to create a new note" })
vim.keymap.set("n", "<C-t>", "o<CR><Esc><cmd>ObsidianTemplate main.md<CR>", { desc = "Using templates" })
vim.keymap.set("n", "<leader>cl", "<cmd>ObsidianLinkNew<cr>", { desc = "create link" })

--- image in markdown
vim.cmd([[

let g:mdip_imgdir = 'pic' 
let g:mdip_imgname = 'image'
autocmd FileType markdown nnoremap <silent> <C-p> :call mdip#MarkdownClipboardImage()<CR>F%i
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }
]])

vim.keymap.set("n", "<F2>", "<Plug>MarkdownPreview<CR>")

---latex
vim.cmd([[
    " This is necessary for VimTeX to load properly. The "indent" is optional.
    " Note: Most plugin managers will do this automatically!
    filetype plugin indent on
    let g:tex_flavor='xelatex'
    " This enables Vim's and neovim's syntax-related features. Without this, some
    " VimTeX features will not work (see ":help vimtex-requirements" for more
    " info).
    " Note: Most plugin managers will do this automatically!
    syntax enable
    
    " Viewer options: One may configure the viewer either by specifying a built-in
    " viewer method:
    let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
    
    " VimTeX uses latexmk as the default compiler backend. If you use it, which is
    " strongly recommended, you probably don't need to configure anything. If you
    " want another compiler backend, you can change it as follows. The list of
    " supported backends and further explanation is provided in the documentation,
    " see ":help vimtex-compiler".
    let g:vimtex_compiler_method = 'latexmk'
    
    set conceallevel=1
    let g:tex_conceal='abdmg'
    
]])

---citation
vim.cmd([[
    let g:citation_vim_bibtex_file="C:\\Users\\wujac\\Documents\\my.bib"
    let g:citation_vim_mode="bibtex"
    " let g:citation_vim_mode="zotero" 
    " let g:citation_vim_zotero_path="D:\\learning\\Zotero\\data" 
    " let g:citation_vim_zotero_version=6 
    function! ClearCitationCacheSimple()
        let cache_path = g:citation_vim_cache_path
        
        if !isdirectory(cache_path)
            echoerr "缓存目录不存在: " . cache_path
            return
        endif
        
        " 删除目录下的所有文件（保留目录本身）
        let delete_cmd = 'cmd /c del /q "' . cache_path . '\*.*" 2>nul'
        let result = system(delete_cmd)
        
        if v:shell_error == 0
            echo "已清除Citation缓存"
        endif
    endfunction
    nmap <leader>u :call ClearCitationCacheSimple()<CR> [unite]
    nnoremap [unite] <nop>
    nnoremap <silent>[unite]c       :<C-u>Unite -buffer-name=citation-start-insert -default-action=append      citation/key<cr>
    let g:citation_vim_cache_path='C:\\Users\\wujac\\cache_path'
    
]])

---pandoc
vim.api.nvim_set_keymap(
	"n",
	"<leader>ph",
	[[:!pandoc --css=styling.css -V highlighting-css= --katex --citeproc -s % --bibliography=C:\\Users\\wujac\\Documents\\my.bib -o %:r.html<CR>]],
	{ noremap = true, silent = false }
)

---format code
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		bib = { "bibtex-tidy" },
	},
	format_on_save = {
		timeout_ms = 2000,
		lsp_format = "fallback",
	},
})

--auto-pairs
require("nvim-autopairs").setup({})

---cmp
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup({})

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.scroll_docs(-4),
		["<C-n>"] = cmp.mapping.scroll_docs(4),
		["<tab-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" },
	}),
})
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

--lsp
local on_attach = function(_, bufnr)
	-- 快捷键映射
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
	end

	map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
	map("n", "gd", vim.lsp.buf.definition, "Go to definition")
	map("n", "gr", vim.lsp.buf.references, "Go to references")

	map("n", "K", vim.lsp.buf.hover, "Hover documentation")
	map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	map("n", "<leader>ca", vim.lsp.buf.code_action, "Code actions")
	map("n", "<leader>vd", vim.diagnostic.open_float, "[V]iew [D]iagnostics")

	map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
	map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- 应用到所有服务器
vim.lsp.config("*", { on_attach = on_attach })
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "rust_analyzer", "pyright" },
})
vim.diagnostic.config({ virtual_text = true })

---undotree doesn't work
if vim.fn.has("win32") == 1 then
	vim.g.undotree_DiffCommand = "C:\\Users\\wujac\\diff.exe"
end

--- nice fidget
require("fidget").setup({})
