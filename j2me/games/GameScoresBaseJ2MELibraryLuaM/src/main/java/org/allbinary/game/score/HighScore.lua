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

-- local ByteArrayOutputStream = require("java.io.ByteArrayOutputStream")
-- local DataOutputStream = require("java.io.DataOutputStream")
local GameInfo = require("org.allbinary.game.GameInfo")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")

-- Java library java.io.ByteArrayOutputStream
local function java_byte_array_output_stream()
    local stream = {buffer = {}}
    function stream:write(value, offset, length)
        if type(value) == "table" then
            local first = (offset or 0) + 1
            local last = first + (length or #value) - 1
            for index = first, last do self.buffer[#self.buffer + 1] = string.char(value[index] % 256) end
        elseif type(value) == "number" then
            self.buffer[#self.buffer + 1] = string.char(value % 256)
        else
            self.buffer[#self.buffer + 1] = tostring(value)
        end
    end
    function stream:toString() return table.concat(self.buffer) end
    function stream:size() return #table.concat(self.buffer) end
    function stream:reset() self.buffer = {} end
    function stream:flush() end
    function stream:close() end
    return setmetatable(stream, {__tostring = function(self) return table.concat(self.buffer) end})
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

local HighScore = {}
HighScore.__index = HighScore
HighScore.className = "HighScore"

function HighScore:_init_fields()
    self.id = nil
    self.name = nil
    self.gameInfo = nil
    self.score = nil
    self.scoreString = nil
end


function HighScore.new(id, name, gameInfo, score)
    local self = setmetatable({}, HighScore)
    self:_init_fields()
        self.id = id
        self.name = name
        self.gameInfo = gameInfo
        self.score = score
        self.scoreString = tostring(self.score)
    return self
end


function HighScore:getId()
        return self.id
end


function HighScore:getName()
        return self.name
end


function HighScore:getScore()
        return self.score
end


-- throws Exception
function HighScore:getAsBytes()
        local byteArrayOutputStream = java_byte_array_output_stream()
        local outputStream = DataOutputStream.new(byteArrayOutputStream)
        outputStream:writeUTF(self:getName())
        outputStream:writeLong(self:getScore())
        return byteArrayOutputStream:toByteArray()
end


function HighScore:getGameInfo()
        return self.gameInfo
end


function HighScore:getScoreString()
        return self.scoreString
end


function HighScore:setName(name)
        self.name = name
end


function HighScore:toString()
        local commonSeps = CommonSeps.getInstance()
        return tostring(StringMaker.new():append(self.name):append(commonSeps.COLON):appendlong(self.score):append(commonSeps.FORWARD_SLASH):append(self.scoreString))
end
HighScore.__tostring = function(self) return self:toString() end

return HighScore

