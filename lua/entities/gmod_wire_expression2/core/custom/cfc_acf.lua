CFCE2Lib.RegisterExtension( "cfc_e2_lib", true )


e2function void entity:acfAdminDisable()
    if not IsValid( this ) then return end
    if not self.player:IsAdmin() then return end
    
    this.cfcE2LibACFDisableDamage = true 
    
end

e2function void entity:acfAdminEnable()
    if not IsValid( this ) then return end
    if not self.player:IsAdmin() then return end
    
    this.cfcE2LibACFDisableDamage = false
    
end

local function acfDisabledCheck(_, Entity, _, _, _, _, _, _)
    if not IsValid( Entity ) then return end
    
    return not Entity.cfcE2LibACFDisableDamage
    
end

hook.Add( "ACF_BulletDamage", "CFC_E2Lib_ScaleACFDamage", acfDisabledCheck )