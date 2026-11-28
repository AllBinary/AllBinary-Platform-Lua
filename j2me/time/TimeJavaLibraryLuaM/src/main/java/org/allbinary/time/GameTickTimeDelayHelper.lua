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
-- package org.allbinary.time

local GameTickTimeDelayHelper = {}
package.loaded["org.allbinary.time.GameTickTimeDelayHelper"] = GameTickTimeDelayHelper

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

-- class table GameTickTimeDelayHelper is declared before the requires
GameTickTimeDelayHelper.__index = GameTickTimeDelayHelper
GameTickTimeDelayHelper.className = "GameTickTimeDelayHelper"
GameTickTimeDelayHelper.javaClassName = "org.allbinary.time.GameTickTimeDelayHelper"

function GameTickTimeDelayHelper:_init_fields()
    if self.timeDelta == nil then self.timeDelta = 0 end
    if self.startTime == nil then self.startTime = 0 end
    if self.lastStartTime == nil then self.lastStartTime = 0 end
end


function GameTickTimeDelayHelper._jinit(self, startTime)
    GameTickTimeDelayHelper._init_fields(self)
        self.startTime = startTime
        self.lastStartTime = 0
    return self
end

function GameTickTimeDelayHelper.new(...)
    local self = setmetatable({}, GameTickTimeDelayHelper)
    GameTickTimeDelayHelper._jinit(self, ...)
    return self
end


function GameTickTimeDelayHelper:setStartTime()
        self.startTime = require("java.lang.System").currentTimeMillis()
        return self.startTime
end


function GameTickTimeDelayHelper:loop()
        if rawequal(self.lastStartTime, require("java.lang.Long").MIN_VALUE) then
            self.timeDelta = 0
        else
            self.timeDelta = require("java.lang.System").currentTimeMillis() - self.lastStartTime
        end
end


function GameTickTimeDelayHelper:getTimeFromStart()
        return self.startTime - self.lastStartTime
end

return GameTickTimeDelayHelper

