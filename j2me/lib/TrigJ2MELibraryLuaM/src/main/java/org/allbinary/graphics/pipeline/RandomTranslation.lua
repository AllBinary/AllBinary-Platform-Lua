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
-- package org.allbinary.graphics.pipeline

local MyRandomFactory = require("org.allbinary.game.rand.MyRandomFactory")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RandomTranslation = {}
RandomTranslation.__index = RandomTranslation
RandomTranslation.className = "RandomTranslation"

function RandomTranslation.new()
    local self = setmetatable({}, RandomTranslation)
    return self
end


-- throws Exception
function RandomTranslation.getInstance(vector, howMuch)
        local myRandomFactory = MyRandomFactory.getInstance()
        local x = -myRandomFactory:getNextInt(howMuch)
        local y = myRandomFactory:getNextInt(howMuch)
        local graphicsPipe = BasicGraphicsPipeline.new(vector)
        graphicsPipe:createMatrix()
        graphicsPipe:translate(x, y)
        return graphicsPipe:getMatrix()
end

return RandomTranslation

