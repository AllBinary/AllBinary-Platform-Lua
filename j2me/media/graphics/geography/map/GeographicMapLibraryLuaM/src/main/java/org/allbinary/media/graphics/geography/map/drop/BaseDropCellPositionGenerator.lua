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

local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local DropCellPositionGeneratorInterface = require("org.allbinary.media.graphics.geography.map.drop.DropCellPositionGeneratorInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BaseDropCellPositionGenerator = {}
BaseDropCellPositionGenerator.__index = BaseDropCellPositionGenerator
BaseDropCellPositionGenerator.className = "BaseDropCellPositionGenerator"

function BaseDropCellPositionGenerator.new()
    local self = setmetatable({}, BaseDropCellPositionGenerator)
    return self
end


function BaseDropCellPositionGenerator:getName()
        return getmetatable(self).className
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

