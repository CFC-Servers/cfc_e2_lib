E2Lib.RegisterExtension("cfcmatrix",true)

--Format: Array where the first two entries specifies the number of rows and columns respectively.
registerType("cfc_matrix", "cm", { 0,0 },
    function(self, input)
	    local ret = {}
		for k,v in pairs(input) do ret[k] = v end
		return ret
    end,
	nil,
	function(retval)
		if !istable(retval) then error("Return value is not a table, but a "..type(retval).."!",0) end
		if #retval ~= (retval[1]*retval[2])+2 then error("Matrix does not match given dimentions") end
		
	end,
	function(v)
		    return !istable( retval ) or #retval ~= ( retval[1] * retval[2] ) +2
	end
)

--Static functions and constants

E2Lib.registerConstant("EMPTY", {0,0})

e2function cfc_matrix identity(n)
	local ret = { n, n }
	for i in 0..n
		for j in 0..n
			if i == j
				ret[ 2+j+(i*n) ] = 1
			else
				ret[ 2+j+(i*n) ] = 0
			end
		end
	end
	return ret
end

e2function cfc_matrix add(a, b)

	if a:rows()~=b:rows() and a:columns() ~= b:columns() then error("Cannot add matrices with different dimentions") end
	
	local ret = {a:rows(),a:columns()}
	
	for i in 0..ret[1]
		for j in 0..ret[2]
			ret[2+j+(i*n)]=a:get(i,j)+b:get(i,j)
		end
	end
	return ret
end

e2function cfc_matrix multiply(a,b)

	if a:columns()~=b:rows() then error("Cannot multiply matrices with incompatible dimentions") end

	local rows = a:rows()
	local cols = b:columns()
	local dot_range = a:columns()
	
	local ret = {rows,cols}
	
	--naive O(n^3) multiplication. Replace this with recursive method eventually
	for i in 0..rows
		for j in 0..cols
			local dot = 0
			for k in 0..dot_range
				dot = dot + a:get(i,k)*b:get(k,j)
			end
			ret[2+j+(i*n)] = dot
		end
	end
	
	return ret
end

--Non static functions

local cfc_matrix:entry_exists(i,j)
	if i>0 and i<this[1] and j>0 and j<this[2]
		return true
	else
		return false
	end
end

e2function number cfc_matrix:get(i,j)
	if this.entry_exists(i,j)
		return this[2+j+(i*n)]
	else
		error("("..i..","..j..") does not exist in matrix")
		return 0
	end
end

e2function cfc_matrix:set(val, i, j)
	if this.entry_exists(i,j)
		this[2+j+(i*n)]=val
	end
end

e2function number cfc_matrix:rows()
	return this[1]
end

e2function number cfc_matrix:columns()
	return this[2]
end