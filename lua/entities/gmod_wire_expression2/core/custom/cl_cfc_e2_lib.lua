-- PvP Functions
  E2Helper.Descriptions["playerIsInPvp(e:)"]        = "Returns 1 if a player is in Pvp, and 0 otherwise."
  E2Helper.Descriptions["playerIsInBuild(e:)"]      = "Returns 1 if a player is in build, and 0 otherwise."
  E2Helper.Descriptions["getPvpStatus(e:)"]         = "Returns \"pvp\" if a player is in Pvp, and \"build\" if they are in build. If a player is invalid, or their status is unknown, an empty string is returned."
  E2Helper.Descriptions["getPvpers()"]              = "Returns a table of all players currently in Pvp."
  E2Helper.Descriptions["getBuilders()"]            = "Returns a table of all players currently in Build."

-- Faction Functions
  E2Helper.Descriptions["getFactionID(e:)"]         = "Returns a string of the player's faction ID. '0' if no faction, '' if invalid entity."
  E2Helper.Descriptions["getFactionRank(e:)"]       = "Returns a string of the player's rank or ''."
  E2Helper.Descriptions["isInFaction(e:)"]          = "Returns 1 if player is in faction, 0 otherwise."

-- Ping Functions
  E2Helper.Descriptions["averagePing()"]            = "Returns a floating-point number representing the average ping of players in the server."
  E2Helper.Descriptions["minPing()"]                = "Returns a floating-point number representing the lowest ping of all players in the server."
  E2Helper.Descriptions["maxPing()"]                = "Returns a floating-point number representing the highest ping of all players in the server."

-- Loss Functions
  E2Helper.Descriptions["averageLoss()"]            = "Returns a floating-point number representing the average packet loss of players in the server."
  E2Helper.Descriptions["minLoss()"]                = "Returns a floating-point number representing the lowest packet loss of all players in the server."
  E2Helper.Descriptions["maxLoss()"]                = "Returns a floating-point number representing the highest packet loss of all players in the server."

-- String Functions
  E2Helper.Descriptions["startsWith(s:s)"]          = "Returns 1 if the string on which it was called starts with start, and 0 otherwise."
  E2Helper.Descriptions["isNumber(s:)"]             = "Returns 1 if string is a number, 0 otherwise."
  E2Helper.Descriptions["isLetters(s:)"]            = "Returns 1 if string provided is letters and spaces, 0 otherwise."
  E2Helper.Descriptions["hasNumber(s:)"]            = "Returns 1 if string contains numbers, 0 otherwise."
  E2Helper.Descriptions["hasLetter(s:)"]            = "Returns 1 if string has letters, 0 otherwise."
  E2Helper.Descriptions["isUpper(s:)"]              = "Returns 1 if string is uppercase, 0 otherwise."
  E2Helper.Descriptions["isLower(s:)"]              = "Returns 1 if string is lowercase, 0 otherwise."

-- Array Functions
  E2Helper.Descriptions["shuffled(r:)"]             = "Returns a shuffled array."
  E2Helper.Descriptions["difference(r:r)"]          = "Returns an array filled with the differing elements between the calling and argument arrays."
  E2Helper.Descriptions["intersection(r:r)"]        = "Returns an array filled with the similar elements between the calling and argument arrays."
  E2Helper.Descriptions["reversed(r:)"]             = "Returns a reversed array."
  E2Helper.Descriptions["sub(r:nn)"]                = "Returns an array representing the subset between indexes n1 and n2, inclusively."
  E2Helper.Descriptions["sub(r:n)"]                 = "Returns an array representing the subset between index n and the end of the array, inclusively."
  E2Helper.Descriptions["indexOf(r:e)"]             = "Returns the first index at which the value is stored in the array, and 0 if it was not found."
  E2Helper.Descriptions["indexOf(r:n)"]             = "Returns the first index at which the value is stored in the array, and 0 if it was not found."
  E2Helper.Descriptions["indexOf(r:s)"]             = "Returns the first index at which the value is stored in the array, and 0 if it was not found."
  E2Helper.Descriptions["indexOf(r:a)"]             = "Returns the first index at which the value is stored in the array, and 0 if it was not found."
  E2Helper.Descriptions["indexOf(r:v)"]             = "Returns the first index at which the value is stored in the array, and 0 if it was not found."

-- Vehicle Functions
  E2Helper.Descriptions["ejectPodTo(e:v)"]          = "Ejects driver of seat to desired location."


-- Number Functions
  E2Helper.Descriptions["plusMinus(n:n)"]           = "Returns a vector2 with the outcomes of subtracting and adding two numbers"
  E2Helper.Descriptions["plusMinus(n,n)"]           = "Returns a vector2 with the outcomes of subtracting and adding two numbers"


-- Vector 2 Functions
  E2Helper.Descriptions["exp(xv2,xv2)"]             = "Returns a vector2 with the outcome of raising the x of the first vector 2 to the x of the second and the same for y"
  E2Helper.Descriptions["isfinite(xv2)"]            = "Returns a vector2 with the results of testing if the x is finite and the y is finite"
  E2Helper.Descriptions["isinf(xv2)"]               = "Returns a vector2 with the results of testing if the x is infinite and the y is infinite"
  E2Helper.Descriptions["isnan(xv2)"]               = "Returns a vector2 with the results of testing both values in the vector 2 if they are nan"
  E2Helper.Descriptions["abs(xv2)"]                 = "Returns a vector2 with the absolute values of the inputted vector 2"
  E2Helper.Descriptions["int(xv2)"]                 = "Returns a vector2 with the results of rounding to the closest number to 0"
  E2Helper.Descriptions["frac(xv2)"]                = "Returns a vector2 with the fractional component of x and y"
  E2Helper.Descriptions["wrap(xv2,xv2)"]            = "Returns a vector2 wrapped to the limits of the second one"
  E2Helper.Descriptions["sqrt(xv2)"]                = "Returns a vector2 with the square root of x and y"
  E2Helper.Descriptions["cbrt(xv2)"]                = "Returns a vector2 with the cube root of x and y"
  E2Helper.Descriptions["root(xv2,n)"]              = "Returns a vector2 with the nth root of both x and y"
  E2Helper.Descriptions["toRad(xv2)"]               = "Returns a vector2 with the x and y values converted to radians"
  E2Helper.Descriptions["toDeg(xv2)"]               = "Returns a vector2 with the x and y values converted to degrees"
  E2Helper.Descriptions["acosvec2(xv2)"]            = "Returns a vector2 with the arccosine of x and the arccosine of y in degrees"
  E2Helper.Descriptions["asinvec2(xv2)"]            = "Returns a vector2 with the arcsine of x and the arcsine of y in degrees"
  E2Helper.Descriptions["atanvec2(xv2)"]            = "Returns a vector2 with the arctangent of x and the arctangent of y in degrees"
  E2Helper.Descriptions["acos(xv2)"]                = "Returns a number of the arccosine of x divided by the distance of the vector in degrees"
  E2Helper.Descriptions["asin(xv2)"]                = "Returns a number of the arcsine of y divided by the distance of the vector in degrees"
  E2Helper.Descriptions["atan(xv2)"]                = "Returns a number of the arctangent of y divided by x in degrees"
  E2Helper.Descriptions["cos(xv2)"]                 = "Returns a vector2 with the cosine of x and y. Inputted in degrees."
  E2Helper.Descriptions["sec(xv2)"]                 = "Returns a vector2 with the secant of x and y. Inputted in degrees."
  E2Helper.Descriptions["sin(xv2)"]                 = "Returns a vector2 with the sine of x and y. Inputted in degrees."
  E2Helper.Descriptions["csc(xv2)"]                 = "Returns a vector2 with the cosecant of x and y. Inputted in degrees."
  E2Helper.Descriptions["tan(xv2)"]                 = "Returns a vector2 with the tangent of x and y. Inputted in degrees."
  E2Helper.Descriptions["cot(xv2)"]                 = "Returns a vector2 with the cotangent of x and y. Inputted in degrees."
  E2Helper.Descriptions["rcos(xv2)"]                = "Returns a vector2 with the cosine of x and y. Inputted in radians"
  E2Helper.Descriptions["rsec(xv2)"]                = "Returns a vector2 with the secant of x and y. Inputted in radians"
  E2Helper.Descriptions["rsin(xv2)"]                = "Returns a vector2 with the sine of x and y. Inputted in radians."
  E2Helper.Descriptions["rcsc(xv2)"]                = "Returns a vector2 with the cosecant of x and y. Inputted in radians."
  E2Helper.Descriptions["rtan(xv2)"]                = "Returns a vector2 with the tangent of x and y. Inputted in radians."
  E2Helper.Descriptions["rcot(xv2)"]                = "Returns a vector2 with the cotangent of x and y. Inputted in radians."
  E2Helper.Descriptions["acosrvec2(xv2)"]           = "Returns a vector2 of the arccosine of x in radians and the arccosine of y in radians."
  E2Helper.Descriptions["asinrvec2(xv2)"]           = "Returns a vector2 of the arcsine of x in radians and the arcsine of y in radians."
  E2Helper.Descriptions["atanrvec2(xv2)"]           = "Returns a vector2 of the arctangent of x in radians and the arctangent of y in radians."
  E2Helper.Descriptions["acosr(xv2)"]               = "Returns a number of the arccosine of x over the distance of the vector in radians."
  E2Helper.Descriptions["asinr(xv2)"]               = "Returns a number of the arcsine of y over the distance of the vector in radians."
  E2Helper.Descriptions["atanr(xv2)"]               = "Returns a number of the arctangent of y over x in radians. "
  E2Helper.Descriptions["toStringV2(xv2)"]          = "Returns a vector2 with the string form of x and the string form of y"
  E2Helper.Descriptions["toStringV2(xv2:)"]         = "Returns a vector2 with the string form of x and the string form of y"

-- Geometry / Trigonometry
  E2Helper.Descriptions["polar2DtoGrid2DDeg(n,n)"]  = "Input a distance number and a number angle in degrees, and itll give you the vector 2 coords of the point at that angle and distance."
  E2Helper.Descriptions["polar2DtoGrid2DRad(n,n)"]  = "Input a distance number and a number angle in radians, and itll give you the vector 2 coords of the point at that angle and distance."
  E2Helper.Descriptions["polar3DtoGrid3DDeg(n,a)"]  = "Input a distance number and a 3d angle in degrees, and itll give you the vector coords of the point at that angle and distance."
  E2Helper.Descriptions["polar3DtoGrid3DRad(n,a)"]  = "Input a distance number and a 3d angle in degrees, and itll give you the vector coords of the point at that angle and distance."
