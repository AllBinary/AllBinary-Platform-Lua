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
-- package org.allbinary.game.score

-- local Command = require("javax.microedition.lcdui.Command")
local J2MEUtil = require("org.allbinary.J2MEUtil")
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

local HighScoreCommandsBaseFactory = {}
HighScoreCommandsBaseFactory.__index = HighScoreCommandsBaseFactory
HighScoreCommandsBaseFactory.className = "HighScoreCommandsBaseFactory"

function HighScoreCommandsBaseFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.HIGH_SCORE_COMMANDS = nil
end


function HighScoreCommandsBaseFactory.new(HIGH_SCORE_COMMANDS)
    local self = setmetatable({}, HighScoreCommandsBaseFactory)
    self:_init_fields()
        self.HIGH_SCORE_COMMANDS = HIGH_SCORE_COMMANDS
    return self
end


function HighScoreCommandsBaseFactory:isHighScoreCommand(command)
        for index = (self.HIGH_SCORE_COMMANDS.n or #self.HIGH_SCORE_COMMANDS) - 1, 0, -1 do
            if command == self.HIGH_SCORE_COMMANDS[index + 1] then
                return true
            end
        end
        return false
end


-- throws Exception
function HighScoreCommandsBaseFactory:getIndex(command)
        for index = (self.HIGH_SCORE_COMMANDS.n or #self.HIGH_SCORE_COMMANDS) - 1, 0, -1 do
            if command == self.HIGH_SCORE_COMMANDS[index + 1] then
                return index
            end
        end
        error(java_exception("Exception", "No Such Command"), 0)
end

return HighScoreCommandsBaseFactory

