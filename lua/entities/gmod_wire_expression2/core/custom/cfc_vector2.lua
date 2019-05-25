E2Lib.RegisterExtension( "cfc_e2_lib", true )

e2function vector2 vector2:reOrder(number xLoc, number yLoc)
    return {this[xLoc],this[yLoc]}
end
