--!strict

-->insert-corescript-warning<--

-- Color Utility --
-- Functions for color operations, such as:
-- rounding a color (for buttons, pushboxes, etc)
-- subtracting the value of a color (to make text strokes)

local util = {}

--[=[
	@within utility
	@tag shorthand

	Rounds the components of a Color3 to prevent any potential floating point issues.
	Mainly used by [Buttons](../docs/clientobjects/Buttons).
]=]
function util.roundColor(color: Color3): Color3
	return Color3.fromRGB(math.floor((color.R * 255) + 0.5), math.floor((color.G * 255) + 0.5), math.floor((color.B * 255) + 0.5))
end

--[=[
	@within utility
	@tag shorthand
	@param subtract number? -- default: 0.5

	Subtracts the value of a Color3 by the given `subtract` number. 
	Useful for text stroke colors.
]=]
function util.subtractHSV(color: Color3, subtract: number?): Color3
	local hue, saturation, value = color:ToHSV()
	return Color3.fromHSV(hue, saturation, math.clamp(value - (subtract or 0.5), 0, 1))
end

return util
