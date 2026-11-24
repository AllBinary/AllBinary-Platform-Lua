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
-- package org.allbinary.game.ai.path

local BasicDirectionAIHelper = {}
package.loaded["org.allbinary.game.ai.path.BasicDirectionAIHelper"] = BasicDirectionAIHelper

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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local Direction = java_lazy("org.allbinary.direction.Direction")
local DirectionFactory = java_lazy("org.allbinary.direction.DirectionFactory")
local AngleIncrementInfo = java_lazy("org.allbinary.math.AngleIncrementInfo")
local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")

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

-- class table BasicDirectionAIHelper is declared before the requires
BasicDirectionAIHelper.__index = BasicDirectionAIHelper
BasicDirectionAIHelper.className = "BasicDirectionAIHelper"
BasicDirectionAIHelper.javaClassName = "org.allbinary.game.ai.path.BasicDirectionAIHelper"

function BasicDirectionAIHelper:_init_fields()
    if self.name_f == nil then self.name_f = nil end
    if self.angleInfo == nil then self.angleInfo = nil end
end


function BasicDirectionAIHelper._jinit(self, name, angleInfo)
    BasicDirectionAIHelper._init_fields(self)
        self.name_f = name
        self.angleInfo = angleInfo
    return self
end

function BasicDirectionAIHelper.new(...)
    local self = setmetatable({}, BasicDirectionAIHelper)
    BasicDirectionAIHelper._jinit(self, ...)
    return self
end


function BasicDirectionAIHelper:turnAI(frame)
        local keyDirection = -1
        local directionAngle = self.angleInfo:getAngleIncrementInfo():getFrameAngle(frame)
        local angle = self.angleInfo:getAngle()
        local degrees = math.abs(directionAngle - angle)
        if degrees < 180 then
            if angle > directionAngle then
                keyDirection = Canvas.LEFT
            elseif angle < directionAngle then
                keyDirection = Canvas.RIGHT
            end
        else
            if angle > directionAngle then
                keyDirection = Canvas.RIGHT
            elseif angle < directionAngle then
                keyDirection = Canvas.LEFT
            end
        end
        return keyDirection
end


function BasicDirectionAIHelper:getAIKeyPressed(frame)
        local angle = java_int(self.angleInfo:getAngleIncrementInfo():getFrameAngle(math.tointeger(frame // 1)))
        if self.angleInfo:getAngle() ~= angle then
            return self:turnAI(math.tointeger(frame // 1))
        else
            return Canvas.UP
        end
end


function BasicDirectionAIHelper:getAIKeyPressedFromDirection(geographicMapDirectionData)
        local keyDirection = -1
        local angleIncrementInfo = self.angleInfo:getAngleIncrementInfo()
        local directionFactory = DirectionFactory.getInstance()
        if geographicMapDirectionData == directionFactory.DOWN then
            keyDirection = self:getAIKeyPressed(angleIncrementInfo.DOWN_FRAME)
        elseif geographicMapDirectionData == directionFactory.UP then
            keyDirection = self:getAIKeyPressed(angleIncrementInfo.UP_FRAME)
        elseif geographicMapDirectionData == directionFactory.LEFT then
            keyDirection = self:getAIKeyPressed(angleIncrementInfo.LEFT_FRAME)
        elseif geographicMapDirectionData == directionFactory.RIGHT then
            keyDirection = self:getAIKeyPressed(angleIncrementInfo.RIGHT_FRAME)
        end
        return keyDirection
end


function BasicDirectionAIHelper:getAngleInfoP()
        return self.angleInfo
end


function BasicDirectionAIHelper:getName()
        return self.name_f
end

return BasicDirectionAIHelper

