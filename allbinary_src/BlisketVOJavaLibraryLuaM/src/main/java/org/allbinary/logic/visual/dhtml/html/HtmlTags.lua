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
-- package org.allbinary.logic.visual.dhtml.html

local HtmlTags = {}
package.loaded["org.allbinary.logic.visual.dhtml.html.HtmlTags"] = HtmlTags

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local HtmlTag = java_lazy("org.allbinary.logic.visual.dhtml.html.HtmlTag")

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

-- class table HtmlTags is declared before the requires
HtmlTags.__index = HtmlTags
HtmlTags.className = "HtmlTags"
HtmlTags.javaClassName = "org.allbinary.logic.visual.dhtml.html.HtmlTags"

function HtmlTags:_init_fields()
    if self.htmlTagVector == nil then self.htmlTagVector = nil end
end


function HtmlTags._jinit(self)
    HtmlTags._init_fields(self)
        self.htmlTagVector = BasicArrayListD.new()
    return self
end

function HtmlTags.new(...)
    local self = setmetatable({}, HtmlTags)
    HtmlTags._jinit(self, ...)
    return self
end


function HtmlTags:get(index)
        return self.htmlTagVector:get(index)
end


function HtmlTags:add(htmlTag)
        self.htmlTagVector:add(htmlTag)
end


function HtmlTags:size()
        return self.htmlTagVector:size()
end

return HtmlTags

