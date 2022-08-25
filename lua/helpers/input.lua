local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

---@class InputConfig
---@field title string
---@field default_value string
---@field on_close fun()
---@field on_submit fun(value: string)

---@param args InputConfig
local get_input = function(args)
	local title, default_value, on_close, on_submit =
		args.title or "",
		args.default_value or "",
		args.on_close or function() end,
		args.on_submit or function(value) end

	local input = Input({
		position = "50%",
		size = {
			width = "50%",
		},
		border = {
			style = "rounded",
			text = {
				top = title,
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal",
		},
	}, {
		prompt = "> ",
		default_value = default_value,
		on_close = on_close,
		on_submit = on_submit,
	})

	-- mount/open the component
	input:mount()

	-- unmount component when cursor leaves buffer
	input:on(event.BufLeave, function()
		input:unmount()
	end)
end

return get_input
