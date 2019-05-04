E2Lib.RegisterExtension( "cfc_e2_lib", true )

Skip to content
 
Search or jump to…

Pull requests
Issues
Marketplace
Explore
 
@TechnichalDoge 
62
340 276 wiremod/wire
 Code  Issues 104  Pull requests 17  Projects 1  Wiki  Insights
wire/lua/entities/gmod_wire_expression2/core/number.lua
@AbigailBuccaneer AbigailBuccaneer Remove some dead code around operator$
14f5991 on Apr 15, 2018
@TomyLobo @Nebual @Divran @AbigailBuccaneer @CaptainPRICE @Xandaros @haavard @ArcticFqx @syranide
681 lines (548 sloc)  17.3 KB
  
-- these upvalues (locals in an enclosing scope) are faster to access than globals.
local delta  = wire_expression2_delta

local math   = math
local random = math.random
local pi     = math.pi
local inf    = math.huge

local exp    = math.exp
local frexp  = math.frexp
local log    = math.log
local log10  = math.log10
local sqrt   = math.sqrt
local abs    = math.abs

local floor  = math.floor
local ceil   = math.ceil
local Round  = math.Round

local sin    = math.sin
local cos    = math.cos
local tan    = math.tan

local acos   = math.acos
local asin   = math.asin
local atan   = math.atan
local atan2  = math.atan2

local sinh   = math.sinh
local cosh   = math.cosh
local tanh   = math.tanh

__e2setcost(1)

registerOperator("exp", "xv2xv2", "xv2", function(self, args)
	local op1, op2 = args[2], args[3]
	return {
		op1[1](self, op1) ^ op2[1](self, op2),
		op1[2](self, op1) ^ op2[2](self, op2),
	}
end)


__e2setcost(2) -- approximation

--- Returns true (1) if given value is a finite number; otherwise false (0).
e2function vector2 isfinite(vector2)
	return {
		(vector2[1] > -inf and vector2[1] < inf) and 1 or 0,
		(vector2[2] > -inf and vector2[2] < inf) and 1 or 0
	}
end

--- Returns 1 if given value is a positive infinity or -1 if given value is a negative infinity; otherwise 0.
e2function vector2 isinf(vector2)
	local function numIsInf(number) 
		if number == inf then return 1 elseif number == -inf then return -1 end
		return 0 
	end
	return {
		numIsInf(vector2[1]),
		numIsInf(vector2[2])
	}
end

--- Returns true (1) if given value is not a number (NaN); otherwise false (0).
e2function vector2 isnan(vector2)
	local function isNaNNum(number)
		return (value ~= value) and 1 or 0 
	end
	return {
		isNaNNum(vector2[1]),
		isNaNNum(vector2[2])
	}
end

--[[************************************************************************]]--

__e2setcost(2) -- approximation

e2function vector2 abs(vector2)
	return {
		abs(vector2[1]),
		abs(vector2[2])
	}
end

e2function vector2 ceil(vector2, v2decimals)
	local shf1 = 10 ^ floor(v2decimals[1] + 0.5)
	local shf2 = 10 ^ floor(v2decimals[2] + 0.5)
	return { 
		ceil(vector2[1] * shf1) / shf1,
		ceil(vector2[2] * shf2) / shf2
	}
end

e2function number floor(value, decimals)
	local shf1 = 10 ^ floor(v2decimals[1] + 0.5)
	local shf2 = 10 ^ floor(v2decimals[2] + 0.5)
	return { 
		floor(vector2[1] * shf1) / shf1,
		floor(vector2[2] * shf2) / shf2
	}
end

e2function number round(value, decimals)
	local shf1 = 10 ^ floor(v2decimals[1] + 0.5)
	local shf2 = 10 ^ floor(v2decimals[2] + 0.5)
	return { 
		floor(vector2[1] * shf1 + 0.5) / shf1,
		floor(vector2[2] * shf2 + 0.5) / shf2
	}
end

--- rounds towards zero
e2function vector2 int(vector2)
	local function intNum(number)
		if rv1 >= 0 then return floor(rv1) else return ceil(rv1) end
	end
	return {
		intNum(vector2[1]),
		intNum(vector2[2])
	}
end

--- returns the fractional part. (frac(-1.5) == 0.5 & frac(3.2) == 0.2)
e2function number frac(rv1)
	if rv1 >= 0 then return rv1 % 1 else return rv1 % -1 end
end

-- TODO: what happens with negative modulo?
registerFunction("mod", "nn", "n", function(self, args)
	local op1, op2 = args[2], args[3]
	local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
	if rv1 >= 0 then return rv1 % rv2 else return rv1 % -rv2 end
end)

-- TODO: change to a more suitable name? (cyclic modulo?)
--       add helpers for wrap90 wrap180, wrap90r wrap180r? or pointless?
--       wrap90(Pitch), wrap(Pitch, 90)
--       should be added...

registerFunction("wrap", "nn", "n", function(self, args)
	local op1, op2 = args[2], args[3]
	local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
	return (rv1 + rv2) % (rv2 * 2) - rv2
end)

registerFunction("clamp", "nnn", "n", function(self, args)
	local op1, op2, op3 = args[2], args[3], args[4]
	local rv1, rv2, rv3 = op1[1](self, op1), op2[1](self, op2), op3[1](self, op3)
	if rv1 < rv2 then return rv2 elseif rv1 > rv3 then return rv3 else return rv1 end
end)

--- Returns 1 if <value> is in the interval [<min>; <max>], 0 otherwise.
e2function number inrange(value, min, max)
	if value < min then return 0 end
	if value > max then return 0 end
	return 1
end

registerFunction("sign", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	if rv1 > delta then return 1
	elseif rv1 < -delta then return -1
	else return 0 end
end)

--[[************************************************************************]]--

__e2setcost(2) -- approximation

registerFunction("random", "", "n", function(self, args)
	return random()
end)

registerFunction("random", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return random() * rv1
end)

registerFunction("random", "nn", "n", function(self, args)
	local op1, op2 = args[2], args[3]
	local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
	return rv1 + random() * (rv2 - rv1)
end)

registerFunction("randint", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return random(rv1)
end)

registerFunction("randint", "nn", "n", function(self, args)
	local op1, op2 = args[2], args[3]
	local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
	local temp = rv1
	if (rv1 > rv2) then rv1 = rv2 rv2 = temp end
	return random(rv1, rv2)
end)

--[[************************************************************************]]--

__e2setcost(2) -- approximation

registerFunction("sqrt", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return rv1 ^ (1 / 2)
end)

registerFunction("cbrt", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return rv1 ^ (1 / 3)
end)

registerFunction("root", "nn", "n", function(self, args)
	local op1, op2 = args[2], args[3]
	local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
	return rv1 ^ (1 / rv2)
end)

local const_e = exp(1)
registerFunction("e", "", "n", function(self, args)
	return const_e
end)

registerFunction("exp", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return exp(rv1)
end)

e2function vector2 frexp(x)
	local mantissa, exponent = frexp(x)
	return { mantissa, exponent }
end

registerFunction("ln", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return log(rv1)
end)

local const_log2 = log(2)
registerFunction("log2", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return log(rv1) / const_log2
end)

registerFunction("log10", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return log10(rv1)
end)

registerFunction("log", "nn", "n", function(self, args)
	local op1, op2 = args[2], args[3]
	local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
	return log(rv1) / log(rv2)
end)

--[[************************************************************************]]--

__e2setcost(2) -- approximation

local deg2rad = pi / 180
local rad2deg = 180 / pi

registerFunction("inf", "", "n", function(self, args)
	return inf
end)

registerFunction("pi", "", "n", function(self, args)
	return pi
end)

registerFunction("toRad", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return rv1 * deg2rad
end)

registerFunction("toDeg", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return rv1 * rad2deg
end)

registerFunction("acos", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return acos(rv1) * rad2deg
end)

registerFunction("asin", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return asin(rv1) * rad2deg
end)

registerFunction("atan", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return atan(rv1) * rad2deg
end)

registerFunction("atan", "nn", "n", function(self, args)
	local op1, op2 = args[2], args[3]
	local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
	return atan2(rv1, rv2) * rad2deg
end)

registerFunction("cos", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return cos(rv1 * deg2rad)
end)

registerFunction("sec", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return 1/cos(rv1 * deg2rad)
end)

registerFunction("sin", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return sin(rv1 * deg2rad)
end)

registerFunction("csc", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return 1/sin(rv1 * deg2rad)
end)

registerFunction("tan", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return tan(rv1 * deg2rad)
end)

registerFunction("cot", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return 1/tan(rv1 * deg2rad)
end)

registerFunction("cosh", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return cosh(rv1)
end)

registerFunction("sech", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return 1/cosh(rv1)
end)

registerFunction("sinh", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return sinh(rv1)
end)

registerFunction("csch", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return 1/sinh(rv1)
end)

registerFunction("tanh", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return tanh(rv1)
end)

registerFunction("coth", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return 1/tanh(rv1)
end)

registerFunction("acosr", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return acos(rv1)
end)

registerFunction("asinr", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return asin(rv1)
end)

registerFunction("atanr", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return atan(rv1)
end)

registerFunction("atanr", "nn", "n", function(self, args)
	local op1, op2 = args[2], args[3]
	local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
	return atan2(rv1, rv2)
end)

registerFunction("cosr", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return cos(rv1)
end)

registerFunction("secr", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return 1/cos(rv1)
end)

registerFunction("sinr", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return sin(rv1)
end)

registerFunction("cscr", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return 1/sin(rv1)
end)

registerFunction("tanr", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return tan(rv1)
end)

registerFunction("cotr", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return 1/tan(rv1)
end)

registerFunction("coshr", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return cosh(rv1)
end)

registerFunction("sechr", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return 1/cosh(rv1)
end)

registerFunction("sinhr", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return sinh(rv1)
end)

registerFunction("cschr", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return 1/sinh(rv1)
end)

registerFunction("tanhr", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return tanh(rv1)
end)

registerFunction("cothr", "n", "n", function(self, args)
	local op1 = args[2]
	local rv1 = op1[1](self, op1)
	return 1/tanh(rv1)
end)

--[[************************************************************************]]--

__e2setcost(15) -- approximation


e2function vector2 toStringV2(vector2 vector)
	return {
    	tostring(vector[1]),
    	tostring(vector[2])
  	}
end

e2function vector2 vector2:toStringV2()
	return {
		tostring(this[1]),
		tostring(this[2])
	}
end

