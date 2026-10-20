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

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local HighScoresInterface = require("org.allbinary.game.score.HighScoresInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HighScores = {}
HighScores.__index = HighScores
HighScores.className = "HighScores"

function HighScores:_init_fields()
    self.orderedHighScoresList = BasicArrayListD.new()
    self.name = nil
    self.heading = nil
    self.columnOneHeading = "Name"
    self.columnTwoHeading = nil
end


function HighScores.new(name, heading, columnTwoHeading)
    local self = setmetatable({}, HighScores)
    self:_init_fields()
        self.name = name
        self.heading = heading
        self.columnTwoHeading = columnTwoHeading
    return self
end


function HighScores:setList(orderedHighScoresList)
        self.orderedHighScoresList = orderedHighScoresList
end


function HighScores:getList()
        return self.orderedHighScoresList
end


function HighScores:getName()
        return self.name
end


function HighScores:getTotal()
        return self:getList():size()
end


function HighScores:addHighScore(newHighScore)
        self.orderedHighScoresList:add(newHighScore)
end


function HighScores:getHeading()
        return self.heading
end


function HighScores:getColumnOneHeading()
        return self.columnOneHeading
end


function HighScores:getColumnTwoHeading()
        return self.columnTwoHeading
end


-- throws Exception
function HighScores:isBestScore(newHighScore)
        return false
end


function HighScores:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("HighScores: ")
        stringBuffer:append(self.heading)
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(CommonLabels.getInstance().TOTAL_LABEL)
        stringBuffer:appendint(self.orderedHighScoresList:size())
        return tostring(stringBuffer)
end
HighScores.__tostring = function(self) return self:toString() end

return HighScores

