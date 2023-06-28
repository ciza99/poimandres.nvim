local utils = {}

local function byte(value, offset)
	return bit.band(bit.rshift(value, offset), 0xFF)
end

local function rgb(color)
	color = vim.api.nvim_get_color_by_name(color)

	if color == -1 then
		color = vim.opt.background:get() == "dark" and 000 or 255255255
	end

	return { byte(color, 16), byte(color, 8), byte(color, 0) }
end

local function parse_color(color)
	if color == nil then
		return print("invalid color")
	end

	color = color:lower()

	if not color:find("#") and color ~= "none" then
		color = require("poimandres.palette")[color] or vim.api.nvim_get_color_by_name(color)
	end

	return color
end

---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 (background) and 1 (foreground)
utils.blend = function(fg, bg, alpha)
	fg = rgb(parse_color(fg))
	bg = rgb(parse_color(bg))

	local function blend_channel(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02X%02X%02X", blend_channel(1), blend_channel(2), blend_channel(3))
end

return utils
