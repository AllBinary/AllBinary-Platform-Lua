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

local Features = require("org.allbinary.game.configuration.feature.Features")
local InputFeatureFactory = require("org.allbinary.game.configuration.feature.InputFeatureFactory")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameInput = {}
GameInput.__index = GameInput
GameInput.className = "GameInput"

function GameInput:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.gameKeyEventList = nil
    self.removalGameKeyEventList = nil
    self.isRemoveDuplicateKeyPresses = nil
end


function GameInput.new(gameKeyEventList, removalGameKeyEventList)
    local self = setmetatable({}, GameInput)
    self:_init_fields()
        self.gameKeyEventList = gameKeyEventList
        self.removalGameKeyEventList = removalGameKeyEventList
        self.isRemoveDuplicateKeyPresses = Features.getInstance():isFeature(InputFeatureFactory.getInstance().REMOVE_DUPLICATE_KEY_PRESSES)
    return self
end


function GameInput:add(gameKeyEvent)
        if self.isRemoveDuplicateKeyPresses and self.gameKeyEventList:contains(gameKeyEvent) then
            return
        end
        if gameKeyEvent ~= nil then
            self.gameKeyEventList:add(gameKeyEvent)
        else
            self.logUtil:putF("Danger Passed Null GameKeyEvent", self, self.commonStrings.ADD)
        end
end


function GameInput:addForRemoval(gameKeyEvent)
        self.removalGameKeyEventList:add(gameKeyEvent)
end


function GameInput:isForRemoval(gameKeyEvent)
        return self.removalGameKeyEventList:contains(gameKeyEvent)
end


function GameInput:clear()
        self.gameKeyEventList:clear()
end


function GameInput:removeNonAIInputGameKeyEvents()
        local list = self.gameKeyEventList
        local gameKeyEvent = nil
        do
            local index = list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            gameKeyEvent = list.objectArray[index + 1]
            if gameKeyEvent:getSourceId() ~= 1 then
                list:removeAt(index)
            end
            end
        end
end


function GameInput:update()
        local removeList = self.removalGameKeyEventList
        local list = self.gameKeyEventList
        local size = removeList:size()
        for index = 0, size - 1 do
            local anyType = removeList.objectArray[index + 1]
            do
                local index2 = list:size()
                while (function() index2 = index2 - 1 return index2 end)() >= 0 do
                if list.objectArray[index2 + 1] == anyType then
                    list:removeAt(index2)
                end
                end
            end
        end
        removeList:clear()
end


function GameInput:getRemovalGameKeyEventList()
        return self.removalGameKeyEventList
end


function GameInput:getGameKeyEventList()
        return self.gameKeyEventList
end

return GameInput

