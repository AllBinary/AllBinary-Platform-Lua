--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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
-- package org.allbinary.bounds

local LayerBounds = {}
package.loaded["org.allbinary.bounds.LayerBounds"] = LayerBounds

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

local BoundsChangeEvent = java_lazy("org.allbinary.bounds.event.BoundsChangeEvent")
local BoundsChangeEventListener = java_lazy("org.allbinary.bounds.event.BoundsChangeEventListener")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local BoundsVisitorInterface = java_lazy("org.allbinary.bounds.BoundsVisitorInterface")

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

-- class table LayerBounds is declared before the requires
LayerBounds.__index = LayerBounds
LayerBounds.className = "LayerBounds"
LayerBounds.javaClassName = "org.allbinary.bounds.LayerBounds"
LayerBounds.java_implements = " BoundsChangeEventListener "
LayerBounds.java_interfaces = function() return {BoundsChangeEventListener} end

function LayerBounds:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.rectangle == nil then self.rectangle = nil end
end


function LayerBounds._jinit(self, rectangle)
    LayerBounds._init_fields(self)
        self.rectangle = rectangle
    return self
end

function LayerBounds.new(...)
    local self = setmetatable({}, LayerBounds)
    LayerBounds._jinit(self, ...)
    return self
end


function LayerBounds:getRectangleP()
        return self.rectangle
end


function LayerBounds:visit(boundsVisitorInterface)
end


function LayerBounds:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function LayerBounds:onBoundsChangeEvent(boundsChangeEvent)
        self.rectangle = boundsChangeEvent:getRectangle()
end

return LayerBounds

