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
-- package org.allbinary.game.input.event

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

local GameKeyEvent = {}
GameKeyEvent.__index = GameKeyEvent
GameKeyEvent.className = "GameKeyEvent"
setmetatable(GameKeyEvent, {__index = AllBinaryEventObject})

function GameKeyEvent:_init_fields()
    self.sourceId = nil
    self.repeated = false
    self.key = nil
    self.gameActionKey = 0
    self.originalKey = 0
end


function GameKeyEvent.createEvent(anyType, sourceId, key)
        return GameKeyEvent.new(anyType, sourceId, 0, 0, key, false)
end


function GameKeyEvent.new(anyType, sourceId, originalKey, gameActionKey, key, repeated)
    local self = setmetatable(AllBinaryEventObject.new(anyType), GameKeyEvent)
    self:_init_fields()
        -- super(...) made self above
        self.sourceId = sourceId
        self:setOriginalKey(originalKey)
        self.key = key
        self:setGameActionKey(gameActionKey)
        self:setRepeatEvents(repeated)
    return self
end


function GameKeyEvent:init(anyType)
        self:setSource(anyType)
end


function GameKeyEvent:setRepeatEvents(repeated)
        self.repeated = repeated
end


function GameKeyEvent:hasRepeatEvents()
        return self.repeated
end


function GameKeyEvent:getKey()
        return self.key
end


function GameKeyEvent:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("\nKey: ")
        stringBuffer:appendint(self:getKey())
        return tostring(stringBuffer)
end
GameKeyEvent.__tostring = function(self) return self:toString() end


function GameKeyEvent:getOriginalKey()
        return self.originalKey
end


function GameKeyEvent:setOriginalKey(originalKey)
        self.originalKey = originalKey
end


function GameKeyEvent:getGameActionKey()
        return self.gameActionKey
end


function GameKeyEvent:setGameActionKey(gameActionKey)
        self.gameActionKey = gameActionKey
end


function GameKeyEvent:getSourceId()
        return self.sourceId
end

GameKeyEvent.NONE = GameKeyEvent.new(NullUtil.getInstance().NULL_OBJECT, -1, -1, -1, -1, false)

return GameKeyEvent

