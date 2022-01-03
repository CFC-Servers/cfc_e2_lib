CFCE2Lib.RegisterExtension( "cfc_e2_lib", true )

local DEFAULT_GATE_MODEL = "models/jaanus/wiretool/wiretool_gate.mdl"

e2function string entity:getGateName()
    return this.WireDebugName or ""
end

-- gateSpawn and optional arguments
e2function entity gateSpawn( string type, string model, vector pos, vector ang, number nocollide, number frozen )
    return WireLib.MakeWireGate( self.player, pos, ang, model, type, nocollide, frozen )
end

e2function entity gateSpawn( string type, vector pos, vector ang, number nocollide, number frozen )
    return WireLib.MakeWireGate( self.player, pos, ang, DEFAULT_GATE_MODEL, type, nocollide, frozen )
end

e2function entity gateSpawn( string type, vector pos, vector ang, number frozen )
    return WireLib.MakeWireGate( self.player, pos, ang, DEFAULT_GATE_MODEL, type, true, frozen )
end

e2function entity gateSpawn( string type, vector pos, vector ang )
    return WireLib.MakeWireGate( self.player, pos, ang, DEFAULT_GATE_MODEL, type, true, true )
end

e2function entity gateSpawn( string type, vector pos )
    return WireLib.MakeWireGate( self.player, pos, Vector( 0, 0, 0 ), DEFAULT_GATE_MODEL, type, true, true )
end
