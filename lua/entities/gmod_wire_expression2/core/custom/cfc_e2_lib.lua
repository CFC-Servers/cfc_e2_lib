E2Lib.RegisterExtension( "cfc_e2_lib", true )

-- PvP Functions
e2function number entity:playerIsInPvp()
    if not IsValid(this) or not this:IsPlayer() then return 0 end
    if this:GetNWBool( "CFC_PvP_Mode", false ) == true then return 1 end

    return 0
end

e2function number entity:playerIsInBuild()
    if not IsValid(this) or not this:IsPlayer() then return 0 end
    if this:GetNWBool( "CFC_PvP_Mode", false ) == false then return 1 end

    return 0
end

e2function string entity:getPvpStatus()
    if not IsValid(this) or not this:IsPlayer() then return "" end
    if this:GetNWBool( "CFC_PvP_Mode", false ) == true then return "pvp" end

    return "build"
end

e2function array getPvpers()
    local pvpers = {}
    for _, v in pairs(player.GetHumans()) do
        if v:GetNWBool( "CFC_PvP_Mode", false ) then pvpers[#pvpers + 1] = v end
    end

    return pvpers
end

e2function array getBuilders()
    local builders = {}
    for _, v in pairs(player.GetHumans()) do
        if v:GetNWBool( "CFC_PvP_Mode", false ) == false then builders[#builders + 1] = v end
    end

    return builders
end

-- Ping Functions
e2function number averagePing()
    local sum = 0
    local humans = player.GetHumans()

    for _, v in pairs( humans ) do
        sum = sum + v:Ping()
    end

    local avg = sum / table.Count( humans )

    return avg
end

-- String Functions
e2function number string:startsWith(string start)
    if string.StartWith( this, start ) then return 1 end
    return 0
end

-- Array Functions
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


-- String Functions
e2function number string:isNumber()
    -- This regex tests for only digits
    if tonumber( this ) then return 1 end
    return 0
end

e2function number string:isLetters()
    -- This regex tests for only letters (case insensitive) and spaces
    if string.find( this, "^[%a ]*$" ) then return 1 end
    return 0
end

e2function number string:hasNumber()
    -- This regex looks for existance of a digit
    if string.find( this, "%d" ) then return 1 end
    return 0
end

e2function number string:hasLetter()
    -- This regex looks for existance of a character
    if string.find( this, "%a" ) then return 1 end
    return 0
end

e2function string string:toUpper()
    return string.upper( this )
end

e2function string string:toLower()
    return string.lower( this )
end

e2function number string:isUpper()
    if this == string.upper( this ) then return 1 end
    return 0
end

e2function number string:isLower()
    if this == string.lower( this ) then return 1 end
    return 0
end
