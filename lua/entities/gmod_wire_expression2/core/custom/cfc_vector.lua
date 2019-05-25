E2Lib.RegisterExtension( "cfc_e2_lib", true )

e2function vector vector:reOrder(number xLoc, number yLoc, number zLoc)
    return {this[xLoc],this[yLoc],this[zLoc]}
end
