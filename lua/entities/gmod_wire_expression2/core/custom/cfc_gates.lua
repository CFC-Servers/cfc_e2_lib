CFCE2Lib.RegisterExtension( "cfc_e2_lib", true )

local DEFAULT_GATE_MODEL = "models/jaanus/wiretool/wiretool_gate.mdl"
local UNDO_NAME = "E2 Spawned Wire Gate"

e2function string entity:getGateName()
    if not IsValid( this ) then return "" end
    return this.Action.name
end

e2function string entity:getGateGroupName()
    if not IsValid( this ) then return "" end
    return this.Action.group
end

e2function string entity:getGateActionName()
    if not IsValid( this ) or not this.Action then return "" end
    return this.action
end

e2function number isValidGateAction( string action )
    return GateActions[action] and 1 or 0
end

-- gateSpawn and optional arguments
local function addGateUndo( ent, ply )
    undo.Create( "E2 Spawned Wire Gate" )
    undo.AddEntity( ent )
    undo.SetPlayer( ply )
    undo.Finish()
end

local function convertTblToVec( tbl )
    return Vector( tbl[1], tbl[2], tbl[3] )
end

local function convertTblToAng( tbl )
    return Angle( tbl[1], tbl[2], tbl[3] )
end

-- Fix booleans

e2function entity gateSpawn( string action, string model, vector pos, angle ang, number nocollide, number frozen )
    local ent = WireLib.MakeWireGate( self.player, convertTblToVec( pos ), convertTblToAng( ang ), model, action, nocollide, frozen )
    addGateUndo( ent, self.player )

    return ent
end

e2function entity gateSpawn( string action, vector pos, angle ang, number nocollide, number frozen )
    local ent = WireLib.MakeWireGate( self.player, convertTblToVec( pos ), convertTblToAng( ang ), DEFAULT_GATE_MODEL, action, nocollide, frozen )
    addGateUndo( ent, self.player )
end

e2function entity gateSpawn( string action, vector pos, angle ang, number frozen )
    local ent = WireLib.MakeWireGate( self.player, convertTblToVec( pos ), convertTblToAng( ang ), DEFAULT_GATE_MODEL, action, true, frozen )
    addGateUndo( ent, self.player )

    return ent
end

e2function entity gateSpawn( string action, vector pos, angle ang )
    local ent = WireLib.MakeWireGate( self.player, convertTblToVec( pos ), convertTblToAng( ang ), DEFAULT_GATE_MODEL, action, true, true )
    addGateUndo( ent, self.player )

    return ent
end

e2function entity gateSpawn( string action, vector pos )
    local ent = WireLib.MakeWireGate( self.player, convertTblToVec( pos ), Angle( 0, 0, 0 ), DEFAULT_GATE_MODEL, action, true, true )
    addGateUndo( ent, self.player )

    return ent
end
