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
