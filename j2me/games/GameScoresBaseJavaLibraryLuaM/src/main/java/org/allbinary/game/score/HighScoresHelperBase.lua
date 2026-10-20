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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local HighScoresHelperBaseInterface = require("org.allbinary.game.score.HighScoresHelperBaseInterface")

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

local HighScoresHelperBase = {}
HighScoresHelperBase.__index = HighScoresHelperBase
HighScoresHelperBase.className = "HighScoresHelperBase"

function HighScoresHelperBase:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.highScoresArrayP = LastFetchHighScoresFactory.getInstance().highScoresArray
end

function HighScoresHelperBase.new()
    local self = setmetatable({}, HighScoresHelperBase)
    self:_init_fields()
    return self
end


function HighScoresHelperBase:setHighScoresArray(highScoresArrayP)
        if highScoresArrayP ~= nil then
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
        error(java_exception("RuntimeException"), 0)
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

