E2Lib.RegisterExtension( "cfc_e2_lib", true )

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
e2function vector2 isfinite(vector2 vectah)
    return {
        (vectah[1] > -inf and vectah[1] < inf) and 1 or 0,
        (vectah[2] > -inf and vectah[2] < inf) and 1 or 0
    }
end

e2function vector2 vector2:isfinite()
    return {
        (this[1] > -inf and this[1] < inf) and 1 or 0,
        (this[2] > -inf and this[2] < inf) and 1 or 0
    }
end

--- Returns 1 if given value is a positive infinity or -1 if given value is a negative infinity; otherwise 0.
e2function vector2 isinf(vector2 vectah)
    local function numIsInf(number)
        if number == inf then return 1 end
        if number == -inf then return -1 end
        return 0
    end
    return {
        numIsInf(vectah[1]),
        numIsInf(vectah[2])
    }
end

e2function vector2 vector2:isinf()
    local function numIsInf(number)
        if number == inf then return 1 end
        if number == -inf then return -1 end
        return 0
    end
    return {
        numIsInf(this[1]),
        numIsInf(this[2])
    }
end

--- Returns true (1) if given value is not a number (NaN); otherwise false (0).
e2function vector2 isnan(vector2 vectah)
    local function isNaNNum(number)
        return (value ~= value) and 1 or 0
    end
    return {
        isNaNNum(vectah[1]),
        isNaNNum(vectah[2])
    }
end
e2function vector2 vector2:isnan()
    local function isNaNNum(number)
        return (value ~= value) and 1 or 0
    end
    return {
        isNaNNum(this[1]),
        isNaNNum(this[2])
    }
end

--[[************************************************************************]]--

__e2setcost(2) -- approximation

e2function vector2 abs(vector2 vectah)
    return {
        abs(vectah[1]),
        abs(vectah[2])
    }
end
e2function vector2 vector2:abs()
    return {
        abs(this[1]),
        abs(this[2])
    }
end

--- rounds towards zero
e2function vector2 int(vector2 vectah)
    local function intNum(number)
        if rv1 >= 0 then return floor(rv1) else return ceil(rv1) end
    end
    return {
        intNum(vectah[1]),
        intNum(vectah[2])
    }
end
e2function vector2 vector2:int()
    local function intNum(number)
        if rv1 >= 0 then return floor(rv1) else return ceil(rv1) end
    end
    return {
        intNum(this[1]),
        intNum(this[2])
    }
end

--- returns the fractional part. (frac(-1.5) == 0.5 & frac(3.2) == 0.2)
e2function vector2 frac(vector2 vectah)
    local function fracnum(number)
        if rv1 >= 0 then return rv1 % 1 else return rv1 % -1 end
    end
    return {
        fracnum(vectah[1]),
        fracnum(vectah[2])
    }
end

e2function vector2 vector2:frac(vector2)
    local function fracnum(number)
        if rv1 >= 0 then return rv1 % 1 else return rv1 % -1 end
    end
    return {
        fracnum(this[1]),
        fracnum(this[2])
    }
end

e2function vector2 vector2:wrap(vector2 wrapby)
    return {
        (this[1] + wrapby[1]) % (wrapby[1] * 2) - wrapby[1],
        (this[2] + wrapby[2]) % (wrapby[2] * 2) - wrapby[2]
    }
end

e2function vector2 wrap(vector2 wrapped, vector2 wrapby)
    return {
        (wrapped[1] + wrapby[1]) % (wrapby[1] * 2) - wrapby[1],
        (wrapped[2] + wrapby[2]) % (wrapby[2] * 2) - wrapby[2]
    }
end

--[[************************************************************************]]--

__e2setcost(2) -- approximation

e2function vector2 sqrt(vector2 vectah)
    return {
        vectah[1] ^ (1 / 2),
        vectah[2] ^ (1 / 2)
    }
end
e2function vector2 vector2:sqrt()
    return {
        this[1] ^ (1 / 2),
        this[2] ^ (1 / 2)
    }
end

registerFunction("cbrt", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        rv1 ^ (1 / 3),
        rv2 ^ (1 / 3)
    }
end)

registerFunction("root", "xv2n", "xv2", function(self, args)
    local op1, op2, op3 = args[2][1], args[2][2], args[3]
    local rv1, rv2, rv3 = op1[1](self, op1), op2[1](self,op2), op3[1](self, op3)
    return {
        rv1 ^ (1 / rv3),
        rv2 ^ (1 / rv3)
    }
end)

--[[************************************************************************]]--

__e2setcost(2) -- approximation

local deg2rad = pi / 180
local rad2deg = 180 / pi

registerFunction("toRad", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        rv1 * deg2rad,
        rv2 * deg2rad
    }
end)

registerFunction("toDeg", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        rv1 * rad2deg,
        rv2 * rad2deg
    }
end)

registerFunction("acosvec2", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        acos(rv1) * rad2deg,
        acos(rv2) * rad2deg
    }
end)

registerFunction("acos", "xv2", "n", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    local hypo = sqrt(rv1*rv1+rv2*rv2)
    return acos(rv1/hypo) * rad2deg
end)

registerFunction("asinvec2", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        asin(rv1) * rad2deg,
        asin(rv2) * rad2deg
    }
end)

registerFunction("asin", "xv2", "n", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    local hypo = sqrt(rv1*rv1+rv2*rv2)
    return acos(rv2/hypo) * rad2deg
end)

registerFunction("atanvec2", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        atan(rv1) * rad2deg,
        atan(rv2) * rad2deg
    }
end)

registerFunction("atan", "xv2", "n", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return atan(rv2/rv1) * rad2deg
end)

registerFunction("cos", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        cos(rv1 * deg2rad),
        cos(rv2 * deg2rad)
    }
end)

registerFunction("sec", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        1/cos(rv1 * deg2rad),
        1/cos(rv2 * deg2rad)
    }
end)

registerFunction("sin", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        sin(rv1 * deg2rad),
        sin(rv2 * deg2rad)
    }
end)

registerFunction("csc", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        1/sin(rv1 * deg2rad),
        1/sin(rv2 * deg2rad)
    }
end)

registerFunction("tan", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        tan(rv1 * deg2rad),
        tan(rv2 * deg2rad)
    }
end)

registerFunction("cot", "xv2", "xv2" function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        1/tan(rv1 * deg2rad),
        1/tan(rv2 * deg2rad)
    }
end)

registerFunction("rcos", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        cos(rv1),
        cos(rv2)
    }
end)

registerFunction("rsec", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        1/cos(rv1),
        1/cos(rv2)
    }
end)

registerFunction("rsin", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        sin(rv1),
        sin(rv2)
    }
end)

registerFunction("rcsc", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        1/sin(rv1),
        1/sin(rv2)
    }
end)

registerFunction("rtan", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        tan(rv1),
        tan(rv2)
    }
end)

registerFunction("rcot", "xv2", "xv2" function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        1/tan(rv1),
        1/tan(rv2)
    }
end)

registerFunction("acosrvec2", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        acos(rv1),
        acos(rv2)
    }
end)

registerFunction("acosr", "xv2", "n", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    local hypo = sqrt(rv1*rv1+rv2*rv2)
    return acos(rv1/hypo)
end)

registerFunction("asinrvec2", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        asin(rv1),
        asin(rv2)
    }
end)

registerFunction("asinr", "xv2", "n", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    local hypo = sqrt(rv1*rv1+rv2*rv2)
    return acos(rv2/hypo)
end)

registerFunction("atanrvec2", "xv2", "xv2", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return {
        atan(rv1),
        atan(rv2)
    }
end)

registerFunction("atanr", "xv2", "n", function(self, args)
    local op1, op2 = args[2][1], args[2][2]
    local rv1, rv2 = op1[1](self, op1), op2[1](self, op2)
    return atan(rv2/rv1)
end)

--[[************************************************************************]]--
