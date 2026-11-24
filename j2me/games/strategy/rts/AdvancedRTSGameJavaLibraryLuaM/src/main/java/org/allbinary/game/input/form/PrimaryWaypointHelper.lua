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
-- package org.allbinary.game.input.form

local PrimaryWaypointHelper = {}
package.loaded["org.allbinary.game.input.form.PrimaryWaypointHelper"] = PrimaryWaypointHelper

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

local NullPathFindingLayer = java_lazy("org.allbinary.game.layer.NullPathFindingLayer")
local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")
local WaypointLayer = java_lazy("org.allbinary.game.layer.waypoint.WaypointLayer")

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

-- class table PrimaryWaypointHelper is declared before the requires
PrimaryWaypointHelper.__index = PrimaryWaypointHelper
PrimaryWaypointHelper.className = "PrimaryWaypointHelper"
PrimaryWaypointHelper.javaClassName = "org.allbinary.game.input.form.PrimaryWaypointHelper"

function PrimaryWaypointHelper:_init_fields()
    self.waypointLayer = NullPathFindingLayer.NULL_PATH_FINDING_LAYER
end


function PrimaryWaypointHelper.getInstance()
        return PrimaryWaypointHelper.instance_f
end


function PrimaryWaypointHelper._jinit(self)
    PrimaryWaypointHelper._init_fields(self)
    return self
end

function PrimaryWaypointHelper.new(...)
    local self = setmetatable({}, PrimaryWaypointHelper)
    PrimaryWaypointHelper._jinit(self, ...)
    return self
end


function PrimaryWaypointHelper:getWaypointLayer()
        return self.waypointLayer
end


function PrimaryWaypointHelper:setWaypointLayer(waypointLayer)
        self.waypointLayer = waypointLayer
end

PrimaryWaypointHelper.instance_f = PrimaryWaypointHelper.new()

return PrimaryWaypointHelper

