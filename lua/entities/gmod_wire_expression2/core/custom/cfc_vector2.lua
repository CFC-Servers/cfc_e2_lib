E2Lib.RegisterExtension( "cfc_e2_lib", true )

e2function vector2 vector2:reOrder(number xLoc, number yLoc)
    local values = {this[1],this[2]}
    local locs = {xLoc,yLoc}
    local wantedValues = values

    for looplocat = 1, 2, 1 do --loop through the inputs
        local num = locs[looplocat] --store the current input's number
        for xY = 1, 2, 1 do --loop through x y and z
            if (xY == num) then -- if the current input's number is equal to x (1) y(2)
                wantedValues[xY] = values[looplocat] --store the current value part ( x or y ) into the wantedValues output.
            end
        end
    end
    return wantedValues
end
