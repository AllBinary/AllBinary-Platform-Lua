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

local HighScores = {}
package.loaded["org.allbinary.game.score.HighScores"] = HighScores

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
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local HighScoresInterface = require("org.allbinary.game.score.HighScoresInterface")
local HighScore = java_lazy("org.allbinary.game.score.HighScore")

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

-- class table HighScores is declared before the requires
HighScores.__index = HighScores
HighScores.className = "HighScores"
HighScores.javaClassName = "org.allbinary.game.score.HighScores"
HighScores.java_implements = " HighScoresInterface "
HighScores.java_interfaces = function() return {HighScoresInterface} end

function HighScores:_init_fields()
    self.orderedHighScoresList = BasicArrayListD.new()
    if self.name_f == nil then self.name_f = nil end
    if self.heading == nil then self.heading = nil end
    self.columnOneHeading = "Name"
    if self.columnTwoHeading == nil then self.columnTwoHeading = nil end
end


function HighScores._jinit(self, name, heading, columnTwoHeading)
    HighScores._init_fields(self)
        self.name_f = name
        self.heading = heading
        self.columnTwoHeading = columnTwoHeading
    return self
end

function HighScores.new(...)
    local self = setmetatable({}, HighScores)
    HighScores._jinit(self, ...)
    return self
end


function HighScores:setList(orderedHighScoresList)
        self.orderedHighScoresList = orderedHighScoresList
end


function HighScores:getList()
        return self.orderedHighScoresList
end


function HighScores:getName()
        return self.name_f
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

