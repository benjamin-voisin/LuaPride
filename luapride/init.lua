VERSION = "0.1.0"
VERSION_REL = "1"
NAME = "luapride"

local rl = require("luapride/ffi/raylib")

local flags = require("luapride/flags")

local windowWidth = 800
local windowHeight = 450


local function list_available_flags()
	print("Available flags:")
	for key, value in pairs(flags) do
		print(string.format("\t%s", key))
	end
end

if arg[1] == "list" then
	list_available_flags()
	os.exit(0)
end

local flag = arg[1] or "inclusive"

local flags_list = {}

local i = 1
local k = 1
for key, value in pairs(flags) do
	if key == flag then
		i = k
	end
	flags_list[#flags_list + 1] = key
	k = k + 1
	if value.type == "png" then
		value.draw = function ()
			rl.DrawTexture(value.texture, 0, 0, rl.WHITE)
		end
		value.resize = function ()
			windowWidth = rl.GetScreenWidth()
			windowHeight = rl.GetScreenHeight()
			rl.UnloadTexture(value.texture)
			rl.UnloadImage(value.image)
			value.image = rl.LoadImage(value.path)
			rl.ImageResize(value.image, windowWidth, windowHeight)
			value.texture = rl.LoadTextureFromImage(value.image)
		end
	else
		value.resize = function()
			windowWidth = rl.GetScreenWidth()
			windowHeight = rl.GetScreenHeight()
		end
	end
end

local function next()
	i = (i % #flags_list) + 1
	flag = flags_list[i]
end

local function previous()
	i = ((i - 2) % #flags_list) + 1
	flag = flags_list[i]
end

rl.InitWindow(windowWidth, windowHeight, "LuaPride")
rl.SetTargetFPS(24)
-- Load images
for key, value in pairs(flags) do
	flags[key].image = rl.LoadImage(value.path)
	rl.ImageResize(flags[key].image, windowWidth, windowHeight)
	flags[key].texture = rl.LoadTextureFromImage(flags[key].image)
end

if not flags[flag] then
	rl.CloseWindow()
	print("Flag provided doesn't exists...")
	list_available_flags()
	os.exit(1)
end

local display_name = true

while not rl.WindowShouldClose() do
	if rl.IsKeyPressed(79) then
		next()
		flags[flag].resize()
	end
	if rl.IsKeyPressed(46) then
		previous()
		flags[flag].resize()
	end
	if rl.IsKeyPressed(74) then
		display_name = not display_name
	end
	rl.BeginDrawing()
	rl.ClearBackground(rl.RAYWHITE)
	if ((windowWidth ~= rl.GetScreenWidth()) or (windowHeight ~= rl.GetScreenHeight())) then
		flags[flag].resize()
	end
	flags[flag].draw(windowWidth, windowHeight)
	if display_name then
		flags[flag].draw_text(windowWidth, windowHeight)
	end
	rl.EndDrawing()
end

rl.CloseWindow()
