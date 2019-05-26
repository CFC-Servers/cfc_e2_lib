CFCE2Lib.RegisterExtension( "cfc_e2_lib", true )

local function threedtoindex( vector , maxindexvector )
    return ( vector[3] * ( (maxindexvector[1] + 1) * ( maxindexvector[2] + 1 ) ) + ( vector[2] * (maxindexvector[1] + 1) + vector[1] ) ) -- https://www.desmos.com/calculator/xto54ai4zu
end

e2function number toIndex3D(vector vec, vector maxWidthandHeightandDepth)
    return threedtoindex( vec , maxWidthandHeightandDepth )
end
