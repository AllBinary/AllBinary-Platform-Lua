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

local HtmlMetaAttributeDataFactory = {}
package.loaded["org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaAttributeDataFactory"] = HtmlMetaAttributeDataFactory

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

local HtmlMetaAttributeData = java_lazy("org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaAttributeData")

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

-- class table HtmlMetaAttributeDataFactory is declared before the requires
HtmlMetaAttributeDataFactory.__index = HtmlMetaAttributeDataFactory
HtmlMetaAttributeDataFactory.className = "HtmlMetaAttributeDataFactory"
HtmlMetaAttributeDataFactory.javaClassName = "org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaAttributeDataFactory"

function HtmlMetaAttributeDataFactory:_init_fields()
    self.NAME = HtmlMetaAttributeData.new(0, "HTMLMETA_ATTRIBUTE_NAME")
    self.HTTP_EQUIV = HtmlMetaAttributeData.new(1, "HTMLMETA_ATTRIBUTE_HTTPEQUIV")
    self.CONTENT = HtmlMetaAttributeData.new(2, "HTMLMETA_ATTRIBUTE_CONTENT")
end


function HtmlMetaAttributeDataFactory.getInstance()
        return HtmlMetaAttributeDataFactory.instance_f
end


function HtmlMetaAttributeDataFactory._jinit(self)
    HtmlMetaAttributeDataFactory._init_fields(self)
    return self
end

function HtmlMetaAttributeDataFactory.new(...)
    local self = setmetatable({}, HtmlMetaAttributeDataFactory)
    HtmlMetaAttributeDataFactory._jinit(self, ...)
    return self
end

HtmlMetaAttributeDataFactory.instance_f = HtmlMetaAttributeDataFactory.new()

return HtmlMetaAttributeDataFactory

