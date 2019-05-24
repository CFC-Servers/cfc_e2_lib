E2Lib.RegisterExtension( "cfc_e2_lib", true )

--https://en.wikipedia.org/wiki/List_of_trigonometric_identities

local math   = math
local sin    = math.sin
local cos    = math.cos
local acos   = math.acos
local asin   = math.asin
local atan   = math.atan
local sqrt   = math.sqrt

--https://en.wikipedia.org/wiki/Versine
e2function number ver(number num)
    return 1 - cos(num)
end

--https://en.wikipedia.org/wiki/Versine
e2function number vcs(number num)
    return 1 + cos(num)
end

--https://en.wikipedia.org/wiki/Versine
e2function number cvs(number num)
    return 1 - sin(num)
end

--https://en.wikipedia.org/wiki/Versine
e2function number cvc(number num)
    return 1 + sin(num)
end

--https://en.wikipedia.org/wiki/Versine
e2function number hav(number num)
    return 1/2 - cos(num)/2
end

--https://en.wikipedia.org/wiki/Versine
e2function number hvc(number num)
    return 1/2 + cos(num)/2
end

--https://en.wikipedia.org/wiki/Versine
e2function number hcv(number num)
    return 1/2 - sin(num)/2
end

--https://en.wikipedia.org/wiki/Versine
e2function number hcc(number num)
    return 1/2 + sin(num)/2
end

--https://en.wikipedia.org/wiki/Exsecant
e2function number exs(number num)
    return 1/cos(num) - 1
end

--https://en.wikipedia.org/wiki/Exsecant
e2function number exc(number num)
    return 1/sin(num) - 1
end

--https://en.wikipedia.org/wiki/Chord_(geometry)#crd
e2function number crd(number num)
    return 2 * sin(num/2)
end

--https://en.wikipedia.org/wiki/Versine
e2function number aver(number num)
    return acos(1 - num)
end

--https://en.wikipedia.org/wiki/Versine
e2function number avcs(number num)
    return acos(1 + num)
end

--https://en.wikipedia.org/wiki/Versine
e2function number acvs(number num)
    return asin(1 - num)
end

--https://en.wikipedia.org/wiki/Versine
e2function number acvc(number num)
    return asin(1 + num)
end

--https://en.wikipedia.org/wiki/Versine
e2function number ahav(number num)
    return 2 * asin(sqrt(num))
end

--https://en.wikipedia.org/wiki/Versine
e2function number ahvc(number num)
    return 2 * acos(sqrt(num))
end

--https://en.wikipedia.org/wiki/Versine
--cannot find inverse that works, used algebra and desmos to come up with one https://www.desmos.com/calculator/gjtuv8jvpm
e2function number ahcv(number num)
    return asin(1 - 2 * num)
end

--https://en.wikipedia.org/wiki/Versine
--cannot find inverse that works, same as above https://www.desmos.com/calculator/y7xi4iagps
e2function number ahcc(number num)
    return asin(2 * num - 1)
end

--https://en.wikipedia.org/wiki/Exsecant
e2function number aexs(number num)
    return acos(1/(num+1))
end

--https://en.wikipedia.org/wiki/Exsecant
e2function number aexc(number num)
    return asin(1/(num+1))
end

--https://en.wikipedia.org/wiki/Chord_(geometry)#crd
e2function number acrd(number num)
    return 2 * asin(num/2)
end
