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

local HighScoreCommandsBaseFactory = {}
package.loaded["org.allbinary.game.score.HighScoreCommandsBaseFactory"] = HighScoreCommandsBaseFactory

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

local Command = java_lazy("javax.microedition.lcdui.Command")
local J2MEUtil = java_lazy("org.allbinary.J2MEUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table HighScoreCommandsBaseFactory is declared before the requires
HighScoreCommandsBaseFactory.__index = HighScoreCommandsBaseFactory
HighScoreCommandsBaseFactory.className = "HighScoreCommandsBaseFactory"
HighScoreCommandsBaseFactory.javaClassName = "org.allbinary.game.score.HighScoreCommandsBaseFactory"

function HighScoreCommandsBaseFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.HIGH_SCORE_COMMANDS == nil then self.HIGH_SCORE_COMMANDS = nil end
end


function HighScoreCommandsBaseFactory._jinit(self, HIGH_SCORE_COMMANDS)
    HighScoreCommandsBaseFactory._init_fields(self)
        self.HIGH_SCORE_COMMANDS = HIGH_SCORE_COMMANDS
    return self
end

function HighScoreCommandsBaseFactory.new(...)
    local self = setmetatable({}, HighScoreCommandsBaseFactory)
    HighScoreCommandsBaseFactory._jinit(self, ...)
    return self
end


function HighScoreCommandsBaseFactory:isHighScoreCommand(command)
        for index = (self.HIGH_SCORE_COMMANDS.n or #self.HIGH_SCORE_COMMANDS) - 1, 0, -1 do
            if rawequal(command, self.HIGH_SCORE_COMMANDS[index + 1]) then
                return true
            end
        end
        return false
end


-- throws Exception
function HighScoreCommandsBaseFactory:getIndex(command)
        for index = (self.HIGH_SCORE_COMMANDS.n or #self.HIGH_SCORE_COMMANDS) - 1, 0, -1 do
            if rawequal(command, self.HIGH_SCORE_COMMANDS[index + 1]) then
                return index
            end
        end
        error(require("java.lang.Exception").new("No Such Command"), 0)
end

return HighScoreCommandsBaseFactory

