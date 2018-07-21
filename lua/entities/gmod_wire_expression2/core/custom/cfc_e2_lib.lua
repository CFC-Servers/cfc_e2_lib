E2Lib.RegisterExtension("cfc_e2_lib", true)

-- PvP Functions
e2function number entity:playerIsInPvp()
    if not IsValid(this) or not this:IsPlayer() then return 0 end
    if this:GetNWBool("CFC_PvP_Mode", false) == true then return 1 end
    return 0
end

e2function number entity:playerIsInBuild()
    if not IsValid(this) or not this:IsPlayer() then return 0 end
    if this:GetNWBool("CFC_PvP_Mode", false) == false then return 1 end
    return 0
end

e2function string entity:getPvpStatus()
    if not IsValid(this) or not this:IsPlayer() then return end
    if this:GetNWBool("CFC_PvP_Mode", false) == true then return "pvp" end
    return "build"
end

e2function table getPvpers()
    local pvpers = {}
    for _, v in pairs(player.GetHumans()) do
        if v:GetNWBool("CFC_PvP_Mode", false) then pvpers[#pvpers + 1] = v end
    end

    return pvpers
end

e2function table getBuilders()
    local builders = {}
    for _, v in pairs(player.GetHumans()) do
        if v:GetNWBool("CFC_PvP_Mode", false) == false then builders[#builders + 1] = v end
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

    return sum / table.Count(humans)
end

-- String Functions
e2function number string:startsWith(string start)
	if string.StartWith(this, start) then return 1 else return 0 end
end

-- Array Functions
e2function array array:shuffled()
    local size = #this
    for i = size, 1, -1 do
      local rand = math.random(size)
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

e2function array array:reverse()
    return table.Reverse(this)
end

e2function array array:sub(number n1, number n2)
    if n1 < 1 then n1 = 1 end
    if n2 > #this then n2 = #this end
    return {unpack( this, n1, n2 )}
end

e2function array array:sub(number n1)
    if n1 > #this then return {this[#this]} end
    return {unpack( this, n1 )}
end

local function indexOf(arr, val)
    for idx = 1, #arr do
        if arr[idx] == val then return idx end
    end
    return 0
end

local function indexOfVector(arr, val)
	local lookFor = Vector(val[1], val[2], val[3])
	for idx = 1, #arr do
		local curVec = arr[idx]
		if lookFor == Vector(curVec[1], curVec[2], curVec[3]) then return idx end
	end
	return 0
end

e2function number array:indexOf(number num)
    return indexOf( this, num )
end

e2function number array:indexOf(string str)
    return indexOf( this, str )
end

e2function number array:indexOf(angle ang)
    return indexOfVector( this, ang )
end

e2function number array:indexOf(vector vec)
	return indexOfVector( this, vec )
end

e2function number array:indexOf(vector2 vec2)
	for idx = 1, #this do
		local thisVec = this[idx]
		if thisVec[1] == vec2[1] and thisVec[2] == vec2[2] then return idx end
	end
	return 0
end

e2function number array:indexOf(vector4 vec4)
    for idx = 1, #this do
		local thisVec = this[idx]
		if thisVec[1] == vec4[1] and 
		   thisVec[2] == vec4[2] and 
		   thisVec[3] == vec4[3] and 
		   thisVec[4] == vec4[4] then return idx end
	end
	return 0
end
