local rl = require("luapride/ffi/raylib")
local colors = require("luapride/ffi/colors")

local function horizontal (width, height, stripes)
	local stripe_size = height / #stripes
	for i, color in pairs(stripes) do
		rl.DrawRectangle(0, ((i - 1) * stripe_size), width, stripe_size + 1, color)
	end
end

return {
	ace = {
		type = "raylib",
		draw = function (width, height)
			horizontal(width, height, {rl.BLACK, colors.ace_gray, rl.WHITE, colors.ace_purple})
		end
	},
	aro = {
		type = "raylib",
		draw = function (width, height)
			horizontal(width, height, {colors.aro_green, colors.aro_pale_green, rl.WHITE, colors.aro_gray, rl.BLACK})
		end
	},
	inclusive = {
		type = "png",
		path = "./flags/inclusive.png"
	},
	pan = {
		type = "raylib",
		draw = function (width, height)
			horizontal(width, height, {colors.pan_pink, colors.pan_yellow, colors.pan_cyan})
		end
	},
	bi = {
		type = "raylib",
		draw = function (width, height)
			rl.DrawRectangle(0,0, width, (2 * height) / 5 + 1, colors.bi_magenta)
			rl.DrawRectangle(0,(2 * height) / 5, width, (1 * height) / 5 + 1, colors.bi_purple)
			rl.DrawRectangle(0,(3 * height) / 5, width, (2 * height) / 5 + 1, colors.bi_blue)
		end
	}
}
