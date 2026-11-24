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

local GameKeyEventFactory = {}
package.loaded["org.allbinary.game.input.event.GameKeyEventFactory"] = GameKeyEventFactory

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

local GameKeyEventSourceInterface = java_lazy("org.allbinary.game.input.GameKeyEventSourceInterface")
local Input = java_lazy("org.allbinary.game.input.Input")
local InputFactory = java_lazy("org.allbinary.game.input.InputFactory")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local GameKeyEvent = java_lazy("org.allbinary.game.input.event.GameKeyEvent")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table GameKeyEventFactory is declared before the requires
GameKeyEventFactory.__index = GameKeyEventFactory
GameKeyEventFactory.className = "GameKeyEventFactory"
GameKeyEventFactory.javaClassName = "org.allbinary.game.input.event.GameKeyEventFactory"

function GameKeyEventFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.TOUCH_BUTTON_SOURCE_ID = 2
    self.MOTION_GESTURE_SOURCE_ID = 3
    self.MAX_SOURCES = 4
    self.ARRAY = java_new_array(nil, self.MAX_SOURCES, InputFactory.getInstance().MAX)
end


function GameKeyEventFactory.getInstance()
        if GameKeyEventFactory.instance_f == NullUtil.getInstance().NULL_OBJECT then
            GameKeyEventFactory.instance_f = GameKeyEventFactory.new()
        end
        return GameKeyEventFactory.instance_f
end


function GameKeyEventFactory._jinit(self)
    GameKeyEventFactory._init_fields(self)
    return self
end

function GameKeyEventFactory.new(...)
    local self = setmetatable({}, GameKeyEventFactory)
    GameKeyEventFactory._jinit(self, ...)
    return self
end


function GameKeyEventFactory:init()
        local nullUtil = NullUtil.getInstance()
        local size = InputFactory.getInstance().MAX
        do
            local index = self.MAX_SOURCES
            while (function() index = index - 1 return index end)() >= 0 do
            do
                local index2 = size
                while (function() index2 = index2 - 1 return index2 end)() >= 0 do
                self.ARRAY[index + 1][index2 + 1] = GameKeyEvent.createEvent(nullUtil.NULL_OBJECT, index, index2)
                end
            end
            end
        end
end


-- throws Exception
function GameKeyEventFactory:getInstanceForKey(anyType, key)
        local gameKeyEvent = self.ARRAY[anyType:getSourceId() + 1][key + 1]
        return gameKeyEvent
end


-- throws Exception
function GameKeyEventFactory:getInstanceForInput(anyType, input)
        local gameKeyEvent = self.ARRAY[anyType:getSourceId() + 1][input:getId() + 1]
        return gameKeyEvent
end

GameKeyEventFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return GameKeyEventFactory

