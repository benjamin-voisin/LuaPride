local ffi = require("ffi")

return {
	-- For the Bi flag
	bi_magenta = ffi.new("Color",  214, 2, 112, 255),
	bi_purple = ffi.new("Color",  155, 79, 150, 255),
	bi_blue = ffi.new("Color",  0, 56, 168, 255),

	-- For the Aro flag
	aro_green = ffi.new("Color",  61, 165, 66, 255),
	aro_pale_green = ffi.new("Color",  167, 211, 121, 255),
	aro_gray = ffi.new("Color",  169, 169, 169, 255),

	-- For the Ace flag
	ace_gray = ffi.new("Color",  163, 163, 163, 255),
	ace_purple = ffi.new("Color",  128, 0, 128, 255),

	-- For the Pan flag
	pan_pink = ffi.new("Color",  255, 33, 140, 255),
	pan_yellow = ffi.new("Color",  255, 216, 0, 255),
	pan_cyan = ffi.new("Color",  22, 177, 255, 255),
}
