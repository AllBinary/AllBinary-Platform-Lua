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
-- package org.allbinary.input.motion.touch.action

local GameKey = require("org.allbinary.game.input.GameKey")
local GameKeyFactory = require("org.allbinary.game.input.GameKeyFactory")
local PlatformInputMappingFactory = require("org.allbinary.game.input.PlatformInputMappingFactory")
local GameKeyEventFactory = require("org.allbinary.game.input.event.GameKeyEventFactory")
local GameKeyCompleteMotionGestureInputEvent = require("org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEvent")
local TouchMotionGestureFactory = require("org.allbinary.input.motion.gesture.TouchMotionGestureFactory")
local NullUtil = require("org.allbinary.logic.NullUtil")
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

local ReleaseTouchInputToGameKeyEventAction = {}
ReleaseTouchInputToGameKeyEventAction.__index = ReleaseTouchInputToGameKeyEventAction
ReleaseTouchInputToGameKeyEventAction.className = "ReleaseTouchInputToGameKeyEventAction"
setmetatable(ReleaseTouchInputToGameKeyEventAction, {__index = GameKeyCompleteMotionGestureInputEvent})

function ReleaseTouchInputToGameKeyEventAction:_init_fields()
    self.NONE = GameKeyFactory.getInstance().NONE
end


function ReleaseTouchInputToGameKeyEventAction.getInstance()
        if ReleaseTouchInputToGameKeyEventAction.instance == NullUtil.getInstance().NULL_OBJECT then
            ReleaseTouchInputToGameKeyEventAction.instance = ReleaseTouchInputToGameKeyEventAction.new()
        end
        return ReleaseTouchInputToGameKeyEventAction.instance
end


function ReleaseTouchInputToGameKeyEventAction.new()
    local self = setmetatable(GameKeyCompleteMotionGestureInputEvent.new("Release Action", TouchMotionGestureFactory.getInstance().RELEASED, PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance():getInputMapping()), ReleaseTouchInputToGameKeyEventAction)
    self:_init_fields()
        -- super(...) made self above
        local try_ok, try_error = pcall(function()
            self:setGameKey(self.NONE)
            self:setGameKeyEvent(GameKeyEventFactory.getInstance():getInstanceForInput(self, self.NONE))
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR, e)
        end
    return self
end


function ReleaseTouchInputToGameKeyEventAction:update()
end

ReleaseTouchInputToGameKeyEventAction.instance = NullUtil.getInstance().NULL_OBJECT

return ReleaseTouchInputToGameKeyEventAction

