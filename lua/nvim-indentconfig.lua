--[[
-   NOTE      - nvim-indentconfig.lua
-   Author    - Asta
-
-   Created   - 2022.11.11
-   Github    - https://github.com/astaos
-   Contact   - vine9151@gmail.com
]]



local configs = require("nvim-indentconfig.configs")
local utils = require("nvim-indentconfig.utils")
local M = {}


function M.setup(opt)
  configs.set_config(opt)

  utils.init_indent()
  utils.make_indent(configs.default.expandtab, configs.default.size, { '*' })

  for _, exclusions in ipairs(configs.exclusions) do
    utils.make_indent(exclusions.expandtab, exclusions.size, exclusions.filetype)
  end

  for _, ft_preset in ipairs(configs.ft_preset) do
    utils.make_filetype(ft_preset.filename, ft_preset.filetype)
  end
end

return M
