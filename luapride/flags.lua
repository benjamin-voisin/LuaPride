local rl = require("luapride/ffi/raylib")
local colors = require("luapride/ffi/colors")

return {
	ace = {
		type = "raylib",
		draw = function (width, height)
			rl.DrawRectangle(0,0, width, height / 4 + 1, rl.BLACK)
			rl.DrawRectangle(0,(height * 1) / 4, width, height / 4 + 1, colors.ace_gray)
			rl.DrawRectangle(0,(height * 2) / 4, width, height / 4 + 1, rl.WHITE)
			rl.DrawRectangle(0,(height * 3) / 4, width, height / 4 + 1, colors.ace_purple)
		end
	},
	aro = {
		type = "raylib",
		draw = function (width, height)
			rl.DrawRectangle(0,0, width, height / 5 + 1, colors.aro_green)
			rl.DrawRectangle(0,height / 5, width, height / 5 + 1, colors.aro_pale_green)
			rl.DrawRectangle(0,(height * 2) / 5, width, height / 5 + 1, rl.WHITE)
			rl.DrawRectangle(0,(height * 3) / 5, width, height / 5 + 1, colors.aro_gray)
			rl.DrawRectangle(0,(height * 4) / 5, width, height / 5 + 1, rl.BLACK)
		end
	},
	inclusive = {
		type = "png",
		path = "./flags/inclusive.png"
	},
	pan = {
		type = "raylib",
		draw = function (width, height)
			rl.DrawRectangle(0,0, width, height / 3 + 1, colors.pan_pink)
			rl.DrawRectangle(0,(height * 1) / 3, width, height / 3 + 1, colors.pan_yellow)
			rl.DrawRectangle(0,(height * 2) / 3, width, height / 3 + 1, colors.pan_cyan)
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
