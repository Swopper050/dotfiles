local ok, copilot = pcall(require, "copilot")
if not ok then
    vim.notify("copilot not found, make sure it is installed.")
    return
end

local function setup()
    copilot.setup({
        suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 75,
            keymap = {
                accept = "<M-n>",
                accept_word = false,
                accept_line = false,
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
            },
        },
    })
end

return {
    setup = setup,
}
