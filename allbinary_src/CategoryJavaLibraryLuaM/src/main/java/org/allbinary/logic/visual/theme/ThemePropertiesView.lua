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
-- package org.allbinary.logic.visual.theme

local ThemePropertiesView = {}
package.loaded["org.allbinary.logic.visual.theme.ThemePropertiesView"] = ThemePropertiesView

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

local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local ThemeInterface = java_lazy("org.allbinary.logic.visual.theme.ThemeInterface")

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

-- class table ThemePropertiesView is declared before the requires
ThemePropertiesView.__index = ThemePropertiesView
ThemePropertiesView.className = "ThemePropertiesView"
ThemePropertiesView.javaClassName = "org.allbinary.logic.visual.theme.ThemePropertiesView"
ThemePropertiesView.java_implements = " DomNodeInterface "
ThemePropertiesView.java_interfaces = function() return {DomNodeInterface} end

function ThemePropertiesView:_init_fields()
    if self.themeInterface == nil then self.themeInterface = nil end
end


function ThemePropertiesView._jinit(self, themeInterface)
    ThemePropertiesView._init_fields(self)
        self.themeInterface = themeInterface
    return self
end

function ThemePropertiesView.new(...)
    local self = setmetatable({}, ThemePropertiesView)
    ThemePropertiesView._jinit(self, ...)
    return self
end


-- throws Exception
function ThemePropertiesView:toXmlNode(document)
        local node = ModDomHelper.createNameValueNodes(document, ThemeData.getInstance().NAME, self.themeInterface:toHashMap())
        return node
end

return ThemePropertiesView

