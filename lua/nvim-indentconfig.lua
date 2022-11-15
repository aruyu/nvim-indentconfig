--[[
-   NOTE      - nvim-indentconfig.lua
-   Author    - Ista
-
-   Created   - 2022.11.11
-   Github    - https://github.com/vine91
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
end

return M
