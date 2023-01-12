--[[
-   NOTE      - configs.lua
-   Author    - Asta
-
-   Created   - 2022.11.11
-   Github    - https://github.com/astaos
-   Contact   - vine9151@gmail.com
]]


local M = {}

local default_options = {
  default = {
    expandtab = true,
    size = 2,
  },

  exclusions = {
    {
      expandtab = false,
      size = 8,
      filetype = {
        'make',
        'c',
        'cpp',
      }
    },

    {
      expandtab = true,
      size = 4,
      filetype = {
        'verilog',
      }
    },
  }
}

M.values = vim.deepcopy(default_options)

function M.set_config(user_options)
  M.values = vim.tbl_extend('force', default_options, user_options or {})
end

-- This metatable allows for easier access to the config values. Instead of
-- writing `config.values.key` you can just write `config.key`.
return setmetatable(M, {
  __index = function(t, key)
    if key == "set_config" then
      return t.set_config
    else
      return t.values[key]
    end
  end,
})
