CFCE2Lib.RegisterExtension( "cfc_e2_lib", true )

local DEFAULT_GATE_MODEL = "models/jaanus/wiretool/wiretool_gate.mdl"

e2function string entity:getGateName()
    return this.WireDebugName or ""
end

e2function string entity:getGateActionName()
    return GateActions[action] or ""
end

e2function string isValidGateAction( string action )
    local gateAction = GateActions[action]
    return gateAction ~= nil and gateAction or false
end

-- gateSpawn and optional arguments
e2function entity gateSpawn( string action, string model, vector pos, vector ang, number nocollide, number frozen )
    return WireLib.MakeWireGate( self.player, pos, ang, model, action, nocollide, frozen )
end

e2function entity gateSpawn( string action, vector pos, vector ang, number nocollide, number frozen )
    return WireLib.MakeWireGate( self.player, pos, ang, DEFAULT_GATE_MODEL, action, nocollide, frozen )
end

e2function entity gateSpawn( string action, vector pos, vector ang, number frozen )
    return WireLib.MakeWireGate( self.player, pos, ang, DEFAULT_GATE_MODEL, action, true, frozen )
end

e2function entity gateSpawn( string action, vector pos, vector ang )
    return WireLib.MakeWireGate( self.player, pos, ang, DEFAULT_GATE_MODEL, action, true, true )
end

e2function entity gateSpawn( string action, vector pos )
    return WireLib.MakeWireGate( self.player, pos, Vector( 0, 0, 0 ), DEFAULT_GATE_MODEL, action, true, true )
end
