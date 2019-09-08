CFCE2Lib.RegisterExtension( "cfc_e2_lib", true )

e2function vector ent:getPlyCol()
    if not IsValid(ent) then return end
    if not ent:IsPlayer() then return end
    return ent:GetPlayerColor()
end

e2function vector ent:getWepCol()
    if not IsValid(ent) then return end
    if not ent:IsPlayer() then return end
    return ent:GetWeaponColor()
end