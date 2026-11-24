-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer.waypoint.event

local WaypointEventHandlerFactory = {}
package.loaded["org.allbinary.game.layer.waypoint.event.WaypointEventHandlerFactory"] = WaypointEventHandlerFactory

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

local Group = java_lazy("org.allbinary.game.identification.Group")
local WaypointEventHandler = java_lazy("org.allbinary.game.layer.waypoint.event.WaypointEventHandler")

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

-- class table WaypointEventHandlerFactory is declared before the requires
WaypointEventHandlerFactory.__index = WaypointEventHandlerFactory
WaypointEventHandlerFactory.className = "WaypointEventHandlerFactory"
WaypointEventHandlerFactory.javaClassName = "org.allbinary.game.layer.waypoint.event.WaypointEventHandlerFactory"

function WaypointEventHandlerFactory._jinit(self)
    return self
end

function WaypointEventHandlerFactory.new()
    return WaypointEventHandlerFactory._jinit(setmetatable({}, WaypointEventHandlerFactory))
end


function WaypointEventHandlerFactory.getInstance(groupInterface)
        local groupId = java_int(groupInterface:getGroupId())
        return WaypointEventHandlerFactory.eventHandlerArray[groupId + 1]
end


function WaypointEventHandlerFactory.removeAll()
        for index = (WaypointEventHandlerFactory.eventHandlerArray.n or #WaypointEventHandlerFactory.eventHandlerArray) - 1, 0, -1 do
            WaypointEventHandlerFactory.eventHandlerArray[index + 1]:removeAllListeners()
        end
end

WaypointEventHandlerFactory.eventHandlerArray = {WaypointEventHandler.new(), WaypointEventHandler.new(), WaypointEventHandler.new(), WaypointEventHandler.new(), WaypointEventHandler.new(), WaypointEventHandler.new(), WaypointEventHandler.new(), WaypointEventHandler.new(), WaypointEventHandler.new(), WaypointEventHandler.new()}

return WaypointEventHandlerFactory

