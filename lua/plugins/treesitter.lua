return {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
          ensure_installed = { "php", "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "css", "typescript", "tsx", "go", "json","svelte"},
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
          auto_install = true,
        })


    end
}

