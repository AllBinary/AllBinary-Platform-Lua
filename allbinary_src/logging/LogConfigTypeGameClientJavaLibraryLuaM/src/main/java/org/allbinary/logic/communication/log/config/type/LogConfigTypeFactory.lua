-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot 
--   
-- Generated Code Do Not Modify
-- package org.allbinary.logic.communication.log.config.type


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LogConfigTypeFactory = {}
LogConfigTypeFactory.__index = LogConfigTypeFactory
LogConfigTypeFactory.className = "LogConfigTypeFactory"

function LogConfigTypeFactory:_init_fields()
    self.NO_DESCRIPTION = "No Description"
    self.OS = LogConfigType.new("Operating System", self.NO_DESCRIPTION)
    self.FACTORYERROR = LogConfigType.new("Factory Error", self.NO_DESCRIPTION)
end


function LogConfigTypeFactory.getInstance()
        return LogConfigTypeFactory.instance
end


function LogConfigTypeFactory.new()
    local self = setmetatable({}, LogConfigTypeFactory)
    self:_init_fields()
        LogConfigTypes.LOGGING:add(self.OS)
        LogConfigTypes.LOGGING:add(self.FACTORYERROR)
    return self
end

LogConfigTypeFactory.instance = LogConfigTypeFactory.new()

return LogConfigTypeFactory

