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

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
-- local DataInputStream = require("java.io.DataInputStream")
-- local EOFException = require("java.io.EOFException")
-- local IOException = require("java.io.IOException")
-- local RecordComparator = require("javax.microedition.rms.RecordComparator")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ScoreComparator = {}
ScoreComparator.__index = ScoreComparator
ScoreComparator.className = "ScoreComparator"

function ScoreComparator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.isHighestBest = nil
end


function ScoreComparator.new(isHighestBest)
    local self = setmetatable({}, ScoreComparator)
    self:_init_fields()
        self.isHighestBest = isHighestBest
    return self
end


function ScoreComparator:getBestScore()
        return (function() if self.isHighestBest then return Long.MAX_VALUE else return 0 end end)()
end


function ScoreComparator:compare(recordOne, recordTwo)
        local byteArrayInputStreamOne = ByteArrayInputStream.new(recordOne)
        local inputStreamOne = DataInputStream.new(byteArrayInputStreamOne)
        local byteArrayInputStreamTwo = ByteArrayInputStream.new(recordTwo)
        local inputStreamTwo = DataInputStream.new(byteArrayInputStreamTwo)
        local scoreOne = 0
        local scoreTwo = 0
        local try_ok, try_error = pcall(function()
            inputStreamOne:readUTF()
            inputStreamTwo:readUTF()
            scoreOne = inputStreamOne:readLong()
            scoreTwo = inputStreamTwo:readLong()
        end)
        if not try_ok then
            local e = try_error
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

