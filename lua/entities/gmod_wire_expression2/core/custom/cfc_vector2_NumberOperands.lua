E2Lib.RegisterExtension( "cfc_e2_lib", true )

local math   = math

local pi     = math.pi
local inf    = math.huge

local sqrt   = math.sqrt

local abs    = math.abs

local floor  = math.floor
local ceil   = math.ceil

local sin    = math.sin
local cos    = math.cos
local tan    = math.tan

local acos   = math.acos
local asin   = math.asin
local atan   = math.atan

local function numIsInf(number)
    if number == inf then return 1 end
    if number == -inf then return -1 end
    return 0
end
local function isNaNNum(number)
    return (value ~= value) and 1 or 0
end
local function intNum(number)
    if rv1 >= 0 then return floor(rv1) else return ceil(rv1) end
end
local function fracnum(number)
    if rv1 >= 0 then return rv1 % 1 else return rv1 % -1 end
end

__e2setcost(2) -- approximation

--- Returns true (1) if given value is a finite number; otherwise false (0).
e2function vector2 isFinite(vector2 vectah)
    return {
        (vectah[1] > -inf and vectah[1] < inf) and 1 or 0,
        (vectah[2] > -inf and vectah[2] < inf) and 1 or 0
    }
end

--- Returns 1 if given value is a positive infinity or -1 if given value is a negative infinity; otherwise 0.
e2function vector2 isinf(vector2 vectah)
    return {
        numIsInf(vectah[1]),
        numIsInf(vectah[2])
    }
end

--- Returns true (1) if given value is not a number (NaN); otherwise false (0).
e2function vector2 isNan(vector2 vectah)
    return {
        isNaNNum(vectah[1]),
        isNaNNum(vectah[2])
    }
end

__e2setcost(2) -- approximation

e2function vector2 abs(vector2 vectah)
    return {
        abs(vectah[1]),
        abs(vectah[2])
    }
end

--- rounds towards zero
e2function vector2 int(vector2 vectah)
    return {
        intNum(vectah[1]),
        intNum(vectah[2])
    }
end

--- returns the fractional part. (frac(-1.5) == 0.5 & frac(3.2) == 0.2)
e2function vector2 frac(vector2 vectah)
    return {
        fracnum(vectah[1]),
        fracnum(vectah[2])
    }
end

e2function vector2 wrap(vector2 wrapped, vector2 wrapby)
    return {
        (wrapped[1] + wrapby[1]) % (wrapby[1] * 2) - wrapby[1],
        (wrapped[2] + wrapby[2]) % (wrapby[2] * 2) - wrapby[2]
    }
end

__e2setcost(2) -- approximation

e2function vector2 sqrt(vector2 vectah)
    return {
        vectah[1] ^ (1 / 2),
        vectah[2] ^ (1 / 2)
    }
end

e2function vector2 cbrt(vector2 vectah)
    return {
        vectah[1] ^ (1 / 3),
        vectah[2] ^ (1 / 3)
    }
end

e2function vector2 root(vector2 vectah, number num)
    return {
        vectah[1] ^ (1 / num),
        vectah[2] ^ (1 / num)
    }
end

e2function vector2 root2(vector2 vectah, vector2 vecta)
    return {
        vectah[1] ^ (1 / vecta[1]),
        vectah[2] ^ (1 / vecta[2])
    }
end

__e2setcost(2) -- approximation

local deg2rad = pi / 180
local rad2deg = 180 / pi

e2function vector2 toRad(vector2 vectah)
    return {
        vectah[1] * deg2rad,
        vectah[2] * deg2rad
    }
end
e2function vector2 vector2:toRad()
    return {
        this[1] * deg2rad,
        this[2] * deg2rad
    }
end

e2function vector2 toDeg(vector2 vectah)
    return {
        vectah[1] * rad2deg,
        vectah[2] * rad2deg
    }
end
e2function vector2 vector2:toDeg()
    return {
        this[1] * rad2deg,
        this[2] * rad2deg
    }
end

e2function vector2 acosvec2(vector2 vectah)
    return {
        acos(vectah[1]) * rad2deg,
        acos(vectah[2]) * rad2deg
    }
end

e2function number acos(vector2 vectah)
    local hypo = sqrt(vectah[1]^2+vectah[2]^2)
    return acos(vectah[1]/hypo) * rad2deg
end

e2function vector2 asinvec2(vector2 vectah)
    return {
        asin(vectah[1]) * rad2deg,
        asin(vectah[2]) * rad2deg
    }
end

e2function number asin(vector2 vectah)
    local hypo = sqrt(vectah[1]^2+vectah[2]^2)
    return asin(vectah[2]/hypo) * rad2deg
end

e2function vector2 atanvec2(vector2 vectah)
    return {
        atan(vectah[1]) * rad2deg,
        atan(vectah[2]) * rad2deg
    }
end

e2function number atan(vector2 vectah)
    return atan(vectah[2]/vectah[1]) * rad2deg
end

e2function vector2 cos(vector2 vectah)
    return {
        cos(vectah[1]*deg2rad),
        cos(vectah[2]*deg2rad)
    }
end

e2function vector2 sec(vector2 vectah)
    return {
        1/cos(vectah[1]*deg2rad),
        1/cos(vectah[2]*deg2rad)
    }
end

e2function vector2 sin(vector2 vectah)
    return {
        sin(vectah[1]*deg2rad),
        sin(vectah[2]*deg2rad)
    }
end

e2function vector2 csc(vector2 vectah)
    return {
        1/sin(vectah[1]*deg2rad),
        1/sin(vectah[2]*deg2rad)
    }
end

e2function vector2 tan(vector2 vectah)
    return {
        tan(vectah[1]*deg2rad),
        tan(vectah[2]*deg2rad)
    }
end

e2function vector2 cot(vector2 vectah)
    return {
        1/tan(vectah[1]*deg2rad),
        1/tan(vectah[2]*deg2rad)
    }
end

e2function vector2 rcos(vector2 vectah)
    return {
        cos(vectah[1]),
        cos(vectah[2])
    }
end

e2function vector2 rsec(vector2 vectah)
    return {
        1/cos(vectah[1]),
        1/cos(vectah[2])
    }
end

e2function vector2 rsin(vector2 vectah)
    return {
        sin(vectah[1]),
        sin(vectah[2])
    }
end

e2function vector2 rcsc(vector2 vectah)
    return {
        1/sin(vectah[1]),
        1/sin(vectah[2])
    }
end

e2function vector2 rtan(vector2 vectah)
    return {
        tan(vectah[1]),
        tan(vectah[2])
    }
end

e2function vector2 rcot(vector2 vectah)
    return {
        1/tan(vectah[1]),
        1/tan(vectah[2])
    }
end

e2function vector2 acosrvec2(vector2 vectah)
    return {
        acos(vectah[1]),
        acos(vectah[2])
    }
end

e2function number acosr(vector2 vectah)
    local hypo = sqrt(vectah[1]^2+vectah[2]^2)
    return acos(vectah[1]/hypo)
end

e2function vector2 asinrvec2(vector2 vectah)
    return {
        asin(vectah[1]),
        asin(vectah[2])
    }
end

e2function number asinr(vector2 vectah)
    local hypo = sqrt(vectah[1]^2+vectah[2]^2)
    return asin(vectah[2]/hypo)
end

e2function vector2 asinrvec2(vector2 vectah)
    return {
        atan(vectah[1]),
        atan(vectah[2])
    }
end

e2function number atanr(vector2 vectah)
    local hypo = sqrt(vectah[1]^2+vectah[2]^2)
    return atan(vectah[2]/vectah[1])
end
