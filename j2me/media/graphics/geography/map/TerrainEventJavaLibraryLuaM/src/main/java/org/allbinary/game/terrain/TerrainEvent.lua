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
-- package org.allbinary.game.terrain

local NullUtil = require("org.allbinary.logic.NullUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TerrainEvent = {}
TerrainEvent.__index = TerrainEvent
TerrainEvent.className = "TerrainEvent"
setmetatable(TerrainEvent, {__index = AllBinaryEventObject})

function TerrainEvent:_init_fields()
    self.basicTerrainInfo = BasicTerrainInfo.NULL_BASIC_TERRAIN_INFO
end


function TerrainEvent.new(basicTerrainInfo)
    local self = setmetatable(AllBinaryEventObject.new(basicTerrainInfo), TerrainEvent)
    self:_init_fields()
        -- super(...) made self above
        self:setBasicTerrainInfo(self.basicTerrainInfo)
    return self
end


function TerrainEvent:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("TerrainEvent: \n")
        stringBuffer:append("LayerInterface: ")
        stringBuffer:append(tostring(self.basicTerrainInfo))
        return tostring(stringBuffer)
end
TerrainEvent.__tostring = function(self) return self:toString() end


function TerrainEvent:getBasicTerrainInfo()
        return self.basicTerrainInfo
end


function TerrainEvent:setBasicTerrainInfo(basicTerrainInfo)
        self.basicTerrainInfo = basicTerrainInfo
end


function TerrainEvent:setBasicTerrainInfoForCircularStaticPool(basicTerrainInfo)
        self.basicTerrainInfo = basicTerrainInfo
end

return TerrainEvent

