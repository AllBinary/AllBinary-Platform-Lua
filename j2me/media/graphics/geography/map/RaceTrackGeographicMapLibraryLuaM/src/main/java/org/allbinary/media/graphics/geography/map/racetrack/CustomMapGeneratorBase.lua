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
-- package org.allbinary.media.graphics.geography.map.racetrack

local NullUtil = require("org.allbinary.logic.NullUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CustomMapGeneratorBase = {}
CustomMapGeneratorBase.__index = CustomMapGeneratorBase
CustomMapGeneratorBase.className = "CustomMapGeneratorBase"

function CustomMapGeneratorBase.new()
    local self = setmetatable({}, CustomMapGeneratorBase)
    return self
end


-- throws Exception
function CustomMapGeneratorBase:copyMapIntoCustomMap()
end


function CustomMapGeneratorBase:getCustomMapArray()
        return NullUtil.getInstance().NULL_INT_ARRAY_ARRAY
end


-- throws Exception
function CustomMapGeneratorBase:getCustomType(column, row, currentType)
        return -1
end

return CustomMapGeneratorBase

