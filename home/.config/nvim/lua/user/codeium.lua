local ok, codeium = pcall(require, "codeium")
if not ok then
    vim.notify("codeium not found, make sure it is installed.")
    return
end

local function setup()
    codeium.setup({
        enable_chat = false,
    })
end

return {
    setup = setup,
}
