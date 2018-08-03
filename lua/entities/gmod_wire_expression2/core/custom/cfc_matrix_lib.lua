E2Lib.RegisterExtension("cfcmatrix",true)

--Format: Array where the first two entries specifies the number of rows and columns respectively.
registerType("cfc_matrix", "cm", { 0,0 },
    function(self, input)
	    local ret = {}
		for k, v in pairs( input ) do ret[k] = v end

		return ret
    end,
	nil,
	function(retval)
		if !istable( retval ) then error("Return value is not a table, but a "..type( retval ).."!",0) end
		if #retval ~= (retval[1] * retval[2]) + 2 then error("Matrix does not match given dimensions") end
	end,
	function(v)
		    return !istable( retval ) or #retval ~= (retval[1] * retval[2]) + 2
	end
)

--Static functions and constants -------------------------------------------------------------------------

E2Lib.registerConstant("EMPTY", {0,0})

e2function cfc_matrix identityMatrix(number n)
	local ret = { n, n }
	for i = 0, n do
		for j = 0, n do
            local idx = j + (i * n) + 2
			if i == j then
				ret[idx] = 1
			else
				ret[idx] = 0
			end
		end
	end

	return ret
end

e2function cfc_matrix newMatrix(number rows, number columns)
	local ret  = {rows, columns}
	local size = rows * columns
	for i = 0, size do
		ret[i + 2] = 0
	end

	return ret
end


e2function cfc_matrix addMatrix(cfc_matrix a, cfc_matrix b)

	if a:rows() ~= b:rows() or a:columns() ~= b:columns() then error("Cannot add matrices with different dimensions") end
	
	local ret = {a:rows(), a:columns()}
	for i = 0 in ret[1]
		for j = 0 in ret[2]
	        -- What is n? Where does it come from?
            local idx = j + (i * n) + 2
			ret[idx] = a:get( i, j ) + b:get( i, j )
		end
	end

	return ret
end

e2function cfc_matrix scalarMultiply(cfc_matrix a, cfc_matrix b)

	local rows = a:rows()
	local cols = a:columns()
	local ret = {rows, columns}
	
	for i = 0, rows do
		for j = 0, cols do
	        -- What is n? Where does it come from?
            local idx = j + (i * n) + 2
            -- Is the multipication operator defined?
            ret[idx] = b * a:get( i, j )
		end
	end
	
	return ret
end

e2function cfc_matrix matrixMultiply(cfc_matrix a, cfc_matrix b)

	if a:columns()~=b:rows() then error("Cannot multiply matrices with incompatible dimensions") end

	local rows = a:rows()
	local cols = b:columns()
	local dot_range = a:columns()
	
	local ret = {rows, cols}
	
	--naive O(n^3) multiplication. Replace this with recursive method eventually
	for i = 0, rows do
		for j = 0, cols do
			local dot = 0
			for k = 0, in dot_range do
				dot = dot + a:get( i, k ) * b:get( k, j )
			end
	        -- What is n? Where does it come from?
            local idx = j + (i * n) + 2
			ret[idx] = dot
		end
	end
	
	return ret
end

e2function cfc_matrix transposeMatrix(cfc_matrix a)

	local rows = a:columns()
	local cols = a:rows()
	
	local ret = {rows, cols}
	
	for i = 0, rows do
		for j = 0, cols do
	        -- What is n? Where does it come from?
            local idx = j + (i * n) + 2
			ret[idx] = a:get( j, i )
		end
	end
	
	return ret
end 

-- This should be an array of cfc_matrix
e2function cfc_matrix LU_factorization( cfc_matrix a )

	-- Implement alg from https://www.geeksforgeeks.org/doolittle-algorithm-lu-decomposition/
	-- When not stoned on allergy pills

end

e2function number determinant(cfc_matrix a)

	local factorization = LU_factorization( a )
	local rows = a:rows()
	local cols = a:columns()
	local ret = 1

	--determinent is the diagonal product of LU factorized matrices
	for i = 0, rows do
		ret = ret * factorization[1]:get( i, i ) * factorization[2]:get( i, i )
	end

	return ret
end

e2function cfc_matrix inverse(cfc_matrix a)

	if determinant( a ) == 0 then error("Given matrix is not invertible.") end
	
	-- Investigate paper at http://www.irma-international.org/viewtitle/41011/ for possible
	-- better algorithm for deteriment and inverse

end

--Non static functions -------------------------------------------------------------------------------

e2function cfc_matrix:entryExists(number i, number j)
	if i > 0 and i < this[1] and j > 0 and j < this[2] then
		return true
	else
		return false
	end
end

e2function number cfc_matrix:get(number i, number j)
	if this.entry_exists( i, j ) then
	    -- What is n? Where does it come from?
        local idx = j + (i * n) + 2
		return this[idx]
	else
		error("("..i..","..j..") does not exist in matrix")
		return 0
	end
end

e2function cfc_matrix:set(number val, number i, number j)
	if this.entry_exists( i, j )
	    -- What is n? Where does it come from?
        local idx = j + (i * n) + 2
		this[idx] = val
	end
end

e2function number cfc_matrix:rows()
	return this[1]
end

e2function number cfc_matrix:columns()
	return this[2]
end
