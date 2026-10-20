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
-- package org.allbinary.media.graphics.geography.map.drop

local BaseDropCellPositionGenerator = require("org.allbinary.media.graphics.geography.map.drop.BaseDropCellPositionGenerator")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullDropCellPositionGenerator = {}
NullDropCellPositionGenerator.__index = NullDropCellPositionGenerator
NullDropCellPositionGenerator.className = "NullDropCellPositionGenerator"
setmetatable(NullDropCellPositionGenerator, {__index = BaseDropCellPositionGenerator})

function NullDropCellPositionGenerator.new()
    local self = setmetatable(BaseDropCellPositionGenerator.new(), NullDropCellPositionGenerator)
    return self
end


function NullDropCellPositionGenerator.getInstance()
        return NullDropCellPositionGenerator.instance
end

NullDropCellPositionGenerator.instance = NullDropCellPositionGenerator.new()

return NullDropCellPositionGenerator

