E2Lib.RegisterExtension( "cfc_e2_lib", true )

e2function vector4 vector4:reOrder(number xLoc, number yLoc, number zLoc, number wLoc)
    return {this[xLoc],this[yLoc],this[zLoc],this[wLoc]}
end
