return {
  {
    "stevearc/conform.nvim", -- Replace with the correct plugin name if different
    event = {"BufReadPre","BufNewFile"},
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "isort", "black" },
          javascript = { "prettierd", "prettier"},
          typescript = { "prettierd", "prettier"},
          javascriptreact = { "prettierd","prettier"},
          typescriptreact = { "prettierd","prettier"},
          html = { "prettierd", "prettier"},
          css = { "prettierd", "prettier"},
          json = { "prettierd", "prettier"},
          yaml = { "prettierd", "prettier"},
          markdown = { "prettierd", "prettier"},
          go = { "gofmt"},
          lua = { "stylelua"},
          python = { "isort","black"},
        },
	 format_on_save = {
	    timeout_ms = 500,
	    lsp_format = "fallback",
	  },
      })
    end,
  },
}

