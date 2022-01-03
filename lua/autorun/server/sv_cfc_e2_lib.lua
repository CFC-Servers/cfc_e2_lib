CFCE2Lib = {}

function CFCE2Lib.RegisterExtension( name, default, description, warning )
    name = name:Trim():lower()

    local extensions = E2Lib.GetExtensions()
    if not table.HasValue( extensions, name ) then
        return E2Lib.RegisterExtension( name, default, description, warning )
    end

    local status = E2Lib.GetExtensionStatus( name )
    assert( status, "EXTENSION_DISABLED" )
end
