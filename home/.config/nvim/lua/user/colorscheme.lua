local ok, gruvbox = pcall(require, "gruvbox")
if not ok then
    vim.notify("gruvbox not found, make sure it is installed.")
    return
end

local function setup()
    gruvbox.setup({
        contrast = "soft",
        italic = {
            strings = false,
            emphasis = false,
            comments = false,
            operators = false,
            folds = false,
        },
    })

    vim.o.background = "dark" -- or "light" for light mode
    vim.cmd([[colorscheme gruvbox]])
end

return {
    setup = setup,
}
