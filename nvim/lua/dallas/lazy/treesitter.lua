return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').install({
            'lua',
            'vim',
            'vimdoc',
            'markdown',
            'javascript',
            'typescript',
            'tsx',
            'c',
            'cpp',
            'go',
            'rust',
            'python',
            'json',
            'html',
            'css',
            'sql'
        })
        vim.api.nvim_create_autocmd('FileType', {
            pattern = {
                'lua',
                'vim',
                'vimdoc',
                'markdown',
                'javascript',
                'typescript',
                'tsx',
                'c',
                'cpp',
                'go',
                'rust',
                'python',
                'json',
                'html',
                'css',
                'sql'
            },
            callback = function()
                vim.treesitter.start()
            end
        })
    end
}
