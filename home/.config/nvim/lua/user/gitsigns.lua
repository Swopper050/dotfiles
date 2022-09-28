local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
    vim.notify("gitsigns not found, make sure it is installed.")
    return
end

local function setup()
    gitsigns.setup()
end

return {
    setup = setup,
}
