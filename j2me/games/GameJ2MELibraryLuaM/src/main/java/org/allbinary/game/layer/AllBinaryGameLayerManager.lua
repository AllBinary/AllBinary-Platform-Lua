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
-- package org.allbinary.game.layer

local GameInfo = require("org.allbinary.game.GameInfo")
local NullPlayerGameInputComposite = require("org.allbinary.game.input.NullPlayerGameInputComposite")
local PlayerGameInputCompositeInterface = require("org.allbinary.game.input.PlayerGameInputCompositeInterface")
local ItemColorFactory = require("org.allbinary.graphics.ItemColorFactory")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local LayerProcessor = require("org.allbinary.layer.LayerProcessor")
local NullUtil = require("org.allbinary.logic.NullUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

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

local AllBinaryGameLayerManager = {}
AllBinaryGameLayerManager.__index = AllBinaryGameLayerManager
AllBinaryGameLayerManager.className = "AllBinaryGameLayerManager"
setmetatable(AllBinaryGameLayerManager, {__index = AllBinaryLayerManager})

function AllBinaryGameLayerManager:_init_fields()
    self.backgroundBasicColor = nil
    self.foregroundBasicColor = nil
    self.gameInfo = nil
    self.playerGameInputCompositeInterface = NullPlayerGameInputComposite.NULL_PLAYER_GAME_INPUT_COMPOSITE
end


function AllBinaryGameLayerManager.getNullInstance()
        if AllBinaryGameLayerManager.NULL_ALLBINARY_LAYER_MANAGER == NullUtil.getInstance().NULL_OBJECT then
            AllBinaryGameLayerManager.NULL_ALLBINARY_LAYER_MANAGER = AllBinaryGameLayerManager.new(BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE, GameInfo.NONE)
        end
        return AllBinaryGameLayerManager.NULL_ALLBINARY_LAYER_MANAGER
end


function AllBinaryGameLayerManager.new(backgroundBasicColor, foregroundBasicColor, gameInfo)
    local self = setmetatable(AllBinaryLayerManager.new(), AllBinaryGameLayerManager)
    self:_init_fields()
        self.backgroundBasicColor = backgroundBasicColor
        self.foregroundBasicColor = foregroundBasicColor
        local itemColorFactory = ItemColorFactory.getInstance()
        itemColorFactory.INVERT_PAINT = math.tointeger(self.backgroundBasicColor // 1)
        itemColorFactory.PAINT = math.tointeger(self.foregroundBasicColor // 1)
        self.gameInfo = gameInfo
    return self
end


function AllBinaryGameLayerManager:getLayerManager()
        return self
end


function AllBinaryGameLayerManager:init()
end


function AllBinaryGameLayerManager:getBackgroundBasicColor()
        return self.backgroundBasicColor
end


function AllBinaryGameLayerManager:setBackgroundBasicColor(backgroundBasicColor)
        self.backgroundBasicColor = backgroundBasicColor
        ItemColorFactory.getInstance().INVERT_PAINT = math.tointeger(self.backgroundBasicColor // 1)
end


function AllBinaryGameLayerManager:getForegroundBasicColor()
        return self.foregroundBasicColor
end


function AllBinaryGameLayerManager:setForegroundBasicColor(foregroundBasicColor)
        self.foregroundBasicColor = foregroundBasicColor
        ItemColorFactory.getInstance().PAINT = math.tointeger(self.foregroundBasicColor // 1)
end


function AllBinaryGameLayerManager:getGameInfo()
        return self.gameInfo
end


function AllBinaryGameLayerManager:setGameInfo(gameInfo)
        self.gameInfo = gameInfo
end


function AllBinaryGameLayerManager:setLayerProcessorList(list)
        local layerProcessorInterfaceArray = java_new_array(nil, list:size())
        local size = (layerProcessorInterfaceArray.n or #layerProcessorInterfaceArray)
        for index = 0, size - 1 do
            layerProcessorInterfaceArray[index + 1] = list.objectArray[index + 1]
        end
        self:setLayerProcessorArray(layerProcessorInterfaceArray)
end


function AllBinaryGameLayerManager:setPlayerGameInputCompositeInterface(playerGameInputCompositeInterface)
        self.playerGameInputCompositeInterface = playerGameInputCompositeInterface
end


function AllBinaryGameLayerManager:getPlayerGameInputCompositeInterface()
        return self.playerGameInputCompositeInterface
end

AllBinaryGameLayerManager.NULL_ALLBINARY_LAYER_MANAGER = NullUtil.getInstance().NULL_OBJECT
AllBinaryGameLayerManager.ID = SmallIntegerSingletonFactory.getInstance():getAt(22)

return AllBinaryGameLayerManager

