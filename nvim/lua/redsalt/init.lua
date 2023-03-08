require("redsalt.set")
require("redsalt.remap")

local augroup = vim.api.nvim_create_augroup
local RedsaltGroup = augroup('RedsaltGroup', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', { -- flash highlight text on yank
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, { -- remove trailing whitespaces on write
    group = RedsaltGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

