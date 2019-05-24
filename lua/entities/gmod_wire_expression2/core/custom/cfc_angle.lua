E2Lib.RegisterExtension( "cfc_e2_lib", true )

e2function angle angle:reOrder(number pitchLoc, number yawLoc, number rollLoc)
    local angs = {this[1],this[2],this[3]}
    local locs = {pitchLoc,yawLoc,rollLoc}
    local wantedAngs = angs

    for looplocat = 1, 3, 1 do --loop through the inputs
        local num = locs[looplocat] --store the current input's number
        for pitchYawRoll = 1, 3, 1 do --loop through pitch yaw and roll
            if (pitchYawRoll == num) then -- if the current input's number is equal to pitch (1) yaw(2) roll(3)
                wantedAngs[pitchYawRoll] = angs[looplocat] --store the current angle part ( pitch yaw or roll) into the wantedAngs output.
            end
        end
    end
    return wantedAngs
end
