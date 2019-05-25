E2Lib.RegisterExtension( "cfc_e2_lib", true )
p
e2function entity table:firstEntity()
	if (this.size == 0) then return NULL else return this.n[ 1 ] end
end
e2function string table:firstString()
	if (this.size == 0) then return NULL else return this.n[ 1 ] end
end
e2function number table:firstNumber()
	if (this.size == 0) then return NULL else return this.n[ 1 ] end
end
e2function vector table:firstVector()
	if (this.size == 0) then return NULL else return this.n[ 1 ] end
end
e2function vector2 table:firstVector2()
	if (this.size == 0) then return NULL else return this.n[ 1 ] end
end
e2function vector4 table:firstVector4()
	if (this.size == 0) then return NULL else return this.n[ 1 ] end
end
e2function angle table:firstAngle()
	if (this.size == 0) then return NULL else return this.n[ 1 ] end
end
e2function ranger table:firstRanger()
	if (this.size == 0) then return NULL else return this.n[ 1 ] end
end
e2function bone table:firstBone()
	if (this.size == 0) then return NULL else return this.n[ 1 ] end
end
e2function matrix2 table:firstMatrix2()
	if (this.size == 0) then return NULL else return this.n[ 1 ] end
end
e2function matrix table:firstMatrix()
	if (this.size == 0) then return NULL else return this.n[ 1 ] end
end
e2function matrix4 table:firstMatrix4()
	if (this.size == 0) then return NULL else return this.n[ 1 ] end
end
e2function wirelink table:firstWirelink()
	if (this.size == 0) then return NULL else return this.n[ 1 ] end
end
e2function complex table:firstComplex()
	if (this.size == 0) then return NULL else return this.n[ 1 ] end
end
e2function table table:firstTable()
	if (this.size == 0) then return NULL else return this.n[ 1 ] end
end
e2function array table:firstArray()
	if (this.size == 0) then return NULL else return this.n[ 1 ] end
end

e2function entity table:lastEntity()
	if (this.size == 0) then return NULL else return this.n[ this.size ] end
end
e2function string table:lastString()
	if (this.size == 0) then return NULL else return this.n[ this.size ] end
end
e2function number table:lastNumber()
	if (this.size == 0) then return NULL else return this.n[ this.size ] end
end
e2function vector table:lastVector()
	if (this.size == 0) then return NULL else return this.n[ this.size ] end
end
e2function vector2 table:lastVector2()
	if (this.size == 0) then return NULL else return this.n[ this.size ] end
end
e2function vector4 table:lastVector4()
	if (this.size == 0) then return NULL else return this.n[ this.size ] end
end
e2function angle table:lastAngle()
	if (this.size == 0) then return NULL else return this.n[ this.size ] end
end
e2function ranger table:lastRanger()
	if (this.size == 0) then return NULL else return this.n[ this.size ] end
end
e2function bone table:lastBone()
	if (this.size == 0) then return NULL else return this.n[ this.size ] end
end
e2function matrix2 table:lastMatrix2()
	if (this.size == 0) then return NULL else return this.n[ this.size ] end
end
e2function matrix table:lastMatrix()
	if (this.size == 0) then return NULL else return this.n[ this.size ] end
end
e2function matrix4 table:lastMatrix4()
	if (this.size == 0) then return NULL else return this.n[ this.size ] end
end
e2function wirelink table:lastWirelink()
	if (this.size == 0) then return NULL else return this.n[ this.size ] end
end
e2function complex table:lastComplex()
	if (this.size == 0) then return NULL else return this.n[ this.size ] end
end
e2function table table:lastTable()
	if (this.size == 0) then return NULL else return this.n[ this.size ] end
end
e2function array table:lastArray()
	if (this.size == 0) then return NULL else return this.n[ this.size ] end
end
