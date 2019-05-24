E2Lib.RegisterExtension( "cfc_e2_lib", true )

e2function vector2 plusMinus(number firstNum, number otherNum)
    return {
            firstNum + otherNum,
            firstNum - otherNum
    }
end
