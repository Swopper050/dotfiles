--protected call to find colorscheme and notify with error if the scheme
--is not installed.
local ok, gruvbox = pcall(require, "gruvbox")
if not ok then
	vim.notify("gruvbox not found!")
	return
end

gruvbox.setup({
    italic = false,
})
