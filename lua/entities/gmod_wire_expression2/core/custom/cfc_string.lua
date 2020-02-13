E2Lib.RegisterExtension( "cfc_e2_lib", true )

local alphabet = "abcdefghijklmnopqrstuvwxyz"

e2function number string:startsWith(string start)
    if string.StartWith( this, start ) then return 1 end
    return 0
end

e2function number string:isNumber()
    -- This regex tests for only digits
    if tonumber( this ) then return 1 end
    return 0
end

e2function number string:isLetters()
    -- This regex tests for only letters (case insensitive) and spaces
    if string.find( this, "^[%a ]*$" ) then return 1 end
    return 0
end

e2function number string:hasNumber()
    -- This regex looks for existance of a digit
    if string.find( this, "%d" ) then return 1 end
    return 0
end

e2function number string:hasLetter()
    -- This regex looks for existance of a character
    if string.find( this, "%a" ) then return 1 end
    return 0
end

e2function number string:isUpper()
    if this == string.upper( this ) then return 1 end
    return 0
end

e2function number string:isLower()
    if this == string.lower( this ) then return 1 end
    return 0
end

e2function string alphabet()
    return alphabet
end
E2Lib.registerConstant( "_ALPHABET", alphabet )
