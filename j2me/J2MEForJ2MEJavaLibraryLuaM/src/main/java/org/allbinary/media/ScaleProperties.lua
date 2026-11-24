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

local ScaleProperties = {}
package.loaded["org.allbinary.media.ScaleProperties"] = ScaleProperties

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

-- class table ScaleProperties is declared before the requires
ScaleProperties.__index = ScaleProperties
ScaleProperties.className = "ScaleProperties"
ScaleProperties.javaClassName = "org.allbinary.media.ScaleProperties"

function ScaleProperties:_init_fields()
    self.scaleX = 1.0
    self.scaleY = 1.0
    if self.scaleWidth == nil then self.scaleWidth = 0 end
    if self.scaleHeight == nil then self.scaleHeight = 0 end
    if self.shouldScale == nil then self.shouldScale = false end
end

function ScaleProperties._jinit(self)
    ScaleProperties._init_fields(self)
    return self
end

function ScaleProperties.new()
    return ScaleProperties._jinit(setmetatable({}, ScaleProperties))
end


function ScaleProperties:toString()
        return tostring(StringMaker.new():append(CommonLabels.getInstance().COLON_SEP):appendboolean(self.shouldScale):append("scaleX: "):appendfloat(self.scaleX):append("scaleY: "):appendfloat(self.scaleY):append("scaleWidth: "):appendint(self.scaleWidth):append("scaleHeight: "):appendint(self.scaleHeight))
end
ScaleProperties.__tostring = function(self) return self:toString() end

ScaleProperties.instance_f = ScaleProperties.new()

return ScaleProperties

