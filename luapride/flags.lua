local rl = require("luapride/ffi/raylib")
local colors = require("luapride/ffi/colors")

local possible_paths = {
	"./flags/",
	"/lib/luarocks/rocks-5.1/"..NAME.."/"..VERSION.."-"..VERSION_REL.."/flags/",
	"/lib64/luarocks/rocks-5.1/"..NAME.."/"..VERSION.."-"..VERSION_REL.."-"..VERSION_REL.."/flags/",
}

--- Check if a file or directory exists in this path
local function exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok, err
end

local function get_path(file)
	for _, path_prefix in pairs(possible_paths) do
		if exists(path_prefix..file) then
			return path_prefix..file
		end
	end
	print(string.format("File %s has not been found. Here are the possible paths searched:", file))
	for _, path in possible_paths do
		print(path)
	end
	os.exit(1)
end

local function horizontal (width, height, stripes)
	local stripe_size = height / #stripes
	for i, color in pairs(stripes) do
		rl.DrawRectangle(0, ((i - 1) * stripe_size), width, stripe_size + 1, color)
	end
end

local function simple_draw (width, height, name)
	rl.DrawText(name, (width / 40), (height / 40), width / 10, rl.GRAY)
end

return {
	Asexual = {
		type = "raylib",
		draw = function (width, height)
			horizontal(width, height, {rl.BLACK, colors.ace_gray, rl.WHITE, colors.ace_purple})
		end,
		draw_text = function (width, height)
			simple_draw(width, height, "Asexual")
		end,
	},
	Aromantic = {
		type = "raylib",
		draw = function (width, height)
			horizontal(width, height, {colors.aro_green, colors.aro_pale_green, rl.WHITE, colors.aro_gray, rl.BLACK})
		end,
		draw_text = function (width, height)
			simple_draw(width, height, "Aromantic")
		end,
	},
	Inclusive = {
		type = "png",
		path = get_path("inclusive.png"),
		draw_text = function (width, height)
			simple_draw(width, height, "Inclusive")
		end,
	},
	Pansexual = {
		type = "raylib",
		draw = function (width, height)
			horizontal(width, height, {colors.pan_pink, colors.pan_yellow, colors.pan_cyan})
		end,
		draw_text = function (width, height)
			simple_draw(width, height, "Pansexual")
		end,
	},
	Bisexual = {
		type = "raylib",
		draw = function (width, height)
			rl.DrawRectangle(0,0, width, (2 * height) / 5 + 1, colors.bi_magenta)
			rl.DrawRectangle(0,(2 * height) / 5, width, (1 * height) / 5 + 1, colors.bi_purple)
			rl.DrawRectangle(0,(3 * height) / 5, width, (2 * height) / 5 + 1, colors.bi_blue)
		end,
		draw_text = function (width, height)
			simple_draw(width, height, "Bisexual")
		end,
	}
}
