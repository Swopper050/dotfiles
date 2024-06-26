local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
	vim.notify("cmp not found, make sure it is installed.")
	return
end

local luasnip_ok, luasnip = pcall(require, "luasnip")
if not luasnip_ok then
	vim.notify("luasnip not found, make sure it is installed.")
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local function tab_next(fallback)
	if cmp.visible() then
		cmp.select_next_item()
	elseif luasnip.expandable() then
		luasnip.expand()
	elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	else
		fallback()
	end
end

local function tab_prev(fallback)
	if cmp.visible() then
		cmp.select_prev_item()
	elseif luasnip.jumpable(-1) then
		luasnip.jump(-1)
	else
		fallback()
	end
end

local function expand(args)
	luasnip.lsp_expand(args.body)
end

local function format(entry, vim_item)
        vim_item.abbr = string.sub(vim_item.abbr, 1, 50)
	vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
	vim_item.menu = ({
		nvim_lsp = "[Lsp]",
		buffer = "[Buffer]",
		path = "[Path]",
                codeium = "[Codeium]",
	})[entry.source.name]

	return vim_item
end

local function setup()
	cmp.setup({
		snippet = {
			expand = expand,
		},
		mapping = {
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-y>"] = cmp.config.disable,
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(tab_next, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(tab_prev, { "i", "s" }),
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = require('lspkind').cmp_format({
                            mode = "symbol",
                            maxwidth = 50,
                            ellipsis_char = '...',
                            symbol_map = {
                                Codeium = "[Codium]",
                                nvim_lsp = "[Lsp]",
                                buffer = "[Buffer]",
                                path = "[Path]",
                            },
                        }),
		},
		sources = {
			{ name = "nvim_lsp" },
                        { name = "codeium" },
			{ name = "path" },
			{ name = "buffer" },
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
                experimental = {
                    ghost_text = false,
                },
	})
end

return {
	setup = setup,
}
