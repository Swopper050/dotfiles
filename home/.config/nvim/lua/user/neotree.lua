local ok, neotree = pcall(require, "neo-tree")
if not ok then
    vim.notify("neo-tree not found, make sure it is installed.")
    return
end

local function setup()
    neotree.setup({
        close_if_last_window = false,
    })
end

return {
    setup = setup,
}
