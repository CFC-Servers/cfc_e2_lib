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

-- GC Functions
E2Helper.Descriptions["serverMemoryUsage()"]   = "Returns total kilobytes of memory currently in use by Lua on the server"

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
E2Helper.Descriptions["alphabet()"]            = "Returns the alphabet (a-z) as a lowercase string"

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
E2Helper.Descriptions["indexOf(r:v2)"]         = "Returns the first index at which the value is stored in the array, and 0 if it was not found."
E2Helper.Descriptions["indexOf(r:v4)"]         = "Returns the first index at which the value is stored in the array, and 0 if it was not found."

-- Vehicle Functions
E2Helper.Descriptions["ejectPodTo(e:v)"]       = "Ejects driver of seat to desired location."

-- Player Functions
E2Helper.Descriptions["getAlive()"]            = "Returns an array with all alive players."
E2Helper.Descriptions["getDead()"]             = "Returns an array with all dead players."

-- NPC functions
E2Helper.Descriptions["npcSetMaxHealth(e:n)"]          = "Sets an NPC's maximum health. Admin only."
E2Helper.Descriptions["npcSetHealth(e:n)"]             = "Sets an NPC's health. Admin only."
E2Helper.Descriptions["npcSetScale(e:n)"]              = "Sets the scale of an NPC. Admin only."
E2Helper.Descriptions["npcSetScale(e:nn)"]             = "Sets the scale of an NPC, in N2 seconds. Admin Only."
E2Helper.Descriptions["npcSetWeaponProficiency(e:n)"]  = "Sets the weapon proficiency of the NPC. Admin only."
E2Helper.Descriptions["npcSetDamageMultiplier(e:n)"]   = "Sets the damage multiplier for an NPC. Admin only."
E2Helper.Descriptions["npcSetGlobalSquad(e:s)"]        = "Sets the squad of an NPC. Admin only."
E2Helper.Descriptions["npcCreate(sv)"]                 = "Creates an npc of class S, at position V. Admin only."
E2Helper.Descriptions["npcCreate(svs)"]                = "Creates an npc of class S1, at position V, setting S2 to the key value 'model'. Admin only."
E2Helper.Descriptions["npcGetGlobalSquad(e:)"]         = "Returns an NPC's squad."
E2Helper.Descriptions["npcGetWeaponProficiency(e:)"]   = "Returns the weapon proficiency of the NPC."
E2Helper.Descriptions["npcGetDamageMultiplier(e:)"]    = "Returns the damage multiplier of the NPC"
E2Helper.Descriptions["npcCouldNotReach(e:e)"]         = "Returns 1 if the NPC marked ent2 as unreachable"

-- Wire Gate Functions
E2Helper.Description["getGateName(e:)"]             = "Returns the display name of a Wire Gate."
E2Helper.Description["gateSpawn(svvb)"]               = "Spawns a Wire Gate with name S, at Position V1, with Angles V2, B determines if it spawns frozen.