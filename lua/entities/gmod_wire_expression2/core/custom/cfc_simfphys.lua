if not istable( simfphys ) then return end

e2function number entity:getSimfphysHorsepower()
    if not IsValid( this ) or not this:IsVehicle() then return 0 end
    
    local data = simfphys.BuildVehicleInfo( this )
    
    if not data then return 0 end
    
    local horsepower = data["horsepower"] or 0

    return horsepower
end
