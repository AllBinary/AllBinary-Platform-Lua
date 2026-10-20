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
-- package org.allbinary.logic.util.event


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local EventStrings = {}
EventStrings.__index = EventStrings
EventStrings.className = "EventStrings"

function EventStrings:_init_fields()
    self.PERFORMANCE_MESSAGE = "Use Custom onEvent Methods for needed optimization"
    self.TOTAL_LISTENERS = "Total Listeners: "
    self.LISTENER_LABEL = " Listener: "
    self.FIRE_EVENT = "fireEvent"
end

function EventStrings.new()
    local self = setmetatable({}, EventStrings)
    self:_init_fields()
    return self
end


function EventStrings.getInstance()
        return EventStrings.instance
end

EventStrings.instance = EventStrings.new()

return EventStrings

