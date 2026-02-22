local conform = require("conform")

conform.setup({
	-- A list of formatters available to conform.
	-- This is not required, but it's recommended
	formatters = {
		ruff_fix = {
			command = "ruff",
			args = { "check", "--select", "I", "--fix", "-" },
			stdin = true,
		},
	},

	-- Map filetypes to formatters
	formatters_by_ft = {
		lua = { "stylua" },

		-- Python: Fix imports and then format
		python = { "ruff_fix", "ruff_format" },

		-- Go: goimports handles both formatting and imports
		go = { "goimports" },

		-- Web (prettier is king)
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },

		-- Infrastructure & DevOps
		terraform = { "terraform" },
		dockerfile = { "prettier" }, -- hadolint is also a great linter

		-- Shell
		sh = { "shfmt" },
		bash = { "shfmt" },

		-- SQL
		sql = { "sql-formatter" },

		-- TOML
		toml = { "taplo" },
	},

	-- Configure format on save
	format_on_save = function(bufnr)
		-- A table of filetypes to disable formatting for
		-- You might do this if you have a conflicting LSP formatter, for example
		local disabled_fts = {
			-- typescript = true,
			-- typescriptreact = true,
		}

		if disabled_fts[vim.bo[bufnr].filetype] then
			return
		end

		return {
			timeout_ms = 500,
			lsp_fallback = true, -- Fallback to LSP formatting if conform isn't configured
		}
	end,

	-- Notify on formatting errors
	notify_on_error = true,
})

-- Key mappings for manual formatting
vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format({
		lsp_fallback = true,
		async = false, -- Or true if you prefer
		timeout_ms = 1000, -- Give it a bit more time for larger files
	})
end, { desc = "Format file or range (conform)" })
