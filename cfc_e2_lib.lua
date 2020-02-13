E2Lib.RegisterExtension( "cfc_e2_lib", true )

do
    local custom_functions_dir = "cfc_functions"

    local list = file.Find(custom_functions_dir .. "/*.lua", "LUA")
    for _, filename in pairs( list ) do
        local fullPath = custom_functions_dir .. "/" .. filename
        include( fullPath )
    end
end
