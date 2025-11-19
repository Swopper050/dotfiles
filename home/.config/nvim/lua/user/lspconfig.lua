local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok_cmp then
  vim.notify("cmp_nvim_lsp not found, make sure it is installed.")
  return
end

local ok_lspconfig, _ = pcall(require, "lspconfig")
if not ok_lspconfig then
  vim.notify("nvim-lsp-config not found, make sure it is installed.")
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

vim.g.python3_host_prog = "$HOME" .. "/.pyenv/versions/nvim/bin/python3"

local config = {
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
                width = 200,
	},

	diagnostic = {
		virtual_text = false,
		signs = {
			active = true,
		},
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	},
}

local function highlight_document(client, bufnr)
        if not client.server_capabilities or not client.server_capabilities.documentHighlightProvider then
          return
        end

        local group = vim.api.nvim_create_augroup("lsp_document_highlight_" .. bufnr, { clear = true })

        vim.api.nvim_create_autocmd("CursorHold", {
          group = group,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.document_highlight()
          end,
        })

        vim.api.nvim_create_autocmd("CursorMoved", {
          group = group,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.clear_references()
          end,
        })
end

local function format_on_save(bufnr)
        local group = vim.api.nvim_create_augroup("auto_format_" .. bufnr, { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = group,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ timeout_ms = 2000 })
          end,
        })
end

local function setup_signs() 
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end
end

local function setup()
	vim.diagnostic.config(config.diagnostic)
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, config.float)
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, config.float)

        setup_signs()

        vim.lsp.config("*", {
            capabilities = capabilities,
        })

        vim.lsp.config("gopls", {
          on_attach = function(client, bufnr)
            -- Disable formatting (null-ls / conform.nvim / etc handle it)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false

            format_on_save(bufnr)   -- gofumpt on save
            highlight_document(client, bufnr)
          end,
        })

        vim.lsp.config("pyright", {
          on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false

            format_on_save(bufnr)
            highlight_document(client, bufnr)
          end,
        })

        vim.lsp.config("ruff", {
          -- only custom capabilities so far; reuse global capabilities from "*"
          on_attach = function(client, bufnr)
            highlight_document(client, bufnr)
          end,
        })

        vim.lsp.config("ts_ls", {
          on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false

            highlight_document(client, bufnr)
          end,
        })

        vim.lsp.enable({ "gopls", "pyright", "ruff", "ts_ls" })
end

return {
	setup = setup,
}
