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
-- package org.allbinary.media.graphics.geography.map.racetrack.drop

local RaceTrackAdjacentDropLayerFactory = {}
package.loaded["org.allbinary.media.graphics.geography.map.racetrack.drop.RaceTrackAdjacentDropLayerFactory"] = RaceTrackAdjacentDropLayerFactory

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
local LayerInterfaceFactoryInterface = java_lazy("org.allbinary.layer.LayerInterfaceFactoryInterface")

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

-- class table RaceTrackAdjacentDropLayerFactory is declared before the requires
RaceTrackAdjacentDropLayerFactory.__index = RaceTrackAdjacentDropLayerFactory
RaceTrackAdjacentDropLayerFactory.className = "RaceTrackAdjacentDropLayerFactory"
RaceTrackAdjacentDropLayerFactory.javaClassName = "org.allbinary.media.graphics.geography.map.racetrack.drop.RaceTrackAdjacentDropLayerFactory"

function RaceTrackAdjacentDropLayerFactory:_init_fields()
    self.list = BasicArrayListD.new()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
end


function RaceTrackAdjacentDropLayerFactory._jinit(self)
    RaceTrackAdjacentDropLayerFactory._init_fields(self)
    return self
end

function RaceTrackAdjacentDropLayerFactory.new(...)
    local self = setmetatable({}, RaceTrackAdjacentDropLayerFactory)
    RaceTrackAdjacentDropLayerFactory._jinit(self, ...)
    return self
end


function RaceTrackAdjacentDropLayerFactory:clear()
        self.list:clear()
end


function RaceTrackAdjacentDropLayerFactory.getInstance()
        return RaceTrackAdjacentDropLayerFactory.DROP_LAYER_FACTORY
end


function RaceTrackAdjacentDropLayerFactory:getSize()
        return self.list:size()
end


function RaceTrackAdjacentDropLayerFactory:getRandomInstance()
        return self.basicArrayListUtil:getRandom(self.list)
end


function RaceTrackAdjacentDropLayerFactory:add(layerInterfaceFactoryInterface)
        self.list:add(layerInterfaceFactoryInterface)
end

RaceTrackAdjacentDropLayerFactory.DROP_LAYER_FACTORY = RaceTrackAdjacentDropLayerFactory.new()

return RaceTrackAdjacentDropLayerFactory

