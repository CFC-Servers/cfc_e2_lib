E2Lib.RegisterExtension( "cfc_e2_lib", true )

e2function array array:shuffled()
    local size = #this
    for i = size, 1, -1 do
        local rand = math.random( size )
        this[i], this[rand] = this[rand], this[i]
    end

    return this
end

e2function array array:difference(array arrayDiff)
    local difference = {}
    for _, v in pairs( this ) do
        if !table.KeyFromValue( arrayDiff, v ) then difference[#difference + 1] = v end
    end

    return difference
end

e2function array array:intersection(array arrayDiff)
    local same = {}
    local added = {}
    for _, v in pairs( this ) do
        if not added[v] then
            if table.KeyFromValue( arrayDiff, v ) then same[#same + 1] = v end
            added[v] = true
        end
    end

    return same
end

e2function array array:reversed()
    return table.Reverse( this )
end

e2function array array:sub(number n1, number n2)
    if n1 < 1 then n1 = 1 end
    if n2 > #this then n2 = #this end

    return {unpack( this, n1, n2 )}
end

e2function array array:sub(number n)
    if n > #this then return {this[#this]} end
    return {unpack( this, n )}
end

-- Index functions
local function indexOfNormalValue(arr, val)
    for idx = 1, #arr do
        if arr[idx] == val then return idx end
    end

    return 0
end

local function indexOfPackedValue(arr, val)
    local unpacked = unpack( val )
    for idx = 1, #arr do
        if unpacked == unpack( arr[idx] ) then return idx end
    end

    return 0
end

e2function number array:indexOf(number num)
    return indexOfNormalValue( this, num )
end

e2function number array:indexOf(string str)
    return indexOfNormalValue( this, str )
end

e2function number array:indexOf(angle ang)
    return indexOfPackedValue( this, ang )
end

e2function number array:indexOf(vector vec)
    return indexOfPackedValue( this, vec )
end

e2function number array:indexOf(vector2 vec2)
    return indexOfPackedValue( this, vec2 )
end

e2function number array:indexOf(vector4 vec4)
    return indexOfPackedValue( this, vec4 )
end

e2function entity array:firstEntity()
    return this[1]
end
e2function string array:firstString()
    return this[1]
end
e2function number array:firstNumber()
    return this[1]
end
e2function vector array:firstVector()
    return this[1]
end
e2function vector2 array:firstVector2()
    return this[1]
end
e2function vector4 array:firstVector4()
    return this[1]
end
e2function angle array:firstAngle()
    return this[1]
end
e2function ranger array:firstRanger()
    return this[1]
end
e2function bone array:firstBone()
    return this[1]
end
e2function matrix2 array:firstMatrix2()
    return this[1]
end
e2function matrix array:firstMatrix()
    return this[1]
end
e2function matrix4 array:firstMatrix4()
    return this[1]
end
e2function wirelink array:firstWirelink()
    return this[1]
end
e2function complex array:firstComplex()
    return this[1]
end

e2function entity array:lastEntity()
    return this[ #this ]
end
e2function string array:lastString()
    return this[ #this ]
end
e2function number array:lastNumber()
    return this[ #this ]
end
e2function vector array:lastVector()
    return this[ #this ]
end
e2function vector2 array:lastVector2()
    return this[ #this ]
end
e2function vector4 array:lastVector4()
    return this[ #this ]
end
e2function angle array:lastAngle()
    return this[ #this ]
end
e2function ranger array:lastRanger()
    return this[ #this ]
end
e2function bone array:lastBone()
    return this[ #this ]
end
e2function matrix2 array:lastMatrix2()
    return this[ #this ]
end
e2function matrix array:lastMatrix()
    return this[ #this ]
end
e2function matrix4 array:lastMatrix4()
    return this[ #this ]
end
e2function wirelink array:lastWirelink()
    return this[ #this ]
end
e2function complex array:lastComplex()
    return this[ #this ]
end
