E2Lib.RegisterExtension( "cfc_e2_lib", true )

e2function vector vector:reOrder(number xLoc, number yLoc, number zLoc)
    local values = {this[1],this[2],this[3]}
    local locs = {xLoc,yLoc,zLoc}
    local wantedValues = values

    for xYZ = 1, 3, 1 do
        for loopVals = 1, 3, 1 do
            local value = values[loopVals]
            local valNum = locs[loopVals]
            if valNum == xYZ then
                wantedValues[xYZ] = value
            end
        end
    end
    return wantedValues
end
