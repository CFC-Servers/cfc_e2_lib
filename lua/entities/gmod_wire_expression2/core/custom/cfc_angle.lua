E2Lib.RegisterExtension( "cfc_e2_lib", true )

e2function angle angle:reOrder(number pitchLoc, number yawLoc, number rollLoc)
    return {this[pitchLoc],this[yawLoc],this[rollLoc]}
end
