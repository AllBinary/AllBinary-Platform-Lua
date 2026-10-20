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
-- package org.allbinary.game.behavior.topview

local Direction = require("org.allbinary.direction.Direction")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local TrackingEventCircularStaticPool = require("org.allbinary.game.tracking.TrackingEventCircularStaticPool")
local TrackingEventHandler = require("org.allbinary.game.tracking.TrackingEventHandler")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicGeographicMapUtil = require("org.allbinary.media.graphics.geography.map.BasicGeographicMapUtil")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local TopViewCharacterBehavior = require("org.allbinary.game.behavior.topview.TopViewCharacterBehavior")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PlayerTopViewCharacterBehavior = {}
PlayerTopViewCharacterBehavior.__index = PlayerTopViewCharacterBehavior
PlayerTopViewCharacterBehavior.className = "PlayerTopViewCharacterBehavior"
setmetatable(PlayerTopViewCharacterBehavior, {__index = TopViewCharacterBehavior})

function PlayerTopViewCharacterBehavior:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function PlayerTopViewCharacterBehavior.new()
    local self = setmetatable(TopViewCharacterBehavior.new(), PlayerTopViewCharacterBehavior)
    self:_init_fields()
    return self
end


-- throws Exception
function PlayerTopViewCharacterBehavior:terrainEvent(layer, direction, x, y, geographicMapInterfaceArray, geographicMapCellPosition)
        TrackingEventHandler.getInstance():fireEvent(TrackingEventCircularStaticPool.getInstance():getNextInstance(layer))
end


function PlayerTopViewCharacterBehavior:terrainMove(layer, geographicMapInterfaceArray, x, y)
        local basicGeographicMapUtil = BasicGeographicMapUtil.getInstance()
        basicGeographicMapUtil:setPosition(geographicMapInterfaceArray, x, y)
end


function PlayerTopViewCharacterBehavior:moveIfOnScreen(layer, ax, ay)
end


function PlayerTopViewCharacterBehavior:isTiledLayerMoveable(terrainTiledLayer, x, y)
        return (terrainTiledLayer:getXP() + DisplayInfoSingleton.getInstance():getLastWidth() < terrainTiledLayer:getWidth() or x < 0) and (terrainTiledLayer:getXP() > 0 or x > 0)
end

return PlayerTopViewCharacterBehavior

