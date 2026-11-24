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
-- package org.allbinary.media.graphics.geography.map.drop

local BaseDropCellPositionGenerator = {}
package.loaded["org.allbinary.media.graphics.geography.map.drop.BaseDropCellPositionGenerator"] = BaseDropCellPositionGenerator

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

local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local DropCellPositionGeneratorInterface = require("org.allbinary.media.graphics.geography.map.drop.DropCellPositionGeneratorInterface")

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

-- class table BaseDropCellPositionGenerator is declared before the requires
BaseDropCellPositionGenerator.__index = BaseDropCellPositionGenerator
BaseDropCellPositionGenerator.className = "BaseDropCellPositionGenerator"
BaseDropCellPositionGenerator.javaClassName = "org.allbinary.media.graphics.geography.map.drop.BaseDropCellPositionGenerator"
BaseDropCellPositionGenerator.java_implements = " DropCellPositionGeneratorInterface "
BaseDropCellPositionGenerator.java_interfaces = function() return {DropCellPositionGeneratorInterface} end

function BaseDropCellPositionGenerator._jinit(self)
    return self
end

function BaseDropCellPositionGenerator.new()
    return BaseDropCellPositionGenerator._jinit(setmetatable({}, BaseDropCellPositionGenerator))
end


function BaseDropCellPositionGenerator:getName()
        return (getmetatable(self).javaClassName or getmetatable(self).className)
end


-- throws Exception
function BaseDropCellPositionGenerator:update(allBinaryGameLayerManager, geographicMapInterface)
end


-- throws Exception
function BaseDropCellPositionGenerator:isDropAllowedAt(geographicMapCellPosition)
        return true
end


-- throws Exception
function BaseDropCellPositionGenerator:processTick(allBinaryLayerManager)
end

return BaseDropCellPositionGenerator

