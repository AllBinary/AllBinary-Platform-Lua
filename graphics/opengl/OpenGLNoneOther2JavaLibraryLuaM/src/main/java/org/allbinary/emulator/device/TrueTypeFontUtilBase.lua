-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.emulator.device


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TrueTypeFontUtilBase = {}
TrueTypeFontUtilBase.__index = TrueTypeFontUtilBase
TrueTypeFontUtilBase.className = "TrueTypeFontUtilBase"


function TrueTypeFontUtilBase.new(scale)
    local self = setmetatable({}, TrueTypeFontUtilBase)
    return self
end


function TrueTypeFontUtilBase:getAsTextureSize(textureSize)
        return -1
end


function TrueTypeFontUtilBase:getCellSize(cellSize)
        return -1
end

return TrueTypeFontUtilBase

