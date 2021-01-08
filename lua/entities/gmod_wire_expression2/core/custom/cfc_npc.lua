CFCE2Lib.RegisterExtension( "cfc_e2_lib", true )

-- Made by StrawWagen


-- Setting up local functions 

local function hasAccess( ply, requiresAdmin )
    if not IsValid ( ply ) then return false end

    if not requiresAdmin then return true end
    if not ply:IsAdmin() then return false end

    return true
end

local function isValidNpc( npc )
    if not IsValid( npc ) then return false end
    if not npc:IsNPC() then return false end
    
    return true
end


-- Unrestricted get functions

e2function number entity:npcGetWeaponProficiency() 
    if not isValidNpc( this ) then return 0 end
    if not hasAccess( self.player, 0 ) then return 0 end
    
    return this:GetCurrentWeaponProficiency()
end

e2function number entity:npcGetDamageMultiplier() 
    if not isValidNpc( this ) then return 0 end
    if not hasAccess( self.player, 0 ) then return 0 end
    
    if not this.cfcE2LibNpcDamageMultiplier then return 0 end
    
    return this.cfcE2LibNpcDamageMultiplier
end

e2function string entity:npcGetGlobalSquad()
    if not isValidNpc( this ) then return "" end
    if not hasAccess( self.player, 0 ) then return "" end
    
    local squad = this:GetKeyValues().squadname
    
    if not squad then return "" end
        
    return squad
end

e2function string entity:npcCouldNotReach( entity reachableIn )
    if not isValidNpc( this ) then return "" end
    if not hasAccess( self.player, 0 ) then return "" end

    return this:IsUnreachable( reachableIn )
end


-- Admin only npc functions

e2function void entity:npcSetMaxHealth( number maxHealth )
    if not isValidNpc( this ) then return end
    if not hasAccess( self.player, 1 ) then return end

    this:SetMaxHealth( maxHealth )
end

e2function void entity:npcSetHealth( number health )
    if not isValidNpc( this ) then return end
    if not hasAccess( self.player, 1 ) then return end

    this:SetHealth( health )
end

e2function void entity:npcSetScale( number scale )
    if not isValidNpc( this ) then return end
    if not hasAccess( self.player, 1 ) then return end
    
    this:SetModelScale( scale, 0 )
end

e2function void entity:npcSetScale( number scale, number time )
    if not isValidNpc( this ) then return end
    if not hasAccess( self.player, 1 ) then return end
    
    this:SetModelScale( scale, time )
end

e2function void entity:npcSetWeaponProficiency( number weapProf )
    if not isValidNpc( this ) then return end
    if not hasAccess( self.player, 1 ) then return end
    
    this:SetCurrentWeaponProficiency( weapProf )
end

e2function void entity:npcSetDamageMultiplier( number mul ) 
    if not isValidNpc( this ) then return end
    if not hasAccess( self.player, 1 ) then return end
    
    this.cfcE2LibNpcDamageMultiplier = mul
end

e2function void entity:npcSetGlobalSquad( string squadIn ) 
    if not isValidNpc( this ) then return end
    if not hasAccess( self.player, 1 ) then return end
    
    this:SetKeyValue( "squadname", squadIn )
end

e2function entity npcCreate( string npcClass, vector positionIn )
    if not hasAccess( self.player, 1 ) then return NULL end
    local position = Vector( positionIn[1], positionIn[2], positionIn[3] )
    
    local npc = ents.Create( npcClass )
    if not isValidNpc( npc ) then return NULL end
    
    npc:SetPos( position )
    npc:Spawn()
        
    cleanup.Add( self.player, "npcs", npc )
    
    local undoLine = "npc " .. " (" .. npc:GetClass() .. ")"
    
    undo.Create( "npc" )
        undo.AddEntity( npc )
        undo.SetPlayer( self.player )
    undo.Finish( undoLine )
    
    return npc
end

e2function entity npcCreate( string npcClass, vector positionIn, string modelIn )
    if not hasAccess( self.player, 1 ) then return NULL end
    local position = Vector( positionIn[1], positionIn[2], positionIn[3] )
    
    local npc = ents.Create( npcClass )
    if not isValidNpc( npc ) then return NULL end
    
    npc:SetKeyValue( "model", modelIn )
    npc:SetPos( position )
    npc:Spawn()
        
    cleanup.Add( self.player, "npcs", npc )
    
    local undoLine = "npc " .. " (" .. npc:GetClass() .. ")"
    
    undo.Create( "npc" )
        undo.AddEntity( npc )
        undo.SetPlayer( self.player )
    undo.Finish( undoLine )
    
    return npc
end


-- Hook that makes npcSetDamageMultiplier work

local function scaleNPCDamage( target, dmgInfo )
    local attacker = dmgInfo:GetAttacker()
    
    if not isValidNpc( attacker ) then return end
    
    local dmgmul = attacker.cfcE2LibNpcDamageMultiplier
    
    if not dmgmul then return end

    dmgInfo:ScaleDamage( dmgmul )
end

hook.Add( "EntityTakeDamage", "CFC_E2Lib_ScaleNPCDamage", scaleNPCDamage )
