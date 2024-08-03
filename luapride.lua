#!/bin/luajit

local rl = require("ffi/raylib")
local colors = require("ffi/colors")

local windowWidth = 800
local windowHeight = 450



local flags = {
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
		flags[key].draw = function ()
			rl.DrawTexture(value.texture, 0, 0, rl.WHITE)
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

local function resize()
	windowWidth = rl.GetScreenWidth()
	windowHeight = rl.GetScreenHeight()
	rl.UnloadTexture(flags[flag].texture)
	rl.UnloadImage(flags[flag].image)
	flags[flag].image = rl.LoadImage(flags[flag].path)
	rl.ImageResize(flags[flag].image, windowWidth, windowHeight)
	flags[flag].texture = rl.LoadTextureFromImage(flags[flag].image)
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

while not rl.WindowShouldClose() do
	if rl.IsKeyPressed(79) then
		next()
		resize()
	end
	if rl.IsKeyPressed(46) then
		previous()
		resize()
	end
	rl.BeginDrawing()
	rl.ClearBackground(rl.RAYWHITE)
	if ((windowWidth ~= rl.GetScreenWidth()) or (windowHeight ~= rl.GetScreenHeight())) then
		resize()
	end
	flags[flag].draw(windowWidth, windowHeight)
	rl.EndDrawing()
end

rl.CloseWindow()
