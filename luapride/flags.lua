local rl = require("luapride/ffi/raylib")
local colors = require("luapride/ffi/colors")

return {
	ace = {
		type = "png",
		path = "./flags/ace.png",
	},
	aro = {
		type = "png",
		path = "./flags/aro.png"
	},
	inclusive = {
		type = "png",
		path = "./flags/inclusive.png"
	},
	pan = {
		type = "png",
		path = "./flags/pansexual.png"
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
