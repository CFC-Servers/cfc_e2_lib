E2Lib.RegisterExtension( "cfc_e2_lib", true )

__e2setcost(2)

e2function vector2 number:plusMinus(number otherNum)
    return {
            this + otherNum,
            this - otherNum
    }
end
