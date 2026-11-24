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

local GameInputStrings = {}
package.loaded["org.allbinary.game.input.GameInputStrings"] = GameInputStrings

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table GameInputStrings is declared before the requires
GameInputStrings.__index = GameInputStrings
GameInputStrings.className = "GameInputStrings"
GameInputStrings.javaClassName = "org.allbinary.game.input.GameInputStrings"

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

function GameInputStrings._jinit(self)
    GameInputStrings._init_fields(self)
    return self
end

function GameInputStrings.new()
    return GameInputStrings._jinit(setmetatable({}, GameInputStrings))
end


function GameInputStrings.getInstance()
        return GameInputStrings.instance_f
end

GameInputStrings.instance_f = GameInputStrings.new()

return GameInputStrings

