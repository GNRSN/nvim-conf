local function load(name)
  local Util = require("lazy.core.util")
  local function _load(mod)
    Util.try(function()
      require(mod)
    end, {
      msg = "Failed loading " .. mod,
      on_error = function(msg)
        local modpath = require("lazy.core.cache").find(mod)
        if modpath then
          Util.error(msg)
        end
      end,
    })
  end

  _load("config." .. name)
end

return {
  init = function()
    -- delay notifications till vim.notify was replaced or after 500ms
    -- lazy_notify()

    -- load options here, before lazy init while sourcing plugin modules
    -- this is needed to make sure options will be correctly applied
    -- after installing missing plugins
    load("options")
  end,
  setup = function()
    load("autocmds")
    load("keymaps")
  end,
}
