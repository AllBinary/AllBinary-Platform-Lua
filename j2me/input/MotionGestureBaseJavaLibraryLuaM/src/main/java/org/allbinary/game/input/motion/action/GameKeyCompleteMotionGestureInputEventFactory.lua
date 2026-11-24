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
-- package org.allbinary.game.input.motion.action

local GameKeyCompleteMotionGestureInputEventFactory = {}
package.loaded["org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEventFactory"] = GameKeyCompleteMotionGestureInputEventFactory

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local GameKeyCompleteMotionGestureInputEvent = java_lazy("org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEvent")

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

-- class table GameKeyCompleteMotionGestureInputEventFactory is declared before the requires
GameKeyCompleteMotionGestureInputEventFactory.__index = GameKeyCompleteMotionGestureInputEventFactory
GameKeyCompleteMotionGestureInputEventFactory.className = "GameKeyCompleteMotionGestureInputEventFactory"
GameKeyCompleteMotionGestureInputEventFactory.javaClassName = "org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEventFactory"

function GameKeyCompleteMotionGestureInputEventFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.eventList = BasicArrayListD.new()
end

function GameKeyCompleteMotionGestureInputEventFactory._jinit(self)
    GameKeyCompleteMotionGestureInputEventFactory._init_fields(self)
    return self
end

function GameKeyCompleteMotionGestureInputEventFactory.new()
    return GameKeyCompleteMotionGestureInputEventFactory._jinit(setmetatable({}, GameKeyCompleteMotionGestureInputEventFactory))
end


function GameKeyCompleteMotionGestureInputEventFactory.getInstance()
        return GameKeyCompleteMotionGestureInputEventFactory.SINGLETON
end


function GameKeyCompleteMotionGestureInputEventFactory:add(gameKeyCompleteMotionGestureInputEvent)
        self.eventList:add(gameKeyCompleteMotionGestureInputEvent)
end


function GameKeyCompleteMotionGestureInputEventFactory:updateAll()
        self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().START_LABEL):appendint(self.eventList:size())), self, "updateAll")
        for index = self.eventList:size() - 1, 0, -1 do
            local gameKeyCompleteMotionGestureInputEvent = self.eventList.objectArray[index + 1]
            gameKeyCompleteMotionGestureInputEvent:update()
        end
end

GameKeyCompleteMotionGestureInputEventFactory.SINGLETON = GameKeyCompleteMotionGestureInputEventFactory.new()

return GameKeyCompleteMotionGestureInputEventFactory

