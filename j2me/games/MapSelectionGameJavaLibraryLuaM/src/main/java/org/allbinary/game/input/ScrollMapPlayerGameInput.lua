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
-- package org.allbinary.game.input

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local Features = require("org.allbinary.game.configuration.feature.Features")
local InputFeatureFactory = require("org.allbinary.game.configuration.feature.InputFeatureFactory")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local ScrollMapEvent = require("org.allbinary.layer.event.ScrollMapEvent")
local ScrollMapEventHandler = require("org.allbinary.layer.event.ScrollMapEventHandler")
local BasicGeographicMap = require("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local PlayerGameInput = require("org.allbinary.game.input.PlayerGameInput")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

local ScrollMapPlayerGameInput = {}
ScrollMapPlayerGameInput.__index = ScrollMapPlayerGameInput
ScrollMapPlayerGameInput.className = "ScrollMapPlayerGameInput"
setmetatable(ScrollMapPlayerGameInput, {__index = PlayerGameInput})

function ScrollMapPlayerGameInput:_init_fields()
    self.inputProcessorArray = java_new_array(nil, InputFactory.getInstance().MAX)
    self.border = 150
    self.inputList = nil
    self.isSingleKeyProcessing = Features.getInstance():isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS) or Features.getInstance():isFeature(InputFeatureFactory.getInstance().SINGLE_KEY_PRESS)
    self.geographicMapInterface = nil
    self.maxBottom = 0
    self.maxRight = 0
    self.scrollMapEvent = ScrollMapEvent.new(self)
end


function ScrollMapPlayerGameInput.new(geographicMapInterface, list, playerInputId)
    local self = setmetatable(PlayerGameInput.new(list, BasicArrayListD.new(), playerInputId), ScrollMapPlayerGameInput)
    self:_init_fields()
        -- super(...) made self above
        self:initInputProcessors()
        self.geographicMapInterface = geographicMapInterface
        self.inputList = list
        self:init()
    return self
end


-- throws Exception
function ScrollMapPlayerGameInput:move(dx, dy)
        local terrainTiledLayer = self.geographicMapInterface:getAllBinaryTiledLayer()
        terrainTiledLayer:moveDXY(-dx, -dy)
        self.scrollMapEvent:setDxDy(-dx, -dy)
        ScrollMapEventHandler.getInstance():fireEvent(self.scrollMapEvent)
end


function ScrollMapPlayerGameInput:init()
        self.maxBottom = self:getSpecialHeight()
        self.maxRight = self:getSpecialWidth()
end


-- throws Exception
function ScrollMapPlayerGameInput:scrollMiddleX()
        local terrainTiledLayer = self.geographicMapInterface:getAllBinaryTiledLayer()
        local displayInfo = DisplayInfoSingleton.getInstance()
        self:move(-terrainTiledLayer:getXP(), 0)
        if terrainTiledLayer:getWidth() < displayInfo:getLastWidth() then
            local diffX = ((((displayInfo:getLastWidth() - terrainTiledLayer:getWidth())) // (1 << (1))))
            self:move(-diffX, 0)
        else
            local diffX = ((((terrainTiledLayer:getWidth() - displayInfo:getLastWidth())) // (1 << (1))))
            self:move(diffX, 0)
        end
end


-- throws Exception
function ScrollMapPlayerGameInput:scrollY(anchor)
        local terrainTiledLayer = self.geographicMapInterface:getAllBinaryTiledLayer()
        local displayInfo = DisplayInfoSingleton.getInstance()
        if anchor == Graphics.TOP then
            self.logUtil:putF("Top", self, "scrollY")
        elseif anchor == Graphics.BOTTOM then
            self.logUtil:putF("Bottom", self, "scrollY")
            local diffY = (terrainTiledLayer:getHeight() - displayInfo:getLastHeight())
            self:move(0, diffY)
        elseif anchor == Graphics.VCENTER then
            self.logUtil:putF("Center", self, "scrollY")
            local diffY = (terrainTiledLayer:getHeight() - displayInfo:getLastHeight()) / 2
            self:move(0, diffY)
        else
            error(java_exception("Exception", "No Such Anchor Supported"), 0)
        end
end


-- throws Exception
function ScrollMapPlayerGameInput:up()
        local y = self.geographicMapInterface:getAllBinaryTiledLayer():getYP() - 10
        if self:keepOnMapMinY(y) then
            self:move(0, -10)
        end
end


-- throws Exception
function ScrollMapPlayerGameInput:down()
        local y = -self.geographicMapInterface:getAllBinaryTiledLayer():getYP() + 10
        if self:keepOnMapMaxY(y) then
            self:move(0, 10)
        end
end


-- throws Exception
function ScrollMapPlayerGameInput:right()
        local x = self.geographicMapInterface:getAllBinaryTiledLayer():getYP() + 10
        if self:keepOnMapMinX(x) then
            self:move(10, 0)
        end
end


-- throws Exception
function ScrollMapPlayerGameInput:left()
        local x = -self.geographicMapInterface:getAllBinaryTiledLayer():getYP() - 10
        if self:keepOnMapMaxX(x) then
            self:move(-10, 0)
        end
end


function ScrollMapPlayerGameInput:initInputProcessors()
        self.inputProcessorArray[Canvas.UP + 1] = ScrollMapUpGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.DOWN + 1] = ScrollMapDownGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.KEY_NUM9 + 1] = ScrollMapRightGameInputProcessor.new(self)
        self.inputProcessorArray[Canvas.KEY_NUM7 + 1] = ScrollMapLeftGameInputProcessor.new(self)
        GameInputProcessorUtil.init(self.inputProcessorArray)
end


-- throws Exception
function ScrollMapPlayerGameInput:processInputKey(key)
        self.inputProcessorArray[key + 1]:processEvent(AllBinaryGameLayerManager.getNullInstance(), GameKeyEvent.NONE)
end


-- throws Exception
function ScrollMapPlayerGameInput:processInput(layerManager)
        local try_ok, try_error = pcall(function()
            local size = self.inputList:size()
            local key = 0
            for index = 0, size - 1 do
                local gameKeyEvent = self.inputList:get(index)
                key = gameKeyEvent:getKey()
                self:processInputKey(key)
            end
            if self.isSingleKeyProcessing then
                self:clear()
            else
                self:update()
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.gameInputStrings.PROCESS_INPUT, e)
        end
end


function ScrollMapPlayerGameInput:getSpecialHeight()
        local terrainTiledLayer = self.geographicMapInterface:getAllBinaryTiledLayer()
        local displayInfo = DisplayInfoSingleton.getInstance()
        if terrainTiledLayer:getHeight() > displayInfo:getLastHeight() then
            return terrainTiledLayer:getHeight() - displayInfo:getLastHeight()
        else
            return displayInfo:getLastHeight() - terrainTiledLayer:getHeight() + terrainTiledLayer:getCellHeight()
        end
end


function ScrollMapPlayerGameInput:getSpecialWidth()
        local terrainTiledLayer = self.geographicMapInterface:getAllBinaryTiledLayer()
        local displayInfo = DisplayInfoSingleton.getInstance()
        if terrainTiledLayer:getWidth() > displayInfo:getLastWidth() then
            return terrainTiledLayer:getWidth() - displayInfo:getLastWidth()
        else
            return displayInfo:getLastWidth() - terrainTiledLayer:getWidth() + terrainTiledLayer:getCellWidth()
        end
end


function ScrollMapPlayerGameInput:keepOnMapMaxY(newY)
        local y = self.geographicMapInterface:getAllBinaryTiledLayer():getYP()
        if y > self.maxBottom + self.border then
            return false
        else
            return true
        end
end


function ScrollMapPlayerGameInput:keepOnMapMinY(newY)
        local y = self.geographicMapInterface:getAllBinaryTiledLayer():getYP()
        if y < -self.border then
            return false
        else
            return true
        end
end


function ScrollMapPlayerGameInput:keepOnMapMaxX(newX)
        local x = self.geographicMapInterface:getAllBinaryTiledLayer():getXP()
        if x < -self.maxRight - self.border then
            return false
        else
            return true
        end
end


function ScrollMapPlayerGameInput:keepOnMapMinX(newX)
        local x = self.geographicMapInterface:getAllBinaryTiledLayer():getXP()
        if x > self.border then
            return false
        else
            return true
        end
end

return ScrollMapPlayerGameInput

