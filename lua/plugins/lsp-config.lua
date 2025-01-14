return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "ts_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local config = require("lspconfig")
      -- Setup lua_ls (Lua language server)
      config.lua_ls.setup({})
      config.ts_ls.setup({})
      config.clangd.setup({})
      -- Keybindings using vim.keymap.set
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
    end,
  },
}
