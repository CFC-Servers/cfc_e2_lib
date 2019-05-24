E2Lib.RegisterExtension( "cfc_e2_lib", true )

e2function vector4 vector4:reOrder(number xLoc, number yLoc, number zLoc, number wLoc)
    local values = {this[1],this[2],this[3],this[4]}
    local locs = {xLoc,yLoc,zLoc,wLoc}
    local wantedValues = values

    for looplocat = 1, 4, 1 do --loop through the inputs
        local num = locs[looplocat] --store the current input's number
        for xYZW = 1, 4, 1 do --loop through x y z and w
            if (xYZW == num) then -- if the current input's number is equal to x (1) y(2) z(3) w(4)
                wantedValues[xYZW] = values[looplocat] --store the current angle part ( x y z or w) into the wantedValues output.
            end
        end
    end
    return wantedValues
end
