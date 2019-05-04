E2Lib.RegisterExtension( "cfc_e2_lib", true )

e2function array array:shuffled()
    local size = #this
    for i = size, 1, -1 do
        local rand = math.random( size )
        this[i], this[rand] = this[rand], this[i]
    end

    return this
end
