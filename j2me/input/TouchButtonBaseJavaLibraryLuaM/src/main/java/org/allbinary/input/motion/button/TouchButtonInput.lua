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
-- package org.allbinary.input.motion.button

local GameKey = require("org.allbinary.game.input.GameKey")
local GameKeyEventSourceInterface = require("org.allbinary.game.input.GameKeyEventSourceInterface")
local Input = require("org.allbinary.game.input.Input")
local InputFactory = require("org.allbinary.game.input.InputFactory")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local GameKeyEventFactory = require("org.allbinary.game.input.event.GameKeyEventFactory")
local InputToGameKeyMapping = require("org.allbinary.game.input.mapping.InputToGameKeyMapping")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TouchButtonInput = {}
TouchButtonInput.__index = TouchButtonInput
TouchButtonInput.className = "TouchButtonInput"
setmetatable(TouchButtonInput, {__index = Input})

function TouchButtonInput:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.gameKeyEventFactory = GameKeyEventFactory.getInstance()
    self.TOUCH_BUTTON_SOURCE_ID = self.gameKeyEventFactory.TOUCH_BUTTON_SOURCE_ID
    self.gameKeyEvent = GameKeyEvent.NONE
end


function TouchButtonInput.new(id, name)
    local self = setmetatable(Input.new(id, name), TouchButtonInput)
    self:_init_fields()
        -- super(...) made self above
        local inputFactory = InputFactory.getInstance()
        inputFactory:add(self:getId(), self)
    return self
end


function TouchButtonInput:update(inputToGameKeyMapping)
        local try_ok, try_error = pcall(function()
            local gameKey = inputToGameKeyMapping:getInstance(self:getId())
            self.gameKeyEvent = self.gameKeyEventFactory:getInstanceForInput(self, gameKey)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.UPDATE, e)
        end
end


function TouchButtonInput:getSourceId()
        return self.TOUCH_BUTTON_SOURCE_ID
end


function TouchButtonInput:getGameKeyEvent()
        return self.gameKeyEvent
end

return TouchButtonInput

