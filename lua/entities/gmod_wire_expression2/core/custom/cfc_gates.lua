CFCE2Lib.RegisterExtension( "cfc_e2_lib", true )

e2function string entity:getGateName()
    if not IsValid( this ) or not baseclass.Get( this ) then return "" end
    return this.WireDebugName
end

e2function entity gateSpawn( string type, string model, vector pos, vector ang, nocollide, frozen )
    local gate = WireLib.MakeWireGate( self.player, pos, ang, model, action, nocollide, frozen )
    return gate
end
