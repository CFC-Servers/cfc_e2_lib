E2Lib.RegisterExtension( "cfc_e2_lib", true )

__e2setcost(4) --arbitrary

local deg2rad = pi / 180
local rad2deg = 180 / pi

e2function vector2 polar2DtoGrid2DDeg(number distance, number ang)
    return {
            distance * cos(ang * deg2rad),
            distance * sin(ang * deg2rad)
    }
end

e2function vector2 polar2DtoGrid2DRad(number distance, number ang)
    return {
            distance * cos(ang),
            distance * sin(ang)
    }
end

e2function vector polar3DtoGrid3DDeg(number distance, angle ang)
    local inclination = angle[1] * deg2rad
    local azimuth = angle[2] * deg2rad
    return {
            distance * sin(inclination) * cos(azimuth),
            distance * sin(inclination) * sin(azimuth),
            distance * cos(inclination)
    }
end

e2function vector polar3DtoGrid3DRad(number distance, angle ang)
    return {
            distance * sin(angle[1]) * cos(angle[2]),
            distance * sin(angle[1]) * sin(angle[2]),
            distance * cos(angle[1])
    }
end
