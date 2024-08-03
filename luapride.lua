#!/bin/luajit

local rl = require("ffi/raylib")


local windowWidth = 800
local windowHeight = 450

rl.InitWindow(windowWidth, windowHeight, "LuaPride")
rl.SetTargetFPS(60)

local flag_image = rl.LoadImage("./flags/inclusive.png")

rl.ImageResize(flag_image, windowWidth, windowHeight)

local flag = rl.LoadTextureFromImage(flag_image)

while not rl.WindowShouldClose() do
	rl.BeginDrawing()
	rl.ClearBackground(rl.RAYWHITE)
	rl.DrawTexture(flag, 0, 0, rl.WHITE)
	rl.EndDrawing()
end

rl.CloseWindow()
