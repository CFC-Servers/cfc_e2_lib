E2Lib.RegisterExtension("cfclib", true)

-- PvP Functions
e2function number entity:playerIsInPvpMode()
    if not IsValid(this) or not this:IsPlayer() then return end
    if entity:GetNWBool("CFC_PvP_Mode", false) == true then return 1 end
    return 0
end

e2function number entity:playerIsInBuild()
    if not IsValid(this) or not this:IsPlayer() then return end
    if entity:GetNWBool("CFC_PvP_Mode", false) == false then return 1 end
    return 0
end

e2function string entity:getPvpStatus()
    if not IsValid(this) or not this:IsPlayer() then return end
    if entity:GetNWBool("CFC_PvP_Mode", false) == true then return "pvp" end
    return "build"
end


e2function table getPvpers()
    local pvpers = {}
    for _, v in pairs(player.GetHumans()) do
        if v:GetNWBool("CFC_PvP_Mode", false) then pvpers << v end
    end

    return pvpers
end

e2function table getBuilders()
    local builders = {}
    for _, v in pairs(player.GetHumans()) do
        if v:GetNWBool("CFC_PvP_Mode", false) == false then builders << v end
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
    return string.StartWith(this, start)
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
        if !table.KeyFromValue( arrayDiff, v ) then difference << v end
    end

    return difference
end

