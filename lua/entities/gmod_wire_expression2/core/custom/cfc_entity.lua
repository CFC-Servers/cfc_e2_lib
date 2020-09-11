CFCE2Lib.RegisterExtension( "cfc_e2_lib", true )

-- E2 Library Includes
local clamp   = E2Lib.clampPos

-- Player Entities
e2function number entity:playerIsInPvp()
    if not IsValid( this ) or not this:IsPlayer() then return 0 end
    if this:GetNWBool( "CFC_PvP_Mode", false ) == true then return 1 end

    return 0
end

e2function number entity:playerIsInBuild()
    if not IsValid( this ) or not this:IsPlayer() then return 0 end
    if this:GetNWBool( "CFC_PvP_Mode", false ) == false then return 1 end

    return 0
end

e2function string entity:getPvpStatus()
    if not IsValid( this ) or not this:IsPlayer() then return "" end
    if this:GetNWBool( "CFC_PvP_Mode", false ) == true then return "pvp" end

    return "build"
end

e2function string entity:getFactionID()
    if not IsValid( this ) or not this:IsPlayer() then return "" end
    return this:GetFactionID()
end

e2function string entity:getFactionRank()
    if not IsValid( this ) or not this:IsPlayer() then return "" end
    return this:GetFactionRank()
end

e2function number entity:isInFaction()
    if not IsValid( this ) or not this:IsPlayer() then return 0 end
    return this:IsInFaction()
end

-- Vehicle Entities
local ejectRange = 500
e2function void entity:ejectPodTo( vector pos )
    local clampedPos = clamp( pos )

    local seatPos = this:GetPos()
    local x = math.clamp( clampedPos.x, seatPos.x - ejectRange, seatPos.x + ejectRange)
    local y = math.clamp( clampedPos.y, seatPos.y - ejectRange, seatPos.y + ejectRange)
    local z = math.clamp( clampedPos.z, seatPos.z - ejectRange, seatPos.z + ejectRange)
    clampedPos = Vector(x, y, z)

    if not IsValid( this ) or not this:IsVehicle() then return end
    if this:CPPIGetOwner() ~= self.player then return end

    local driver = this:GetDriver()
    if not IsValid( driver ) or not driver:IsPlayer() then return end

    driver:ExitVehicle()
    driver:SetPos( clampedPos )
end