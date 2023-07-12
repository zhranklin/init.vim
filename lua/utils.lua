return {
  -- 用来将对象转换成string
  dump = local function(o)
    local function nn(o)
      if o == nil then
        return 'nil'
      else
        return o
      end
    end
    if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
        if type(k) ~= 'number' then k = '"'..k..'"' end
        s = nn(s) .. '['..nn(k)..'] = ' .. nn(dump(v)) .. ','
      end
      return s .. '} '
    else
       return tostring(o)
    end
  end

}
