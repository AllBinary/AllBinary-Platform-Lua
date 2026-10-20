-- 
-- To change this license header, choose License Headers in Project Properties. 
-- To change this template file, choose Tools | Templates 
-- and open the template in the editor.  
-- Generated Code Do Not Modify
-- package org.allbinary.input.motion.button


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TouchButtonResource = {}
TouchButtonResource.__index = TouchButtonResource
TouchButtonResource.className = "TouchButtonResource"

function TouchButtonResource:_init_fields()
    self.RESOURCE = nil
    self.HINT = nil
end


function TouchButtonResource.new(resource, hint)
    local self = setmetatable({}, TouchButtonResource)
    self:_init_fields()
        self.RESOURCE = resource
        self.HINT = hint
    return self
end

return TouchButtonResource

