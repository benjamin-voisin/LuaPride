# LuaPride

A very simple application that displays flags in a nice window

## Requirements

This uses [LuaJIT](https://luajit.org/) and [raylib](https://www.raylib.com/) to work.

## Usage

If you have the depenedncies on your system, you can simply
```
luajit luapride/init.lua
```
Or even just
```
./luapride/init.lua
```
to launch it.

By default, it launches with the LGBT-inclusive flag, but you can choose with
```
luajit luapride/init.lua {flag_name}
```

You can then navigate between the flags with H and J (vim goes brrrr).

To list the available flags, do:
```
luajit luapride/init.lua list
```
