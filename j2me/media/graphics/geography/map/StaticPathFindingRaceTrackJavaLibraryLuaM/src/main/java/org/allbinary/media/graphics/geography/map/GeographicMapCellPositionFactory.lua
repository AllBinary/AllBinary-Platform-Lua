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
-- package org.allbinary.media.graphics.geography.map

local CommonStrings = require("org.allbinary.string.CommonStrings")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local GeographicMapCellPositionBaseFactory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPositionBaseFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GeographicMapCellPositionFactory = {}
GeographicMapCellPositionFactory.__index = GeographicMapCellPositionFactory
GeographicMapCellPositionFactory.className = "GeographicMapCellPositionFactory"
setmetatable(GeographicMapCellPositionFactory, {__index = GeographicMapCellPositionBaseFactory})

function GeographicMapCellPositionFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function GeographicMapCellPositionFactory.new()
    local self = setmetatable(GeographicMapCellPositionBaseFactory.new(), GeographicMapCellPositionFactory)
    self:_init_fields()
    return self
end


-- throws Exception
function GeographicMapCellPositionFactory:getInstance(geographicMapInterface)
        local commonStrings = CommonStrings.getInstance()
        local allBinaryTiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        local geographicMapCellPositionFactoryCanBeNull = GeographicMapCellPositionFactory.hashtable:get(allBinaryTiledLayer:getDataId())
        if geographicMapCellPositionFactoryCanBeNull == nil then
            self.logUtil:putF(tostring(StringMaker.new():append("Creating GeographicMapCellPositionFactory for TileLayer: "):appendint(java_int(math.tointeger(allBinaryTiledLayer:getDataId() // 1)))), self, commonStrings.GET_INSTANCE)
            geographicMapCellPositionFactoryCanBeNull = BasicGeographicMapCellPositionFactory.new(geographicMapInterface)
            GeographicMapCellPositionFactory.hashtable:put(allBinaryTiledLayer:getDataId(), geographicMapCellPositionFactoryCanBeNull)
            return geographicMapCellPositionFactoryCanBeNull
        else
            self.logUtil:putF(tostring(StringMaker.new():append("Reusing GeographicMapCellPositionFactory for TileLayer: "):appendint(java_int(math.tointeger(allBinaryTiledLayer:getDataId() // 1)))), self, commonStrings.GET_INSTANCE)
            return geographicMapCellPositionFactoryCanBeNull
        end
end


function GeographicMapCellPositionFactory.getHashtable()
        return GeographicMapCellPositionFactory.hashtable
end

GeographicMapCellPositionFactory.hashtable = StdUtil.getInstance():createHashtable()

return GeographicMapCellPositionFactory

