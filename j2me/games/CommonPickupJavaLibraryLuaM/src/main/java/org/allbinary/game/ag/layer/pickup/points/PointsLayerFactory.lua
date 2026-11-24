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
-- package org.allbinary.game.ag.layer.pickup.points

local PointsLayerFactory = {}
package.loaded["org.allbinary.game.ag.layer.pickup.points.PointsLayerFactory"] = PointsLayerFactory

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

local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerFactoryInterface = java_lazy("org.allbinary.layer.AllBinaryLayerFactoryInterface")
local PointsLayer = java_lazy("org.allbinary.game.ag.layer.pickup.points.PointsLayer")

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

-- class table PointsLayerFactory is declared before the requires
PointsLayerFactory.__index = PointsLayerFactory
PointsLayerFactory.className = "PointsLayerFactory"
PointsLayerFactory.javaClassName = "org.allbinary.game.ag.layer.pickup.points.PointsLayerFactory"
PointsLayerFactory.java_implements = " AllBinaryLayerFactoryInterface "
PointsLayerFactory.java_interfaces = function() return {AllBinaryLayerFactoryInterface} end

function PointsLayerFactory:_init_fields()
    if self.points == nil then self.points = nil end
end


function PointsLayerFactory._jinit(self, points)
    PointsLayerFactory._init_fields(self)
        self.points = points
    return self
end

function PointsLayerFactory.new(...)
    local self = setmetatable({}, PointsLayerFactory)
    PointsLayerFactory._jinit(self, ...)
    return self
end


-- throws Exception
function PointsLayerFactory:getInstance()
        return PointsLayer.new(self.points)
end

return PointsLayerFactory

