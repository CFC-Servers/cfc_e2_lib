CFCE2Lib.RegisterExtension( "cfc_e2_lib", true )

e2function array getPvpers()
    local pvpers = {}
    local humans = player.GetHumans()

    for _, human in pairs( humans ) do
        if human:IsInPvp() then pvpers[#pvpers + 1] = human end
    end

    return pvpers
end

e2function array getBuilders()
    local builders = {}
    local humans = player.GetHumans()

    for _, human in pairs( humans ) do
        if human:IsInBuild() then builders[#builders + 1] = human end
    end

    return builders
end

-- Ping Functions
e2function number averagePing()
    local sum = 0
    local humans = player.GetHumans()

    for _, human in pairs( humans ) do
        sum = sum + human:Ping()
    end

    local average = sum / table.Count( humans )

    return average
end

e2function number minPing()
    local min = math.huge
    local humans = player.GetHumans()

    for _, human in pairs( humans ) do
        local ping = human:Ping()
        if ping < min then min = ping end
    end

    return min
end

e2function number maxPing()
    local max = 0
    local humans = player.GetHumans()

    for i, human in pairs( humans ) do
        local ping = human:Ping()

        if i == 1 then max = ping end

        if ping > max then max = ping end
    end

    return max
end

-- Loss Functions
e2function number averageLoss()
    local sum = 0
    local humans = player.GetHumans()

    for _, human in pairs( humans ) do
        sum = sum + human:PacketLoss()
    end

    local average = sum / table.Count( humans )

    return average
end

e2function number minLoss()
    local min = 0
    local humans = player.GetHumans()

    for _, human in pairs( humans ) do
        local loss = human:PacketLoss()
        if loss < min then min = loss end
    end

    return min
end

e2function number maxLoss()
    local max = 0
    local humans = player.GetHumans()

    for i, human in pairs( humans ) do
        local loss = human:PacketLoss()

        if i == 1 then max = loss end

        if loss > max then max = loss end
    end

    return max
end

__e2setcost(10)
e2function array getAlive()
    local arrayOfLiving = {}
    local humans = player.GetHumans()

    for _, human in pairs( humans ) do
        if human:Alive() then table.insert( arrayOfLiving, human ) end
    end

    return arrayOfLiving
end

__e2setcost(10)
e2function array getDead()
    local arrayOfDead = {}
    local humans = player.GetHumans()

    for _, human in pairs( humans ) do
        if not human:Alive() then table.insert( arrayOfDead, human ) end
    end

    return arrayOfDead
end

local memCacheTime = 0.1
local lastMemCountTime = CurTime()
local cachedMemAmount = collectgarbage( "count" )

__e2setcost(10)
e2function number serverMemoryUsage()
   if CurTime() < lastMemCountTime + memCacheTime then
       return cachedMemAmount
   end

   cachedMemAmount = collectgarbage( "count" )
   return cachedMemAmount
end
