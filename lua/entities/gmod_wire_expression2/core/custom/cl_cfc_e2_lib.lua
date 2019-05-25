-- PvP Functions
E2Helper.Descriptions["playerIsInPvp(e:)"]     = "Returns 1 if a player is in Pvp, and 0 otherwise."
E2Helper.Descriptions["playerIsInBuild(e:)"]   = "Returns 1 if a player is in build, and 0 otherwise."
E2Helper.Descriptions["getPvpStatus(e:)"]      = "Returns \"pvp\" if a player is in Pvp, and \"build\" if they are in build. If a player is invalid, or their status is unknown, an empty string is returned."
E2Helper.Descriptions["getPvpers()"]           = "Returns a table of all players currently in Pvp."
E2Helper.Descriptions["getBuilders()"]         = "Returns a table of all players currently in Build."

-- Faction Functions
E2Helper.Descriptions["getFactionID(e:)"]      = "Returns a string of the player's faction ID. '0' if no faction, '' if invalid entity."
E2Helper.Descriptions["getFactionRank(e:)"]    = "Returns a string of the player's rank or ''."
E2Helper.Descriptions["isInFaction(e:)"]       = "Returns 1 if player is in faction, 0 otherwise."

-- Ping Functions
E2Helper.Descriptions["averagePing()"]         = "Returns a floating-point number representing the average ping of players in the server."
E2Helper.Descriptions["minPing()"]             = "Returns a floating-point number representing the lowest ping of all players in the server."
E2Helper.Descriptions["maxPing()"]             = "Returns a floating-point number representing the highest ping of all players in the server."

-- Loss Functions
E2Helper.Descriptions["averageLoss()"]         = "Returns a floating-point number representing the average packet loss of players in the server."
E2Helper.Descriptions["minLoss()"]             = "Returns a floating-point number representing the lowest packet loss of all players in the server."
E2Helper.Descriptions["maxLoss()"]             = "Returns a floating-point number representing the highest packet loss of all players in the server."

-- String Functions
E2Helper.Descriptions["startsWith(s:s)"]       = "Returns 1 if the string on which it was called starts with start, and 0 otherwise."
E2Helper.Descriptions["isNumber(s:)"]          = "Returns 1 if string is a number, 0 otherwise."
E2Helper.Descriptions["isLetters(s:)"]         = "Returns 1 if string provided is letters and spaces, 0 otherwise."
E2Helper.Descriptions["hasNumber(s:)"]         = "Returns 1 if string contains numbers, 0 otherwise."
E2Helper.Descriptions["hasLetter(s:)"]         = "Returns 1 if string has letters, 0 otherwise."
E2Helper.Descriptions["isUpper(s:)"]           = "Returns 1 if string is uppercase, 0 otherwise."
E2Helper.Descriptions["isLower(s:)"]           = "Returns 1 if string is lowercase, 0 otherwise."

-- Array Functions
E2Helper.Descriptions["shuffled(r:)"]          = "Returns a shuffled array."
E2Helper.Descriptions["difference(r:r)"]       = "Returns an array filled with the differing elements between the calling and argument arrays."
E2Helper.Descriptions["intersection(r:r)"]     = "Returns an array filled with the similar elements between the calling and argument arrays."
E2Helper.Descriptions["reversed(r:)"]          = "Returns a reversed array."
E2Helper.Descriptions["sub(r:nn)"]             = "Returns an array representing the subset between indexes n1 and n2, inclusively."
E2Helper.Descriptions["sub(r:n)"]              = "Returns an array representing the subset between index n and the end of the array, inclusively."
E2Helper.Descriptions["indexOf(r:e)"]          = "Returns the first index at which the value is stored in the array, and 0 if it was not found."
E2Helper.Descriptions["indexOf(r:n)"]          = "Returns the first index at which the value is stored in the array, and 0 if it was not found."
E2Helper.Descriptions["indexOf(r:s)"]          = "Returns the first index at which the value is stored in the array, and 0 if it was not found."
E2Helper.Descriptions["indexOf(r:a)"]          = "Returns the first index at which the value is stored in the array, and 0 if it was not found."
E2Helper.Descriptions["indexOf(r:v)"]          = "Returns the first index at which the value is stored in the array, and 0 if it was not found."
E2Helper.Descriptions["firstEntity(r:)"]       = "Returns the entity at the first index of the array."
E2Helper.Descriptions["firstString(r:)"]       = "Returns the string at the first index of the array."
E2Helper.Descriptions["firstNumber(r:)"]       = "Returns the number at the first index of the array."
E2Helper.Descriptions["firstVector(r:)"]       = "Returns the vector at the first index of the array."
E2Helper.Descriptions["firstVector2(r:)"]      = "Returns the vector2 at the first index of the array."
E2Helper.Descriptions["firstVector4(r:)"]      = "Returns the vector4 at the first index of the array."
E2Helper.Descriptions["firstAngle(r:)"]        = "Returns the angle at the first index of the array."
E2Helper.Descriptions["firstRanger(r:)"]       = "Returns the ranger at the first index of the array."
E2Helper.Descriptions["firstBone(r:)"]         = "Returns the bone at the first index of the array."
E2Helper.Descriptions["firstMatrix2(r:)"]      = "Returns the matrix2 at the first index of the array."
E2Helper.Descriptions["firstMatrix(r:)"]       = "Returns the matrix at the first index of the array."
E2Helper.Descriptions["firstMatrix4(r:)"]      = "Returns the matrix4 at the first index of the array."
E2Helper.Descriptions["firstWirelink(r:)"]     = "Returns the wirelink at the first index of the array."
E2Helper.Descriptions["firstComplex(r:)"]      = "Returns the complex at the first index of the array."
E2Helper.Descriptions["lastEntity(r:)"]        = "Returns the entity at the last index of the array."
E2Helper.Descriptions["lastString(r:)"]        = "Returns the string at the last index of the array."
E2Helper.Descriptions["lastNumber(r:)"]        = "Returns the number at the last index of the array."
E2Helper.Descriptions["lastVector(r:)"]        = "Returns the vector at the last index of the array."
E2Helper.Descriptions["lastVector2(r:)"]       = "Returns the vector2 at the last index of the array."
E2Helper.Descriptions["lastVector4(r:)"]       = "Returns the vector4 at the last index of the array."
E2Helper.Descriptions["lastAngle(r:)"]         = "Returns the angle at the last index of the array."
E2Helper.Descriptions["lastRanger(r:)"]        = "Returns the ranger at the last index of the array."
E2Helper.Descriptions["lastBone(r:)"]          = "Returns the bone at the last index of the array."
E2Helper.Descriptions["lastMatrix2(r:)"]       = "Returns the matrix2 at the last index of the array."
E2Helper.Descriptions["lastMatrix(r:)"]        = "Returns the matrix at the last index of the array."
E2Helper.Descriptions["lastMatrix4(r:)"]       = "Returns the matrix4 at the last index of the array."
E2Helper.Descriptions["lastWirelink(r:)"]      = "Returns the wirelink at the last index of the array."
E2Helper.Descriptions["lastComplex(r:)"]       = "Returns the complex at the last index of the array."
lastComplex

-- Vehicle Functions
E2Helper.Descriptions["ejectPodTo(e:v)"]       = "Ejects driver of seat to desired location."

-- Table Functions
E2Helper.Descriptions["firstEntity(t:)"]       = "Returns the entity at the first index of the ordered table (numbered indexes)."
E2Helper.Descriptions["firstString(t:)"]       = "Returns the string at the first index of the ordered table (numbered indexes)."
E2Helper.Descriptions["firstNumber(t:)"]       = "Returns the number at the first index of the ordered table (numbered indexes)."
E2Helper.Descriptions["firstVector(t:)"]       = "Returns the vector at the first index of the ordered table (numbered indexes)."
E2Helper.Descriptions["firstVector2(t:)"]      = "Returns the vector2 at the first index of the ordered table (numbered indexes)."
E2Helper.Descriptions["firstVector4(t:)"]      = "Returns the vector4 at the first index of the ordered table (numbered indexes)."
E2Helper.Descriptions["firstAngle(t:)"]        = "Returns the angle at the first index of the ordered table (numbered indexes)."
E2Helper.Descriptions["firstRanger(t:)"]       = "Returns the ranger at the first index of the ordered table (numbered indexes)."
E2Helper.Descriptions["firstBone(t:)"]         = "Returns the bone at the first index of the ordered table (numbered indexes)."
E2Helper.Descriptions["firstMatrix2(t:)"]      = "Returns the matrix2 at the first index of the ordered table (numbered indexes)."
E2Helper.Descriptions["firstMatrix(t:)"]       = "Returns the matrix at the first index of the ordered table (numbered indexes)."
E2Helper.Descriptions["firstMatrix4(t:)"]      = "Returns the matrix4 at the first index of the ordered table (numbered indexes)."
E2Helper.Descriptions["firstWirelink(t:)"]     = "Returns the wirelink at the first index of the ordered table (numbered indexes)."
E2Helper.Descriptions["firstComplex(t:)"]      = "Returns the complex at the first index of the ordered table (numbered indexes)."
E2Helper.Descriptions["lastEntity(t:)"]        = "Returns the entity at the last index of the ordered table (numbered indexes)."
E2Helper.Descriptions["lastString(t:)"]        = "Returns the string at the last index of the ordered table (numbered indexes)."
E2Helper.Descriptions["lastNumber(t:)"]        = "Returns the number at the last index of the ordered table (numbered indexes)."
E2Helper.Descriptions["lastVector(t:)"]        = "Returns the vector at the last index of the ordered table (numbered indexes)."
E2Helper.Descriptions["lastVector2(t:)"]       = "Returns the vector2 at the last index of the ordered table (numbered indexes)."
E2Helper.Descriptions["lastVector4(t:)"]       = "Returns the vector4 at the last index of the ordered table (numbered indexes)."
E2Helper.Descriptions["lastAngle(t:)"]         = "Returns the angle at the last index of the ordered table (numbered indexes)."
E2Helper.Descriptions["lastRanger(t:)"]        = "Returns the ranger at the last index of the ordered table (numbered indexes)."
E2Helper.Descriptions["lastBone(t:)"]          = "Returns the bone at the last index of the ordered table (numbered indexes)."
E2Helper.Descriptions["lastMatrix2(t:)"]       = "Returns the matrix2 at the last index of the ordered table (numbered indexes)."
E2Helper.Descriptions["lastMatrix(t:)"]        = "Returns the matrix at the last index of the ordered table (numbered indexes)."
E2Helper.Descriptions["lastMatrix4(t:)"]       = "Returns the matrix4 at the last index of the ordered table (numbered indexes)."
E2Helper.Descriptions["lastWirelink(t:)"]      = "Returns the wirelink at the last index of the ordered table (numbered indexes)."
E2Helper.Descriptions["lastComplex(t:)"]       = "Returns the complex at the last index of the ordered table (numbered indexes)."
