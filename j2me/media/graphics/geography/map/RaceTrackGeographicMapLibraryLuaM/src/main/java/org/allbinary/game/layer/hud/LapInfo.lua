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
-- package org.allbinary.game.layer.hud

local LapInfo = {}
package.loaded["org.allbinary.game.layer.hud.LapInfo"] = LapInfo

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")

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

-- class table LapInfo is declared before the requires
LapInfo.__index = LapInfo
LapInfo.className = "LapInfo"
LapInfo.javaClassName = "org.allbinary.game.layer.hud.LapInfo"

function LapInfo:_init_fields()
    if self.numberOfLaps == nil then self.numberOfLaps = 0 end
    if self.totalLaps == nil then self.totalLaps = 0 end
end


function LapInfo._jinit(self, totalLaps)
    LapInfo._init_fields(self)
        self.totalLaps = totalLaps
        self.numberOfLaps = 1
    return self
end

function LapInfo.new(...)
    local self = setmetatable({}, LapInfo)
    LapInfo._jinit(self, ...)
    return self
end


function LapInfo:add()
        self.numberOfLaps = self.numberOfLaps + 1
end


function LapInfo:getCurrentLap()
        return self.numberOfLaps
end


function LapInfo:getTotalLaps()
        return self.totalLaps
end


function LapInfo:isDone()
        if self.numberOfLaps >= self.totalLaps then
            return true
        end
        return false
end


function LapInfo:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("isDone: ")
        stringBuffer:appendboolean(self:isDone())
        stringBuffer:append(" CurrentLap: ")
        stringBuffer:appendint(self:getCurrentLap())
        stringBuffer:append(" Total Laps: ")
        stringBuffer:appendint(self:getTotalLaps())
        return tostring(stringBuffer)
end
LapInfo.__tostring = function(self) return self:toString() end

LapInfo.NULL_LAP_INFO = LapInfo.new(-1)

return LapInfo

