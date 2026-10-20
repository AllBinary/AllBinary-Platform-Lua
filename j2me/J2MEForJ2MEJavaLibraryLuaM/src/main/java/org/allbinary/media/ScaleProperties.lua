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
-- package org.allbinary.media

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ScaleProperties = {}
ScaleProperties.__index = ScaleProperties
ScaleProperties.className = "ScaleProperties"

function ScaleProperties:_init_fields()
    self.scaleX = 1.0
    self.scaleY = 1.0
    self.scaleWidth = 0
    self.scaleHeight = 0
    self.shouldScale = false
end

function ScaleProperties.new()
    local self = setmetatable({}, ScaleProperties)
    self:_init_fields()
    return self
end


function ScaleProperties:toString()
        return tostring(StringMaker.new():append(CommonLabels.getInstance().COLON_SEP):appendboolean(self.shouldScale):append("scaleX: "):appendfloat(self.scaleX):append("scaleY: "):appendfloat(self.scaleY):append("scaleWidth: "):appendint(self.scaleWidth):append("scaleHeight: "):appendint(self.scaleHeight))
end
ScaleProperties.__tostring = function(self) return self:toString() end

ScaleProperties.instance = ScaleProperties.new()

return ScaleProperties

