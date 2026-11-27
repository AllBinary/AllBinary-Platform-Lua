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

local ReleaseHelper = {}
package.loaded["org.allbinary.input.motion.button.ReleaseHelper"] = ReleaseHelper

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

local GameKeyEvent = java_lazy("org.allbinary.game.input.event.GameKeyEvent")
local TouchButtonInput = java_lazy("org.allbinary.input.motion.button.TouchButtonInput")
local TouchButtonRecognizer = java_lazy("org.allbinary.input.motion.button.TouchButtonRecognizer")

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

-- class table ReleaseHelper is declared before the requires
ReleaseHelper.__index = ReleaseHelper
ReleaseHelper.className = "ReleaseHelper"
ReleaseHelper.javaClassName = "org.allbinary.input.motion.button.ReleaseHelper"

function ReleaseHelper:_init_fields()
    if self.touchButtonRecognizer == nil then self.touchButtonRecognizer = nil end
end


function ReleaseHelper._jinit(self, touchButtonRecognizer)
    ReleaseHelper._init_fields(self)
        self.touchButtonRecognizer = touchButtonRecognizer
    return self
end

function ReleaseHelper.new(...)
    local self = setmetatable({}, ReleaseHelper)
    ReleaseHelper._jinit(self, ...)
    return self
end


-- throws Exception
function ReleaseHelper:release(touchButtonInput, deviceId)
        local nextTouchButtonInput = nil
        local gameKeyEvent = nil
        for index = self.touchButtonRecognizer.currentlyPressedTouchButtonSingleton:size() - 1, 0, -1 do
            nextTouchButtonInput = self.touchButtonRecognizer.currentlyPressedTouchButtonSingleton:get(index)
            gameKeyEvent = nextTouchButtonInput:getGameKeyEvent()
            self.touchButtonRecognizer.upGameKeyEventHandler:fireEvent(gameKeyEvent)
            self.touchButtonRecognizer.upGameKeyEventHandler:getInstanceForDevice(deviceId):fireEvent(gameKeyEvent)
            self.touchButtonRecognizer.currentlyPressedTouchButtonSingleton:removeAt(index)
        end
end

return ReleaseHelper

