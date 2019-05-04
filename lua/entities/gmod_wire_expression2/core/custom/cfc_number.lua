E2Lib.RegisterExtension( "cfc_e2_lib", true )

__e2setcost(3)

e2function vector2 number:plusMinus(number otherNum)
    local firstNum = this
    return {
            firstNum + otherNum,
            firstNum - otherNum
    }
end
