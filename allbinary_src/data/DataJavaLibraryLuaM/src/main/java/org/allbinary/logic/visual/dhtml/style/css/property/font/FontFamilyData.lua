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

local FontFamilyData = {}
package.loaded["org.allbinary.logic.visual.dhtml.style.css.property.font.FontFamilyData"] = FontFamilyData

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

-- class table FontFamilyData is declared before the requires
FontFamilyData.__index = FontFamilyData
FontFamilyData.className = "FontFamilyData"
FontFamilyData.javaClassName = "org.allbinary.logic.visual.dhtml.style.css.property.font.FontFamilyData"

function FontFamilyData:_init_fields()
    self.NAME = "FONT_FAMILY_NAME"
    self.VALUE = "font-family"
end


function FontFamilyData.getInstance()
        return FontFamilyData.instance_f
end


function FontFamilyData._jinit(self)
    FontFamilyData._init_fields(self)
    return self
end

function FontFamilyData.new(...)
    local self = setmetatable({}, FontFamilyData)
    FontFamilyData._jinit(self, ...)
    return self
end

FontFamilyData.instance_f = FontFamilyData.new()

return FontFamilyData

