E2Lib.RegisterExtension( "cfc_e2_lib", true )

local naN = 0/0

e2function entity table:firstEntity()
    return this.n[ 1 ] or NULL
end
e2function string table:firstString()
    return this.n[ 1 ] or ""
end
e2function number table:firstNumber()
    return this.n[ 1 ] or naN
end
e2function vector table:firstVector()
    return this.n[ 1 ] or {naN,naN,naN}
end
e2function vector2 table:firstVector2()
    return this.n[ 1 ] or {naN,naN}
end
e2function vector4 table:firstVector4()
    return this.n[ 1 ] or {naN,naN,naN,naN}
end
e2function angle table:firstAngle()
    return this.n[ 1 ] or {naN,naN,naN}
end
e2function ranger table:firstRanger()
    return this.n[ 1 ] or nil
end
e2function bone table:firstBone()
    return this.n[ 1 ] or nil
end
e2function matrix2 table:firstMatrix2()
    return this.n[ 1 ] or {naN,naN,naN,naN}
end
e2function matrix table:firstMatrix()
    return this.n[ 1 ] or {naN,naN,naN,naN,naN,naN,naN,naN,naN}
end
e2function matrix4 table:firstMatrix4()
    return this.n[ 1 ] or {naN,naN,naN,naN,naN,naN,naN,naN,naN,naN,naN,naN,naN,naN,naN,naN}
end
e2function wirelink table:firstWirelink()
    return this.n[ 1 ] or nil
end
e2function complex table:firstComplex()
    return this.n[ 1 ] or {naN,naN}
end
e2function table table:firstTable()
    return this.n[ 1 ] or {}
end
e2function array table:firstArray()
    return this.n[ 1 ] or {}
end

e2function entity table:lastEntity()
    return this.n[ this.size ] or NULL
end
e2function string table:lastString()
    return this.n[ this.size ] or ""
end
e2function number table:lastNumber()
    return this.n[ this.size ] or naN
end
e2function vector table:lastVector()
    return this.n[ this.size ] or {naN,naN,naN}
end
e2function vector2 table:lastVector2()
    return this.n[ this.size ] or {naN,naN}
end
e2function vector4 table:lastVector4()
    return this.n[ this.size ] or {naN,naN,naN,naN}
end
e2function angle table:lastAngle()
    return this.n[ this.size ] or {naN,naN,naN}
end
e2function ranger table:lastRanger()
    return this.n[ this.size ] or nil
end
e2function bone table:lastBone()
    return this.n[ this.size ] or nil
end
e2function matrix2 table:lastMatrix2()
    return this.n[ this.size ] or {naN,naN,naN,naN}
end
e2function matrix table:lastMatrix()
    return this.n[ this.size ] or {naN,naN,naN,naN,naN,naN,naN,naN,naN}
end
e2function matrix4 table:lastMatrix4()
    return this.n[ this.size ] or {naN,naN,naN,naN,naN,naN,naN,naN,naN,naN,naN,naN,naN,naN,naN,naN}
end
e2function wirelink table:lastWirelink()
    return this.n[ this.size ] or nil
end
e2function complex table:lastComplex()
    return this.n[ this.size ] or {naN,naN}
end
e2function table table:lastTable()
    return this.n[ this.size ] or {}
end
e2function array table:lastArray()
    return this.n[ this.size ] or {}
end
