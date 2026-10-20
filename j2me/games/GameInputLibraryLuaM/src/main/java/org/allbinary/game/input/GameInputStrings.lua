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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameInputStrings = {}
GameInputStrings.__index = GameInputStrings
GameInputStrings.className = "GameInputStrings"

function GameInputStrings:_init_fields()
    self.PROCESS_INPUT = "processInput"
    self.KEY_PRESSED = "keyPressed"
    self.KEY_RELEASED = "keyReleased"
    self.KEY_REPEATED = "keyRepeated"
    self.ON_PRESS_GAME_KEY = "onPressGameKeyEvent"
    self.ON_DOWN_GAME_KEY = "onDownGameKeyEvent"
    self.ON_UP_GAME_KEY = "onUpGameKeyEvent"
    self.NO_KEY = "Key Code Not Mapped For Game: "
    self.ADD_KEY_EVENT = "addGameKeyEvent"
    self.REMOVE_KEY_EVENT = "removeGameKeyEvent"
    self.STRAFE_LEFT = "strafeLeft"
    self.STRAFE_RIGHT = "strafeRight"
    self.PROCESS_MOTION_INPUT = "processMotionInput"
    self.UDPATE_CURRENT_TOUCH_INPUT_FACTORY = "updateCurrentTouchInputFactory"
    self.ENABLE_PLAYER_GAME_INPUTS = "Enabling PlayerGameInputs: "
    self.ENABLE_PLAYER_GAME_INPUT = "Enabling PlayerGameInput: "
end

function GameInputStrings.new()
    local self = setmetatable({}, GameInputStrings)
    self:_init_fields()
    return self
end


function GameInputStrings.getInstance()
        return GameInputStrings.instance
end

GameInputStrings.instance = GameInputStrings.new()

return GameInputStrings

