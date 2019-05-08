E2Lib.RegisterExtension( "cfc_e2_lib", true )

__e2setcost(1)

e2function vector2 number:plusMinus(number otherNum)
    return {
            this + otherNum,
            this - otherNum
    }
end

e2function vector2 plusMinus(number firstNum, number otherNum)
    return {
            firstNum + otherNum,
            firstNum - otherNum
    }
end
