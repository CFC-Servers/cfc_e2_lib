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

-- Vehicle Functions
E2Helper.Descriptions["ejectPodTo(e:v)"]       = "Ejects driver of seat to desired location."

-- Enitity Functions
E2Helper.Descriptions["fadeDoor(en)"]          = "Fades the given entity. 1 to activate 0 to deactivate."
E2Helper.Descriptions["fadeDoor(ennn)"]        = "Fades the given entity, with the given transparency for each state. 1 to activate 0 to deactivate."
E2Helper.Descriptions["fadeDoor(ennnss)"]      = "Fades the given entity, with the given transparency for each state as well as the given material. 1 to activate 0 to deactivate."
E2Helper.Descriptions["fadeDoor(enssnnn)"]     = "Fades the given entity, with the given transparency for each state, as well as plays the given sound for each state. 1 to activate 0 to deactivate."
E2Helper.Descriptions["fadeDoor(enssnnssn)"]   = "Fades the given entity, with the given transparency for each state, plays the given sound, and uses the given materials. 1 to activate 0 to deactivate."
E2Helper.Descriptions["fadeDoor(rn)"]          = "Fades the given array of entities. 1 to activate 0 to deactivate."
E2Helper.Descriptions["fadeDoor(rnnn)"]        = "Fades the given array of entities, with the given transparency for each state. 1 to activate 0 to deactivate."
E2Helper.Descriptions["fadeDoor(rnnnss)"]      = "Fades the given array of entities, with the given transparency for each state as well as the given material. 1 to activate 0 to deactivate."
E2Helper.Descriptions["fadeDoor(rnssnnnn)"]    = "Fades the given array of entities, with the given transparency for each state, as well as plays the given sound for each state, as well as if to play the sound for all of the props or just the first one. 1 to activate 0 to deactivate."
E2Helper.Descriptions["fadeDoor(rnssnnssnn)"]  = "Fades the given array of entities, with the given transparency for each state, plays the given sound, and uses the given materials, as well as if to play them all or just the first one. 1 to activate 0 to deactivate."