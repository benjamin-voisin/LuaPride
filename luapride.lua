#!/bin/luajit

local rl = require("ffi/raylib")

local screenWidth = 800
local screenHeight = 450

rl.InitWindow(screenWidth, screenHeight, "LuaPride")
rl.SetTargetFPS(60)

local flag_image = rl.LoadImage("./flags/inclusive.png")

rl.ImageResize(flag_image, screenWidth, screenHeight)

local flag = rl.LoadTextureFromImage(flag_image)

while not rl.WindowShouldClose() do
	rl.BeginDrawing()
	rl.ClearBackground(rl.RAYWHITE)
	rl.DrawTexture(flag, 0, 0, rl.WHITE)
	rl.EndDrawing()
end

rl.CloseWindow()
