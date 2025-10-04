local ok, null_ls = pcall(require, "null-ls")
if not ok then
	vim.notify("null_ls not found, make sure it is installed.")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local function setup()
	null_ls.setup({
		debug = false,
		sources = {
			formatting.stylua,
			formatting.prettier,
			formatting.goimports,
			formatting.gofumpt,
                        require("none-ls.formatting.eslint_d"),
                        require("none-ls.diagnostics.eslint_d"),
                        require("none-ls.formatting.ruff"),
                        require("none-ls.formatting.ruff_format"),
                        require("none-ls.diagnostics.ruff"),
			diagnostics.stylelint,
			diagnostics.golangci_lint.with({
				args = {
					"run",
					"--fix=false",
					"--fast",
					"--out-format=json",
					"$DIRNAME",
					"--path-prefix",
					"$ROOT",
				},
			}),
		},
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
	                vim.api.nvim_create_autocmd("BufWritePre", {
	                	group = group,
	                	buffer = bufnr,
	                	callback = function()
	                		vim.lsp.buf.format({
	                			bufnr = bufnr,
	                			filter = function(format_client)
	                				-- only use none-ls for formatting
	                				return format_client.name == "null-ls" or format_client.name == "none-ls"
	                			end,
	                		})
	                	end,
	                })
                    end

                    -- Add code action (for ruff fixes) on save for Python files
                    if vim.bo[bufnr].filetype == "python" then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = group,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.code_action({
                                    context = { only = { "source.fixAll.ruff" } },
                                    apply = true,
                                })
                            end,
                        })
		    end
                end,
	})
end

return {
	setup = setup,
}
