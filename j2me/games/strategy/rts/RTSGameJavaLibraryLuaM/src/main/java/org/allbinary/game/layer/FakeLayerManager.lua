-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2002 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot  
-- Generated Code Do Not Modify
-- package org.allbinary.game.layer

local GameInfo = require("org.allbinary.game.GameInfo")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellType = require("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapCompositeInterface = require("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FakeLayerManager = {}
FakeLayerManager.__index = FakeLayerManager
FakeLayerManager.className = "FakeLayerManager"
setmetatable(FakeLayerManager, {__index = AllBinaryGameLayerManager})

function FakeLayerManager:_init_fields()
    self.geographicMapInterfaceArray = BasicGeographicMap.NULL_BASIC_GEOGRAPHIC_MAP_ARRAY
    self.geographicMapCellTypeArray = GeographicMapCellType.NULL_GEOGRAPHIC_MAP_CELL_TYPE_ARRAY
end


function FakeLayerManager.new(gameInfo)
    local self = setmetatable(AllBinaryGameLayerManager.new(BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE, gameInfo), FakeLayerManager)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function FakeLayerManager:getGeographicMapInterface()
        return self.geographicMapInterfaceArray
end


function FakeLayerManager:setGeographicMapInterface(geographicMapInterfaceArray)
        self.geographicMapInterfaceArray = geographicMapInterfaceArray
        self.geographicMapCellTypeArray = java_new_array(nil, (self.geographicMapInterfaceArray.n or #self.geographicMapInterfaceArray))
end


function FakeLayerManager:geographicMapCellTypeArray()
        return self.geographicMapCellTypeArray
end

return FakeLayerManager

