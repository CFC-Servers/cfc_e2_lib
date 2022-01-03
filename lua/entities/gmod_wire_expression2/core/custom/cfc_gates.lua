CFCE2Lib.RegisterExtension( "cfc_e2_lib", true )

local DEFAULT_GATE_MODEL = "models/jaanus/wiretool/wiretool_gate.mdl"

e2function string entity:getGateName()
    return this.WireDebugName or ""
end


-- gateSpawn and optional arguments
e2function entity gateSpawn( string type, string model, vector pos, vector ang, number nocollide, number frozen )
    local gate = WireLib.MakeWireGate( self.player, pos, ang, model, type, nocollide, frozen )
    return gate
end

e2function entity gateSpawn( string type, vector pos, vector ang, number nocollide, number frozen )
    local gate = WireLib.MakeWireGate( self.player, pos, ang, DEFAULT_GATE_MODEL, type, nocollide, frozen )
    return gate
end

e2function entity gateSpawn( string type, vector pos, vector ang, number frozen )
    local gate = WireLib.MakeWireGate( self.player, pos, ang, DEFAULT_GATE_MODEL, type, true, frozen )
    return gate
end

e2function entity gateSpawn( string type, vector pos, vector ang )
    local gate = WireLib.MakeWireGate( self.player, pos, ang, DEFAULT_GATE_MODEL, type, true, true )
    return gate
end

e2function entity gateSpawn( string type, vector pos )
    local gate = WireLib.MakeWireGate( self.player, pos, Vector( 0, 0, 0 ), DEFAULT_GATE_MODEL, type, true, true )
    return gate
end
