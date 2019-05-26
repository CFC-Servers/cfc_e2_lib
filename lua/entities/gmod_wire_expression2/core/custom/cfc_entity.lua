CFCE2Lib.RegisterExtension( "cfc_e2_lib", true )

-- E2 Library Includes
local clamp   = E2Lib.clampPos

--Player Entities
e2function number entity:playerIsInPvp()
    if not IsValid(this) or not this:IsPlayer() then return 0 end
    if this:GetNWBool( "CFC_PvP_Mode", false ) == true then return 1 end

    return 0
end

e2function number entity:playerIsInBuild()
    if not IsValid(this) or not this:IsPlayer() then return 0 end
    if this:GetNWBool( "CFC_PvP_Mode", false ) == false then return 1 end

    return 0
end

e2function string entity:getPvpStatus()
    if not IsValid(this) or not this:IsPlayer() then return "" end
    if this:GetNWBool( "CFC_PvP_Mode", false ) == true then return "pvp" end

    return "build"
end

e2function string entity:getFactionID()
    if not IsValid(this) or not this:IsPlayer() then return "" end
    return this:GetFactionID()
end

e2function string entity:getFactionRank()
    if not IsValid(this) or not this:IsPlayer() then return "" end
    return this:GetFactionRank()
end

e2function number entity:isInFaction()
    if not IsValid(this) or not this:IsPlayer() then return 0 end
    return this:IsInFaction()
end

-- Vehicle Entities
e2function void entity:ejectPodTo(vector pos)
    local clampedPos = clamp(pos)

    if not IsValid(this) or not this:IsVehicle() then return end
    if not this:CPPIGetOwner() == self.player then return end

    local driver = this:GetDriver()
    if not IsValid(driver) or not driver:IsPlayer() then return end

    driver:ExitVehicle()
    driver:SetPos(clampedPos)
end

e2function void fadeDoor(entity ent , number state , string theSoundOn, string theSoundOff, number theTransParencyOn, number theTransParencyOff , string theMaterialOn , string theMaterialOff, number volume)
    if !IsValid(ent) then return end
    if !isOwner(self, ent) then return end
    local MaxDuration = GetConVar("MaxFadingSoundDuration"):GetFloat()
    local soundOn, soundOff, materialOn, materialOff = theSoundOn,theSoundOff,theMaterialOn,theMaterialOff
    if SoundDuration( theSoundOn ) >= MaxDuration then soundOn = "" end-- we dont want them spamming long sounds, do we?
    if SoundDuration( theSoundOff ) >= MaxDuration then soundOff = "" end-- we dont want them spamming long sounds, do we?
    if theMaterialOn == "" then materialOn = ent:GetMaterial() end
    if theMaterialOff == "" then materialOff = ent:GetMaterial() end
    local entCol = ent:GetColor()
    if state != 0 then
        if(ent:GetCollisionGroup() == 0) then sound.Play( soundOn , ent:GetPos() , 60 , 100 , volume / 100 ) end
        ent:SetMaterial( materialOn )
        WireLib.SetColor(ent, Color(entCol.r,entCol.b,entCol.g,theTransParencyOn) )
        ent:SetCollisionGroup( COLLISION_GROUP_WORLD )
    else
        if(ent:GetCollisionGroup() == 20) then sound.Play( soundOff , ent:GetPos() , 60 , 100 , volume / 100 ) end
        ent:SetMaterial( materialOff )
        WireLib.SetColor(ent, Color(entCol.r,entCol.b,entCol.g,theTransParencyOff) )
        ent:SetCollisionGroup( COLLISION_GROUP_NONE )
    end
end --shoutout to boxterot for the idea.

e2function void fadeDoor(array entities , number state , string theSoundOn, string theSoundOff, number theTransParencyOn, number theTransParencyOff, string theMaterialOn , string theMaterialOff, number volume, number playAll)
    local MaxDuration = GetConVar("MaxFadingSoundDuration"):GetFloat()
    local soundOn, soundOff, materialOn, materialOff = theSoundOn,theSoundOff,theMaterialOn,theMaterialOff
    if SoundDuration( theSoundOn ) >= MaxDuration then soundOn = "" end-- we dont want them spamming long sounds, do we?
    if SoundDuration( theSoundOff ) >= MaxDuration then soundOff = "" end-- we dont want them spamming long sounds, do we?
    for _, ent in pairs( entities ) do
        if !IsValid(ent) then return end
        if !isOwner(self, ent) then return end
        if theMaterialOn == "" then materialOn = ent:GetMaterial() end
        if theMaterialOff == "" then materialOff = ent:GetMaterial() end
        local entCol = ent:GetColor()
        if state != 0 then
            if playAll != 0 then
                if (ent:GetCollisionGroup() == 0) then sound.Play( soundOn , ent:GetPos() , 60 , 100 , volume / 100 ) end
            else
                if (ent:GetCollisionGroup() == 0) then sound.Play( soundOn , entities[1]:GetPos() , 60 , 100 , volume / 100 ) end
            end
            ent:SetMaterial( materialOn )
            WireLib.SetColor(ent, Color(entCol.r,entCol.b,entCol.g,theTransParencyOn) )
            ent:SetCollisionGroup( COLLISION_GROUP_WORLD )
        else
            if playAll != 0 then
                if (ent:GetCollisionGroup() == 20) then sound.Play( soundOff , ent:GetPos() , 60 , 100 , volume / 100 ) end
            else
                if (ent:GetCollisionGroup() == 20) then sound.Play( soundOff , entities[1]:GetPos() , 60 , 100 , volume / 100 ) end
            end
            ent:SetMaterial( materialOff )
            WireLib.SetColor(ent, Color(entCol.r,entCol.b,entCol.g,theTransParencyOff) )
            ent:SetCollisionGroup( COLLISION_GROUP_NONE )
        end
    end
end --shoutout to boxterot for the idea.

e2function void fadeDoor(entity ent , number state)
    if !IsValid(ent) then return end
    if !isOwner(self, ent) then return end
    if state != 0 then
        ent:SetCollisionGroup( COLLISION_GROUP_WORLD )
    else
        ent:SetCollisionGroup( COLLISION_GROUP_NONE )
    end
end --shoutout to boxterot for the idea.

e2function void fadeDoor(array entities , number state)
    for _, ent in pairs( entities ) do
        if !IsValid(ent) then return end
        if !isOwner(self, ent) then return end
        if state != 0 then
            ent:SetCollisionGroup( COLLISION_GROUP_WORLD )
        else
            ent:SetCollisionGroup( COLLISION_GROUP_NONE )
        end
    end
end --shoutout to boxterot for the idea.

e2function void fadeDoor(entity ent , number state, number theTransParencyOn, number theTransParencyOff, string theMaterialOn , string theMaterialOff)
    if !IsValid(ent) then return end
    if !isOwner(self, ent) then return end
    local materialOn, materialOff = theMaterialOn,theMaterialOff
    if theMaterialOn == "" then materialOn = ent:GetMaterial() end
    if theMaterialOff == "" then materialOff = ent:GetMaterial() end
    local entCol = ent:GetColor()
    if state != 0 then
        ent:SetMaterial( materialOn )
        WireLib.SetColor(ent, Color(entCol.r,entCol.b,entCol.g,theTransParencyOn) )
        ent:SetCollisionGroup( COLLISION_GROUP_WORLD )
    else
        ent:SetMaterial( materialOff )
        WireLib.SetColor(ent, Color(entCol.r,entCol.b,entCol.g,theTransParencyOff) )
        ent:SetCollisionGroup( COLLISION_GROUP_NONE )
    end
end --shoutout to boxterot for the idea.

e2function void fadeDoor(array entities , number state , number theTransParencyOn, number theTransParencyOff, string theMaterialOn , string theMaterialOff)
    local MaxDuration = GetConVar("MaxFadingSoundDuration"):GetFloat()
    local materialOn, materialOff = theMaterialOn,theMaterialOff
    for _, ent in pairs( entities ) do
        if !IsValid(ent) then return end
        if !isOwner(self, ent) then return end
        if theMaterialOn == "" then materialOn = ent:GetMaterial() end
        if theMaterialOff == "" then materialOff = ent:GetMaterial() end
        local entCol = ent:GetColor()
        if state != 0 then
            ent:SetMaterial( materialOn )
            WireLib.SetColor(ent, Color(entCol.r,entCol.b,entCol.g,theTransParencyOn) )
            ent:SetCollisionGroup( COLLISION_GROUP_WORLD )
        else
            ent:SetMaterial( materialOff )
            WireLib.SetColor(ent, Color(entCol.r,entCol.b,entCol.g,theTransParencyOff) )
            ent:SetCollisionGroup( COLLISION_GROUP_NONE )
        end
    end
end --shoutout to boxterot for the idea.
e2function void fadeDoor(entity ent , number state , string theSoundOn, string theSoundOff, number theTransParencyOn, number theTransParencyOff, number volume)
    if !IsValid(ent) then return end
    if !isOwner(self, ent) then return end
    local MaxDuration = GetConVar("MaxFadingSoundDuration"):GetFloat()
    local soundOn, soundOff  = theSoundOn,theSoundOff
    if SoundDuration( theSoundOn ) >= MaxDuration then soundOn = "" end-- we dont want them spamming long sounds, do we?
    if SoundDuration( theSoundOff ) >= MaxDuration then soundOff = "" end-- we dont want them spamming long sounds, do we?
    local entCol = ent:GetColor()
    if state != 0 then
        if(ent:GetCollisionGroup() == 0) then sound.Play( soundOn , ent:GetPos() , 60 , 100 , volume / 100 ) end
        WireLib.SetColor(ent, Color(entCol.r,entCol.b,entCol.g,theTransParencyOn) )
        ent:SetCollisionGroup( COLLISION_GROUP_WORLD )
    else
        if(ent:GetCollisionGroup() == 20) then sound.Play( soundOff , ent:GetPos() , 60 , 100 , volume / 100 ) end
        WireLib.SetColor(ent, Color(entCol.r,entCol.b,entCol.g,theTransParencyOff) )
        ent:SetCollisionGroup( COLLISION_GROUP_NONE )
    end
end --shoutout to boxterot for the idea.

e2function void fadeDoor(array entities , number state , string theSoundOn, string theSoundOff, number theTransParencyOn, number theTransParencyOff, number volume, number playAll)
    local MaxDuration = GetConVar("MaxFadingSoundDuration"):GetFloat()
    local soundOn, soundOff = theSoundOn,theSoundOff
    if SoundDuration( theSoundOn ) >= MaxDuration then soundOn = "" end-- we dont want them spamming long sounds, do we?
    if SoundDuration( theSoundOff ) >= MaxDuration then soundOff = "" end-- we dont want them spamming long sounds, do we?
    for _, ent in pairs( entities ) do
        if !IsValid(ent) then return end
        if !isOwner(self, ent) then return end
        local entCol = ent:GetColor()
        if state != 0 then
            if playAll != 0 then
                if (ent:GetCollisionGroup() == 0) then sound.Play( soundOn , ent:GetPos() , 60 , 100 , volume / 100 ) end
            else
                if (ent:GetCollisionGroup() == 0) then sound.Play( soundOn , entities[1]:GetPos() , 60 , 100 , volume / 100 ) end
            end
            WireLib.SetColor(ent, Color(entCol.r,entCol.b,entCol.g,theTransParencyOn) )
            ent:SetCollisionGroup( COLLISION_GROUP_WORLD )
        else
            if playAll != 0 then
                if (ent:GetCollisionGroup() == 20) then sound.Play( soundOff , ent:GetPos() , 60 , 100 , volume / 100 ) end
            else
                if (ent:GetCollisionGroup() == 20) then sound.Play( soundOff , entities[1]:GetPos() , 60 , 100 , volume / 100 ) end
            end
            WireLib.SetColor(ent, Color(entCol.r,entCol.b,entCol.g,theTransParencyOff) )
            ent:SetCollisionGroup( COLLISION_GROUP_NONE )
        end
    end
end --shoutout to boxterot for the idea.

e2function void fadeDoor(entity ent , number state, number theTransParencyOn, number theTransParencyOff)
    if !IsValid(ent) then return end
    if !isOwner(self, ent) then return end
    local entCol = ent:GetColor()
    if state != 0 then
        WireLib.SetColor(ent, Color(entCol.r,entCol.b,entCol.g,theTransParencyOn) )
        ent:SetCollisionGroup( COLLISION_GROUP_WORLD )
    else
        WireLib.SetColor(ent, Color(entCol.r,entCol.b,entCol.g,theTransParencyOff) )
        ent:SetCollisionGroup( COLLISION_GROUP_NONE )
    end
end --shoutout to boxterot for the idea.

e2function void fadeDoor(array entities , number state, number theTransParencyOn, number theTransParencyOff)
    for _, ent in pairs( entities ) do
        if !IsValid(ent) then return end
        if !isOwner(self, ent) then return end
        local entCol = ent:GetColor()
        if state != 0 then
            WireLib.SetColor(ent, Color(entCol.r,entCol.b,entCol.g,theTransParencyOn) )
            ent:SetCollisionGroup( COLLISION_GROUP_WORLD )
        else
            WireLib.SetColor(ent, Color(entCol.r,entCol.b,entCol.g,theTransParencyOff) )
            ent:SetCollisionGroup( COLLISION_GROUP_NONE )
        end
    end
end --shoutout to boxterot for the idea.
