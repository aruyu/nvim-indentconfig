--[[
-   NOTE      - configs.lua
-   Author    - Aru
-
-   Created   - 2022.11.11
-   Github    - https://github.com/aruyu
-   Contact   - vine9151@gmail.com
]]


local M = {}

-- Default options.
local default_options = {
  -- The global indent settings here.
  -- This option would set all the filetypes.
  default = {
    expandtab = true,
    size = 2
  },

  -- The exclusion indent settings here.
  -- This option would necessary specific filetypes.
  exclusions = {
    {
      expandtab = false,
      size = 8,
      filetype = { 'make','c','cpp' }
    },

    {
      expandtab = true,
      size = 4,
      filetype = { 'verilog' }
    },
  },

  -- The filetype settings by filename here.
  -- This option would re-set specific filetype by specific filename.
  ft_preset = {
    { filename = '*.h', filetype = 'c' },
  },
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
