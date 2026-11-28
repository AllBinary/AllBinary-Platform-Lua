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

local HighScore = {}
package.loaded["org.allbinary.game.score.HighScore"] = HighScore

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

local ByteArrayOutputStream = java_lazy("java.io.ByteArrayOutputStream")
local DataOutputStream = java_lazy("java.io.DataOutputStream")
local GameInfo = java_lazy("org.allbinary.game.GameInfo")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")

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

-- class table HighScore is declared before the requires
HighScore.__index = HighScore
HighScore.className = "HighScore"
HighScore.javaClassName = "org.allbinary.game.score.HighScore"

function HighScore:_init_fields()
    if self.id == nil then self.id = 0 end
    if self.name_f == nil then self.name_f = nil end
    if self.gameInfo == nil then self.gameInfo = nil end
    if self.score == nil then self.score = 0 end
    if self.scoreString == nil then self.scoreString = nil end
end


function HighScore._jinit(self, id, name, gameInfo, score)
    HighScore._init_fields(self)
        self.id = id
        self.name_f = name
        self.gameInfo = gameInfo
        self.score = score
        self.scoreString = tostring(self.score)
    return self
end

function HighScore.new(...)
    local self = setmetatable({}, HighScore)
    HighScore._jinit(self, ...)
    return self
end


function HighScore:getId()
        return self.id
end


function HighScore:getName()
        return self.name_f
end


function HighScore:getScore()
        return self.score
end


-- throws Exception
function HighScore:getAsBytes()
        local byteArrayOutputStream = require("java.io.ByteArrayOutputStream").new()
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
        self.name_f = name
end


function HighScore:toString()
        local commonSeps = CommonSeps.getInstance()
        return tostring(StringMaker.new():append(self.name_f):append(commonSeps.COLON):appendlong(self.score):append(commonSeps.FORWARD_SLASH):append(self.scoreString))
end
HighScore.__tostring = function(self) return self:toString() end

return HighScore

