--[[
-   NOTE      - utils.lua
-   Author    - Ista
-
-   Created   - 2022.11.11
-   Github    - https://github.com/vine91
-   Contact   - vine9151@gmail.com
]]



local M = {}
local api = vim.api

local autoindents_group = api.nvim_create_augroup('AutoindentsGroup', { clear = true })

function M.init_indent()
  vim.cmd(
    'filetype plugin indent off'
  )
end

function M.make_indent(expandtab, size, filetype)
  if expandtab then
    api.nvim_create_autocmd(
      'FileType',
      {
        pattern = filetype,
        command = 'lua require("nvim-indentconfig.utils").use_expandtab(' .. size .. ')',
        group = autoindents_group,
      }
    )

  else
    api.nvim_create_autocmd(
      'FileType',
      {
        pattern = filetype,
        command = 'lua require("nvim-indentconfig.utils").use_noexpandtab(' .. size .. ')',
        group = autoindents_group,
      }
    )
  end
end


function M.use_expandtab(size)
  vim.opt.tabstop = size
  vim.opt.shiftwidth = size
  vim.opt.softtabstop = size
  vim.opt.expandtab = true
end

function M.use_noexpandtab(size)
  vim.opt.tabstop = size
  vim.opt.shiftwidth = size
  vim.opt.softtabstop = 0
  vim.opt.expandtab = false
end

return M
