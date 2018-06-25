E2Lib.RegisterExtension("cfclib", true)

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


e2function table getAllPlayersInPvp()
    local pvpers = {}
    for _, v in pairs(player.GetHumans()) do
        if v:GetNWBool("CFC_PvP_Mode", false) then pvpers << v end
    end

    return pvpers
end

