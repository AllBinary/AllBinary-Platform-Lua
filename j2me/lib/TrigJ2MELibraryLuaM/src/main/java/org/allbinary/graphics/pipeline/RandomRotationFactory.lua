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
local AngleFactory = require("org.allbinary.math.AngleFactory")
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

local RandomRotationFactory = {}
RandomRotationFactory.__index = RandomRotationFactory
RandomRotationFactory.className = "RandomRotationFactory"

function RandomRotationFactory:_init_fields()
    self.myRandomFactory = MyRandomFactory.getInstance()
    self.angleFactory = AngleFactory.getInstance()
end

function RandomRotationFactory.new()
    local self = setmetatable({}, RandomRotationFactory)
    self:_init_fields()
    return self
end


function RandomRotationFactory.getInstance()
        return RandomRotationFactory.instance
end


-- throws Exception
function RandomRotationFactory:getInstanceList(vector, howMuch)
        local graphicsPipe = BasicGraphicsPipeline.new(vector)
        graphicsPipe:createMatrix()
        graphicsPipe:rotateToAngle(self.angleFactory:getAt(self:getNextRandomAngle(howMuch)))
        return graphicsPipe:getMatrix()
end


function RandomRotationFactory:getNextRandomAngle(howMuch)
        return self.myRandomFactory:getNextInt(howMuch * 10)
end

RandomRotationFactory.instance = RandomRotationFactory.new()

return RandomRotationFactory

