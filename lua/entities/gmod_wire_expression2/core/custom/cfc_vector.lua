E2Lib.RegisterExtension( "cfc_e2_lib", true )

e2function vector vector:reOrder(number xLoc, number yLoc, number zLoc)
    local values = {this[1],this[2],this[3]}
    local locs = {xLoc,yLoc,zLoc}
    local wantedValues = values

    for looplocat = 1, 3, 1 do --loop through the inputs
        local num = locs[looplocat] --store the current input's number
        for xYZ = 1, 3, 1 do --loop through x y and z
            if (xYZ == num) then -- if the current input's number is equal to x (1) y(2) z(3)
                wantedValues[xYZ] = values[looplocat] --store the current angle part ( x y or z) into the wantedVecs output.
            end
        end
    end
    return wantedValues
end
