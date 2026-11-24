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
-- package org.allbinary.game.layer

local RTSLayer2LogHelper = {}
package.loaded["org.allbinary.game.layer.RTSLayer2LogHelper"] = RTSLayer2LogHelper

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

local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")

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

-- class table RTSLayer2LogHelper is declared before the requires
RTSLayer2LogHelper.__index = RTSLayer2LogHelper
RTSLayer2LogHelper.className = "RTSLayer2LogHelper"
RTSLayer2LogHelper.javaClassName = "org.allbinary.game.layer.RTSLayer2LogHelper"

function RTSLayer2LogHelper._jinit(self)
    return self
end

function RTSLayer2LogHelper.new()
    return RTSLayer2LogHelper._jinit(setmetatable({}, RTSLayer2LogHelper))
end


function RTSLayer2LogHelper.getInstance()
        return RTSLayer2LogHelper.instance_f
end


function RTSLayer2LogHelper:steeringUp(pathFindingLayerInterface)
end


function RTSLayer2LogHelper:steeringFireOrStop(pathFindingLayerInterface)
end


function RTSLayer2LogHelper:buildingAbove(pathFindingLayerInterface)
end


function RTSLayer2LogHelper:buildingChaseLeft(pathFindingLayerInterface, angle)
end


function RTSLayer2LogHelper:buildingChaseRight(pathFindingLayerInterface, angle)
end


function RTSLayer2LogHelper:buildingDown(pathFindingLayerInterface)
end


function RTSLayer2LogHelper:buildingChaseDown(pathFindingLayerInterface, angle)
end


function RTSLayer2LogHelper:buildingChaseUp(pathFindingLayerInterface, angle)
end


function RTSLayer2LogHelper:buildingLeft()
end


function RTSLayer2LogHelper:buildingRight()
end

RTSLayer2LogHelper.instance_f = RTSLayer2LogHelper.new()

return RTSLayer2LogHelper

