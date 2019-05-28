E2Lib.RegisterExtension( "cfc_e2_lib", true )

-- E2 Library Includes
local clamp   = E2Lib.clampPos

--Player Entities
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

e2function string entity:getFactionID()
    if not IsValid(this) or not this:IsPlayer() then return "" end
    return this:GetFactionID()
end

e2function string entity:getFactionRank()
    if not IsValid(this) or not this:IsPlayer() then return "" end
    return this:GetFactionRank()
end

e2function number entity:isInFaction()
    if not IsValid(this) or not this:IsPlayer() then return 0 end
    return this:IsInFaction()
end

-- Vehicle Entities
e2function void entity:ejectPodTo(vector pos)
    local clampedPos = clamp(pos)

    if not IsValid(this) or not this:IsVehicle() then return end
    if not this:CPPIGetOwner() == self.player then return end

    local driver = this:GetDriver()
    if not IsValid(driver) or not driver:IsPlayer() then return end

    driver:ExitVehicle()
    driver:SetPos(clampedPos)
end

e2function number entity:setFairPos(vector target)
    if not IsValid(this) or this:IsPlayer() then return -3 end -- Debug output -3 if the target is a player
    local MaxFairDistance = GetConVar("MaxFairDistance"):GetFloat()
    local posToLoc = Vector(target[1],target[2],target[3]) - self.entity:GetPos() -- Localized the position of the target to the e2
    local lengthPos = posToLoc[1]^2 + posToLoc[2]^2 + posToLoc[3]^2 -- this uses 3d pythagorean therom, but doesnt square root the end result, as that would just waste time when we could square the convar, which would use less power to calculate

    local entB4PosLoc = this:GetPos() - self.entity:GetPos() -- Localizes the target entity
    local entLength = entB4PosLoc[1]^2 + entB4PosLoc[2]^2 + entB4PosLoc[3]^2 -- we dont need to do the square root on this, itll just waste time and resources

    if lengthPos >= MaxFairDistance^2 then return -1 end -- Debug output -1 if the wanted pos is out of bounds and end
    if entLength >= MaxFairDistance^2 then return -2 end -- Debug output -2 if the target entity pos is out of bounds and end

    this:SetPos(Vector(target[1],target[2],target[3])) -- set the pos and end it
    return 1 --passed all tests, debug 1 for success
end
