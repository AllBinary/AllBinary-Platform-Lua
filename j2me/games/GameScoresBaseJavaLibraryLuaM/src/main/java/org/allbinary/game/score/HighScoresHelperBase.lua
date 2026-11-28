-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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

local HighScoresHelperBase = {}
package.loaded["org.allbinary.game.score.HighScoresHelperBase"] = HighScoresHelperBase

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
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local HighScoresHelperBaseInterface = require("org.allbinary.game.score.HighScoresHelperBaseInterface")
local HighScores = java_lazy("org.allbinary.game.score.HighScores")
local LastFetchHighScoresFactory = java_lazy("org.allbinary.game.score.LastFetchHighScoresFactory")
local NullHighScoresSingletonFactory = java_lazy("org.allbinary.game.score.NullHighScoresSingletonFactory")

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

-- class table HighScoresHelperBase is declared before the requires
HighScoresHelperBase.__index = HighScoresHelperBase
HighScoresHelperBase.className = "HighScoresHelperBase"
HighScoresHelperBase.javaClassName = "org.allbinary.game.score.HighScoresHelperBase"
HighScoresHelperBase.java_implements = " HighScoresHelperBaseInterface "
HighScoresHelperBase.java_interfaces = function() return {HighScoresHelperBaseInterface} end

function HighScoresHelperBase:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.highScoresArrayP = LastFetchHighScoresFactory.getInstance().highScoresArray
end

function HighScoresHelperBase._jinit(self)
    HighScoresHelperBase._init_fields(self)
    return self
end

function HighScoresHelperBase.new()
    return HighScoresHelperBase._jinit(setmetatable({}, HighScoresHelperBase))
end


function HighScoresHelperBase:setHighScoresArray(highScoresArrayP)
        if not rawequal(highScoresArrayP, nil) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(tostring(StringMaker.new():append(commonStrings.START):appendint((highScoresArrayP.n or #highScoresArrayP))), self, "setHighScoresArray")
        else
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.START, self, "setHighScoresArray")
        end
        self.highScoresArrayP = highScoresArrayP
end


function HighScoresHelperBase:getNextHighScores()
        return NullHighScoresSingletonFactory.getInstance()
end


function HighScoresHelperBase:isAnyHighScores()
        error(require("java.lang.RuntimeException").new(), 0)
end


function HighScoresHelperBase:setSelectedHighScores(selectedHighScores)
end


function HighScoresHelperBase:getSelectedHighScores()
        return NullHighScoresSingletonFactory.getInstance()
end


function HighScoresHelperBase:getHighScoresArray()
        return self.highScoresArrayP
end


function HighScoresHelperBase:selectHighScores()
end

return HighScoresHelperBase

