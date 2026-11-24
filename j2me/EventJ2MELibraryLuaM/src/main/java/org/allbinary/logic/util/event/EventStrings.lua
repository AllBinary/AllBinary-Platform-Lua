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

local EventStrings = {}
package.loaded["org.allbinary.logic.util.event.EventStrings"] = EventStrings

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table EventStrings is declared before the requires
EventStrings.__index = EventStrings
EventStrings.className = "EventStrings"
EventStrings.javaClassName = "org.allbinary.logic.util.event.EventStrings"

function EventStrings:_init_fields()
    self.PERFORMANCE_MESSAGE = "Use Custom onEvent Methods for needed optimization"
    self.TOTAL_LISTENERS = "Total Listeners: "
    self.LISTENER_LABEL = " Listener: "
    self.FIRE_EVENT = "fireEvent"
end

function EventStrings._jinit(self)
    EventStrings._init_fields(self)
    return self
end

function EventStrings.new()
    return EventStrings._jinit(setmetatable({}, EventStrings))
end


function EventStrings.getInstance()
        return EventStrings.instance_f
end

EventStrings.instance_f = EventStrings.new()

return EventStrings

