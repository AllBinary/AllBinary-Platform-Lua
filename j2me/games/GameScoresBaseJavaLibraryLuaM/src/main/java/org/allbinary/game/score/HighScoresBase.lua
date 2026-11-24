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

local HighScoresBase = {}
package.loaded["org.allbinary.game.score.HighScoresBase"] = HighScoresBase

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

local GameInfo = java_lazy("org.allbinary.game.GameInfo")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local HighScoresFactoryInterface = require("org.allbinary.game.score.HighScoresFactoryInterface")
local HighScoresHelperBaseInterface = java_lazy("org.allbinary.game.score.HighScoresHelperBaseInterface")
local HighScoresResultsListener = java_lazy("org.allbinary.game.score.HighScoresResultsListener")

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

-- class table HighScoresBase is declared before the requires
HighScoresBase.__index = HighScoresBase
HighScoresBase.className = "HighScoresBase"
HighScoresBase.javaClassName = "org.allbinary.game.score.HighScoresBase"
HighScoresBase.java_implements = " HighScoresFactoryInterface "
HighScoresBase.java_interfaces = function() return {HighScoresFactoryInterface} end

function HighScoresBase:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
end


function HighScoresBase._jinit(self)
    HighScoresBase._init_fields(self)
    return self
end

function HighScoresBase.new(...)
    local self = setmetatable({}, HighScoresBase)
    HighScoresBase._jinit(self, ...)
    return self
end


function HighScoresBase:fetchHighScores(gameInfo, highScoresResultsListener)
        error(require("java.lang.RuntimeException").new(), 0)
end


function HighScoresBase:fetchHighScoresPreload(gameInfo, highScoresResultsListener, preload)
        error(require("java.lang.RuntimeException").new(), 0)
end


function HighScoresBase:createHighScoresHelper()
        error(require("java.lang.RuntimeException").new(), 0)
end

return HighScoresBase

