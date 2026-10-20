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
-- package org.allbinary.logic.java.characters


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CharacterSetData = {}
CharacterSetData.__index = CharacterSetData
CharacterSetData.className = "CharacterSetData"

function CharacterSetData:_init_fields()
    self.US_ASCII = "US-ASCII"
    self.ISO_8859_1 = "ISO-8859-1"
    self.UTF_8 = "UTF-8"
    self.UTF_16 = "UTF-16"
    self.UTF_16BE = "UTF-16BE"
    self.UTF_16LE = "UTF-16LE"
end


function CharacterSetData.getInstance()
        return CharacterSetData.instance
end


function CharacterSetData.new()
    local self = setmetatable({}, CharacterSetData)
    self:_init_fields()
    return self
end

CharacterSetData.instance = CharacterSetData.new()

return CharacterSetData

