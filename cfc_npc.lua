CFCE2Lib.RegisterExtension( "cfc_e2_lib", true )

-- Made by StrawWagen

-- Setting up local functions 

local function ValidPly( ply )
    if not ply or not ply:IsValid() or not ply:IsPlayer() then
        return false
    end
    return true
end

local function ValidNpc( npc )
    if not npc or not npc:IsValid() or not npc:IsNPC() then
        return false
    end
    return true
end


local function hasAccess(ply)
    if ply:IsAdmin() then
        return true
    end
    return false
end


-- Admin only npc functions

e2function void entity:npcSetMaxHealth( number maxhealth )
    if not ValidNpc( this ) then return end
    if not ValidPly( self.player ) then return end
    if not hasAccess( self.player ) then return end

    this:SetMaxHealth( maxhealth )
end

e2function void entity:npcSetHealth( number health )
    if not ValidNpc( this ) then return end
    if not ValidPly( self.player ) then return end
    if not hasAccess( self.player ) then return end

    this:SetHealth( health )
end

e2function void entity:npcSetScale( number scale )
    if not ValidNpc( this ) then return end
    if not ValidPly( self.player ) then return end
    if not hasAccess( self.player ) then return end
    
    this:SetModelScale( scale, 0 )
end

e2function void entity:npcSetDamageMultiplier( number mul ) 
    if not ValidNpc( this ) then return end
    if not ValidPly( self.player ) then return end
    if not hasAccess( self.player ) then return end
	
	this.cfce2libNpcDamageMultiplier = mul
end

e2function string entity:npcSetGlobalSquad( number squadnum ) 
    if not ValidNpc( this ) then return NULL end
    if not ValidPly( self.player ) then return NULL end
    if not hasAccess( self.player ) then return NULL end
	if not squadnum then return NULL end
	
	local squad = "squad" .. tostring( squadnum )
	
	this:SetKeyValue( "squadname", squad )
	
	return squad
end

e2function string entity:npcGetGlobalSquad()
    if not ValidNpc( this ) then return NULL end
    if not ValidPly( self.player ) then return NULL end
    if not hasAccess( self.player ) then return NULL end
	
	local squad = this:GetKeyValues()["squadname"]
	
	if not squad then return NULL end
	
	return squad
end

e2function entity npcCreate( string npcclass, vector position )
    if not ValidPly( self.player ) then return NULL end
    if not hasAccess( self.player ) then return NULL end
    if not npcclass then return NULL end
	if not position then return NULL end
	
    local NPC = ents.Create( npcclass )
    
	if not IsValid( NPC ) then return NULL end
    if not NPC:IsNPC() then return NULL end
    
    NPC:SetPos( position )
    NPC:Spawn()
	
	cleanup.Add( self.player, "npcs", NPC )
	
	undo.Create( "npc" )
		undo.AddEntity( NPC )
		undo.SetPlayer( self.player )
	undo.Finish( "npc" .. " (" .. npcclass .. ")" )
    
    return NPC
end


-- Hook that makes npcSetDamageMultiplier work

local function scaleNPCDamage( target, dmgInfo )
    local attacker = dmgInfo:GetAttacker()
    
    if not IsValid( attacker ) then return end
    if not attacker:IsNPC() then return end
	
    local dmgmul = attacker.cfce2libNpcDamageMultiplier
	
	if not dmgmul then return end

    dmgInfo:ScaleDamage( dmgmul )
end

hook.Remove( "EntityTakeDamage", "ScaleNPCDamage" )
hook.Add( "EntityTakeDamage", "ScaleNPCDamage", scaleNPCDamage )