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
	rl.DrawTexture(flags[flag].texture, 0, 0, rl.WHITE)
	rl.EndDrawing()
end

rl.CloseWindow()
