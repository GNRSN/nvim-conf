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

-- REVIEW: Wtf is all this for?

-- delay notifications till vim.notify was replaced or after 500ms
local function lazy_notify()
  local notifs = {}
  local function temp(...)
    table.insert(notifs, vim.F.pack_len(...))
  end

  local orig = vim.notify
  vim.notify = temp

  local timer = vim.loop.new_timer()
  local check = vim.loop.new_check()

  local replay = function()
    timer:stop()
    check:stop()
    if vim.notify == temp then
      vim.notify = orig -- put back the original notify if needed
    end
    vim.schedule(function()
      ---@diagnostic disable-next-line: no-unknown
      for _, notif in ipairs(notifs) do
        vim.notify(vim.F.unpack_len(notif))
      end
    end)
  end

  -- wait till vim.notify has been replaced
  check:start(function()
    if vim.notify ~= temp then
      replay()
    end
  end)
  -- or if it took more than 500ms, then something went wrong
  timer:start(500, 0, replay)
end

return {
	init = function()
		-- delay notifications till vim.notify was replaced or after 500ms
		lazy_notify()

		-- load options here, before lazy init while sourcing plugin modules
		-- this is needed to make sure options will be correctly applied
		-- after installing missing plugins
		load("options")
	end,
	setup = function(opts)
		load("autocmds")
		load("keymaps")
	end,
}
