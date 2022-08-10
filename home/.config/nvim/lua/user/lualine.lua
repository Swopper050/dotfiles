local ok, lualine = pcall(require, "lualine")
if not ok then
	vim.notify("lualine not found, make sure it is installed.")
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
        theme = "gruvbox",
	tabline = {
                lualine_a = { "buffers" },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
        },
	extensions = {},
})
