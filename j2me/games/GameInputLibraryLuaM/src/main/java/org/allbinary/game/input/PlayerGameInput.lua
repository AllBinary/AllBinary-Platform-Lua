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

local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local GameKeyEventListenerInterface = require("org.allbinary.game.input.event.GameKeyEventListenerInterface")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local GameInput = require("org.allbinary.game.input.GameInput")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PlayerGameInput = {}
PlayerGameInput.__index = PlayerGameInput
PlayerGameInput.className = "PlayerGameInput"
setmetatable(PlayerGameInput, {__index = GameInput})

function PlayerGameInput:_init_fields()
    self.gameInputStrings = GameInputStrings.getInstance()
    self.playerInputId = nil
end


function PlayerGameInput.new(gameKeyEventList, removalGameKeyEventList, playerInputId)
    local self = setmetatable(GameInput.new(gameKeyEventList, removalGameKeyEventList), PlayerGameInput)
    self:_init_fields()
        -- super(...) made self above
        self.playerInputId = playerInputId
    return self
end


function PlayerGameInput:onPressGameKeyEvent(gameKeyEvent)
        self:add(gameKeyEvent)
        self:addForRemoval(gameKeyEvent)
end


function PlayerGameInput:onDownGameKeyEvent(gameKeyEvent)
        self:add(gameKeyEvent)
end


function PlayerGameInput:onDownKeyEvent(gameKeyEvent)
        self:add(gameKeyEvent)
        self:addForRemoval(gameKeyEvent)
end


function PlayerGameInput:onDownKey(gameKeyEvent)
        PreLogUtil.put(tostring(StringMaker.new():append(CommonLabels.getInstance().START_LABEL):append(tostring(gameKeyEvent))), self, self.gameInputStrings.ON_DOWN_GAME_KEY)
end


function PlayerGameInput:onUpGameKeyEvent(gameKeyEvent)
        self:addForRemoval(gameKeyEvent)
end


function PlayerGameInput:onUpKeyEvent(gameKeyEvent)
end


function PlayerGameInput:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function PlayerGameInput:getPlayerInputId()
        return self.playerInputId
end

return PlayerGameInput

