-- 
-- To change this license header, choose License Headers in Project Properties. 
-- To change this template file, choose Tools | Templates 
-- and open the template in the editor.  
-- Generated Code Do Not Modify
-- package org.allbinary.input.automation.actions.script


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local JTreeInterfaceFactory = {}
JTreeInterfaceFactory.__index = JTreeInterfaceFactory
JTreeInterfaceFactory.className = "JTreeInterfaceFactory"

function JTreeInterfaceFactory:_init_fields()
    self.jTreeInterface = nil
end

function JTreeInterfaceFactory.new()
    local self = setmetatable({}, JTreeInterfaceFactory)
    self:_init_fields()
    return self
end


function JTreeInterfaceFactory.getInstance()
        return JTreeInterfaceFactory.instance
end


function JTreeInterfaceFactory:set(jTreeInterface)
        self.jTreeInterface = jTreeInterface
end


function JTreeInterfaceFactory:getJTreeInterface()
        return self.jTreeInterface
end

JTreeInterfaceFactory.instance = JTreeInterfaceFactory.new()

return JTreeInterfaceFactory

