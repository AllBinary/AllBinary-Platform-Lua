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

local ScoreComparator = {}
package.loaded["org.allbinary.game.score.ScoreComparator"] = ScoreComparator

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

local ByteArrayInputStream = java_lazy("java.io.ByteArrayInputStream")
local DataInputStream = java_lazy("java.io.DataInputStream")
-- local EOFException = require("java.io.EOFException")
-- local IOException = require("java.io.IOException")
local RecordComparator = java_lazy("javax.microedition.rms.RecordComparator")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table ScoreComparator is declared before the requires
ScoreComparator.__index = ScoreComparator
ScoreComparator.className = "ScoreComparator"
ScoreComparator.javaClassName = "org.allbinary.game.score.ScoreComparator"
ScoreComparator.java_implements = " RecordComparator "
ScoreComparator.java_interfaces = function() return {RecordComparator} end

function ScoreComparator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.isHighestBest == nil then self.isHighestBest = false end
end


function ScoreComparator._jinit(self, isHighestBest)
    ScoreComparator._init_fields(self)
        self.isHighestBest = isHighestBest
    return self
end

function ScoreComparator.new(...)
    local self = setmetatable({}, ScoreComparator)
    ScoreComparator._jinit(self, ...)
    return self
end


function ScoreComparator:getBestScore()
        return (function() if self.isHighestBest then return require("java.lang.Long").MAX_VALUE else return 0 end end)()
end


function ScoreComparator:compare(recordOne, recordTwo)
        local byteArrayInputStreamOne = ByteArrayInputStream.new(recordOne)
        local inputStreamOne = DataInputStream.new(byteArrayInputStreamOne)
        local byteArrayInputStreamTwo = ByteArrayInputStream.new(recordTwo)
        local inputStreamTwo = DataInputStream.new(byteArrayInputStreamTwo)
        local scoreOne = 0
        local scoreTwo = 0
        local try_ok, try_error, try_value = pcall(function()
            inputStreamOne:readUTF()
            inputStreamTwo:readUTF()
            scoreOne = inputStreamOne:readLong()
            scoreTwo = inputStreamTwo:readLong()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "compare", e)
        end
        if self.isHighestBest then
            return self:getHighTooLow(scoreOne, scoreTwo)
        else
            return self:getLowTooHigh(scoreOne, scoreTwo)
        end
end


function ScoreComparator:getHighTooLow(scoreOne, scoreTwo)
        if scoreOne > scoreTwo then
            return RecordComparator.PRECEDES
        elseif scoreOne < scoreTwo then
            return RecordComparator.FOLLOWS
        else
            return RecordComparator.EQUIVALENT
        end
end


function ScoreComparator:getLowTooHigh(scoreOne, scoreTwo)
        if scoreOne < scoreTwo then
            return RecordComparator.PRECEDES
        elseif scoreOne > scoreTwo then
            return RecordComparator.FOLLOWS
        else
            return RecordComparator.EQUIVALENT
        end
end

return ScoreComparator

