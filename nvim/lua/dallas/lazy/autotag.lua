return {
    'windwp/nvim-ts-autotag',
    config = function()
        require('nvim-ts-autotag').setup({
            filetypes = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue", "tsx", "jsx", "rescript", "php" },
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = false
            },
        })
    end
}



-- return {
--     'windwp/nvim-ts-autotag',
--     config = function()
--         require('nvim-ts-autotag').setup({
--             opts = {
--                 enable_close = true, -- Auto close tags
--                 enable_rename = true, -- Auto rename pairs of tags
--                 enable_close_on_slash = false -- Auto close on trailing </
--             },
--         })
--     end
-- }
