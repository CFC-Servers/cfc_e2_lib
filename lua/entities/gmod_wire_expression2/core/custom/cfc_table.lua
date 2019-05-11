E2Lib.RegisterExtension( "cfc_e2_lib", true )

registerFunction( "first", "t:", id, function(self,args)
  local op1 = args[2].n
  local array = op1[1](self,op1)
  if (!array) then return fixdef( default ) end
  return getter( self, array, 1, false )
end) --https://github.com/wiremod/wire/blob/master/lua/entities/gmod_wire_expression2/core/array.lua#L234 https://github.com/wiremod/wire/blob/master/lua/entities/gmod_wire_expression2/core/array.lua#L141

registerFunction( "last", "t:", id, function(self,args)
  local op1 = args[2].n
  local array = op1[1](self,op1)
  if (!array) then return fixdef( default ) end
  return getter( self, array, #array, false )
end) --https://github.com/wiremod/wire/blob/master/lua/entities/gmod_wire_expression2/core/array.lua#L234 https://github.com/wiremod/wire/blob/master/lua/entities/gmod_wire_expression2/core/array.lua#L141
-- so i just copied the array form, then passed in the table, and turned the op1 value as the array part.
--https://github.com/wiremod/wire/blob/master/lua/entities/gmod_wire_expression2/core/table.lua#L372
