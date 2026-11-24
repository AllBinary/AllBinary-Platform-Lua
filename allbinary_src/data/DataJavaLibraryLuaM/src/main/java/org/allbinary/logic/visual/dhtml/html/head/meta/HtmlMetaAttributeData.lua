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
-- package org.allbinary.logic.visual.dhtml.html.head.meta

local HtmlMetaAttributeData = {}
package.loaded["org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaAttributeData"] = HtmlMetaAttributeData

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

-- class table HtmlMetaAttributeData is declared before the requires
HtmlMetaAttributeData.__index = HtmlMetaAttributeData
HtmlMetaAttributeData.className = "HtmlMetaAttributeData"
HtmlMetaAttributeData.javaClassName = "org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaAttributeData"

function HtmlMetaAttributeData:_init_fields()
    if self.id == nil then self.id = nil end
    if self.name_f == nil then self.name_f = nil end
end


function HtmlMetaAttributeData._jinit(self, id, value)
    HtmlMetaAttributeData._init_fields(self)
        self.name_f = value
        self.id = id
    return self
end

function HtmlMetaAttributeData.new(...)
    local self = setmetatable({}, HtmlMetaAttributeData)
    HtmlMetaAttributeData._jinit(self, ...)
    return self
end


function HtmlMetaAttributeData:equals(htmlMetaAttributeData)
        if htmlMetaAttributeData.id == self.id then
            return true
        else
            return false
        end
end
HtmlMetaAttributeData.__eq = function(self, other) return self:equals(other) end


function HtmlMetaAttributeData:toString()
        return self.name_f
end
HtmlMetaAttributeData.__tostring = function(self) return self:toString() end

return HtmlMetaAttributeData

