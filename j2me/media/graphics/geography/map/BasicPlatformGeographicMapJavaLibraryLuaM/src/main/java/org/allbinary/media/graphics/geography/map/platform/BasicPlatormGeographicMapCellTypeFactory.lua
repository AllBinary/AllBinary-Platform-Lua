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
-- package org.allbinary.media.graphics.geography.map.platform

-- local Enumeration = require("java.util.Enumeration")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapCellTypeFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local EnumerationUtil = require("org.allbinary.util.EnumerationUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicPlatormGeographicMapCellTypeFactory = {}
BasicPlatormGeographicMapCellTypeFactory.__index = BasicPlatormGeographicMapCellTypeFactory
BasicPlatormGeographicMapCellTypeFactory.className = "BasicPlatormGeographicMapCellTypeFactory"
setmetatable(BasicPlatormGeographicMapCellTypeFactory, {__index = GeographicMapCellTypeFactory})

function BasicPlatormGeographicMapCellTypeFactory:_init_fields()
    self.enumerationUtil = EnumerationUtil.getInstance()
    self.BLOCK_CELL_TYPE = nil
    self.JUMP_THRU_CELL_TYPE = nil
    self.LADDER_CELL_TYPE = nil
    self.maxTileId = nil
end


function BasicPlatormGeographicMapCellTypeFactory.new(tileTypeToTileIdsMap, maxTileId)
    local self = setmetatable(GeographicMapCellTypeFactory.new(), BasicPlatormGeographicMapCellTypeFactory)
    self:_init_fields()
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(commonStrings.START, self, commonStrings.INIT)
        self.maxTileId = maxTileId
        GeographicMapCellType.new(0, 0)
        local BLOCK_CELL_TYPE = BasicPlatormGeographicMapCellType.createType(1)
        local JUMP_THRU_CELL_TYPE = BLOCK_CELL_TYPE
        local LADDER_CELL_TYPE = BLOCK_CELL_TYPE
        local PLATFORM = "Platform"
        local JUMP_TRHU = "JumpThru"
        local LADDER = "Ladder"
        local enumeration = tileTypeToTileIdsMap:keys()
        local idsWithTypeList = nil
        local key = nil
        local basicPlatormGeographicMapCellType = nil
        while self.enumerationUtil:hasMoreElements(enumeration) do
            key = self.enumerationUtil:nextElement(enumeration)
            self.logUtil:putF(key, self, commonStrings.INIT)
            idsWithTypeList = tileTypeToTileIdsMap:get(key)
            basicPlatormGeographicMapCellType = BasicPlatormGeographicMapCellType.new(idsWithTypeList)
            if (key == PLATFORM) then
                BLOCK_CELL_TYPE = basicPlatormGeographicMapCellType
            end
            if (key == JUMP_TRHU) then
                JUMP_THRU_CELL_TYPE = basicPlatormGeographicMapCellType
            end
            if (key == LADDER) then
                LADDER_CELL_TYPE = basicPlatormGeographicMapCellType
            end
        end
        self.BLOCK_CELL_TYPE = BLOCK_CELL_TYPE
        self.JUMP_THRU_CELL_TYPE = JUMP_THRU_CELL_TYPE
        self.LADDER_CELL_TYPE = LADDER_CELL_TYPE
        GeographicMapCellType.new(self.maxTileId - 1, 0)
        GeographicMapCellType.new(self.maxTileId - 2, 0)
    return self
end


function BasicPlatormGeographicMapCellTypeFactory:getStartType()
        return self.maxTileId - 1
end


function BasicPlatormGeographicMapCellTypeFactory:getEndType()
        return self.maxTileId - 2
end


function BasicPlatormGeographicMapCellTypeFactory:getEmptyType()
        return 0
end


function BasicPlatormGeographicMapCellTypeFactory:isPath(cellType)
        if cellType:getType() == 0 then
            return true
        end
        return false
end

return BasicPlatormGeographicMapCellTypeFactory

