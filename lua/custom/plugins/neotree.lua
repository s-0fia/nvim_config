-- File: lua/custom/plugins/neotree.lua

return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({})

        -- If no file is opened then open Neotree
        if vim.fn.expand("%") == "" then
            vim.cmd("Neotree")
        end
    end,
}
