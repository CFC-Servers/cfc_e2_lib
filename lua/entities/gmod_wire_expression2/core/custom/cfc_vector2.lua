CFCE2Lib.RegisterExtension( "cfc_e2_lib", true )

local function twodtoindex( vector2 , maxindexvector2 )
    return vector2[2] * (maxindexvector2[1] + 1) + vector2[1]
end

e2function number toIndex2D(vector2 vec, vector2 maxWidthandHeight)
    return twodtoindex( vec , maxWidthandHeight )
end
