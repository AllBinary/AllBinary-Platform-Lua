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
-- package org.allbinary.input.automation

-- local awt = require("java.awt")
-- local HelpSet = require("javax.help.HelpSet")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbstractInputRobot = {}
AbstractInputRobot.__index = AbstractInputRobot
AbstractInputRobot.className = "AbstractInputRobot"

function AbstractInputRobot:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.helpSet = nil
end


function AbstractInputRobot.new(helpSet)
    local self = setmetatable({}, AbstractInputRobot)
    self:_init_fields()
        self:setHelpSet(helpSet)
    return self
end


function AbstractInputRobot:getHelpSet()
        return self.helpSet
end


function AbstractInputRobot:mouseMove(point)
        self:mouseMove(point.x, point.y)
        self.logUtil:putF("Moved Mouse To: x: " .. tostring(point.x) .. " y: " .. tostring(point.y), self, "moveMouse")
end


-- throws Exception
function AbstractInputRobot:mouseMoveToTarget(rectangle, x, y)
        local point = PointHelper.getCenterPoint(rectangle)
        self:mouseMove(point.x + x, point.y + y)
        self.logUtil:putF("Moved Mouse To: x: " .. tostring(point.x) .. " y: " .. tostring(point.y) .. " in the middle of: " .. tostring(rectangle), self, "moveMouseToTarget")
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function AbstractInputRobot:mouseMoveToTarget(rectangle)
        self:mouseMoveToTarget(rectangle, 0, 0)
end


-- Java overloaded method: Lua keeps the last definition
function AbstractInputRobot:mouseMove(x, y)
        error(java_exception("RuntimeException"), 0)
end


function AbstractInputRobot:setHelpSet(helpSet)
        self.helpSet = helpSet
end

return AbstractInputRobot

