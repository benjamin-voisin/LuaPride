local ffi = require("ffi")

return {
	-- For the Bi flag
	bi_magenta = ffi.new("Color",  214, 2, 112, 255),   -- White
	bi_purple = ffi.new("Color",  155, 79, 150, 255),   -- White
	bi_blue = ffi.new("Color",  0, 56, 168, 255),   -- White
}
