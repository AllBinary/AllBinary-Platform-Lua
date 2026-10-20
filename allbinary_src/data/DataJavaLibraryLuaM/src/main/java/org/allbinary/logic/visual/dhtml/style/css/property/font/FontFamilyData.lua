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
-- package org.allbinary.logic.visual.dhtml.style.css.property.font


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FontFamilyData = {}
FontFamilyData.__index = FontFamilyData
FontFamilyData.className = "FontFamilyData"

function FontFamilyData:_init_fields()
    self.NAME = "FONT_FAMILY_NAME"
    self.VALUE = "font-family"
end


function FontFamilyData.getInstance()
        return FontFamilyData.instance
end


function FontFamilyData.new()
    local self = setmetatable({}, FontFamilyData)
    self:_init_fields()
    return self
end

FontFamilyData.instance = FontFamilyData.new()

return FontFamilyData

