#!/bin/luajit

local rl = require("ffi/raylib")

local windowWidth = 800
local windowHeight = 450

rl.InitWindow(windowWidth, windowHeight, "LuaPride")
rl.SetTargetFPS(60)

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

-- Load images
for key, value in pairs(flags) do
	flags[key].image = rl.LoadImage(value.path)
	rl.ImageResize(flags[key].image, windowWidth, windowHeight)
	flags[key].texture = rl.LoadTextureFromImage(flags[key].image)
end

while not rl.WindowShouldClose() do
	rl.BeginDrawing()
	rl.ClearBackground(rl.RAYWHITE)
	if not flags[flag] then
		rl.CloseWindow()
		print("Flag provided doesn't exists...")
		list_available_flags()
		os.exit(1)
	end
	rl.DrawTexture(flags[flag].texture, 0, 0, rl.WHITE)
	rl.EndDrawing()
end

rl.CloseWindow()
