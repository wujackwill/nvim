return {
    "github/copilot.vim",

    config = function()
        vim.g.copilot_no_tab_map = true
        vim.api.nvim_set_keymap("i", "<C-w>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
        vim.g.copilot_filetypes = {markdown = true}
    end

}
