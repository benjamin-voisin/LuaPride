#!/bin/luajit

local rl = require("ffi/raylib")

local windowWidth = 800
local windowHeight = 450

local flags = {
	ace = {
		path = "./flags/ace.png",
	},
	aro = {
		path = "./flags/aro.png"
	},
	inclusive = {
		path = "./flags/inclusive.png"
	},
	pan = {
		path = "./flags/pansexual.png"
	}
}

local flags_list = {}


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

local i = 1
local k = 1
for key, _ in pairs(flags) do
	if key == flag then
		i = k
	end
	flags_list[#flags_list + 1] = key
	k = k + 1
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
	rl.DrawTexture(flags[flag].texture, 0, 0, rl.WHITE)
	rl.EndDrawing()
end

rl.CloseWindow()
