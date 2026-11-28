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
-- package org.allbinary.logic.visual.dhtml.style.css.property

local CssPropertyView = {}
package.loaded["org.allbinary.logic.visual.dhtml.style.css.property.CssPropertyView"] = CssPropertyView

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
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local CssProperty = java_lazy("org.allbinary.logic.visual.dhtml.style.css.property.CssProperty")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table CssPropertyView is declared before the requires
CssPropertyView.__index = CssPropertyView
CssPropertyView.className = "CssPropertyView"
CssPropertyView.javaClassName = "org.allbinary.logic.visual.dhtml.style.css.property.CssPropertyView"
CssPropertyView.java_implements = " DomNodeInterface "
CssPropertyView.java_interfaces = function() return {DomNodeInterface} end

function CssPropertyView:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    if self.cssProperty == nil then self.cssProperty = nil end
end

function CssPropertyView._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return CssPropertyView._new1(self, ...)
    end
    error("No constructor of CssPropertyView takes " .. count .. " arguments")
end

function CssPropertyView.new(...)
    local self = setmetatable({}, CssPropertyView)
    CssPropertyView._jinit(self, ...)
    return self
end

function CssPropertyView._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or type(java_a1) == "string") then return CssPropertyView._new1_1(self, ...) end
    if true and (java_a1 == nil or java_is(java_a1, "Node")) then return CssPropertyView._new1_2(self, ...) end
    return CssPropertyView._new1_3(self, ...)
end


function CssPropertyView._new1_1(self, name)
    CssPropertyView._init_fields(self)
        self.cssProperty = CssProperty.new(name)
    return self
end


function CssPropertyView._new1_2(self, node)
    CssPropertyView._init_fields(self)
        self.cssProperty = CssProperty.new(node)
    return self
end


function CssPropertyView._new1_3(self, cssProperty)
    CssPropertyView._init_fields(self)
        self.cssProperty = cssProperty
    return self
end


function CssPropertyView:getProperty()
        return self.cssProperty
end


-- throws Exception
function CssPropertyView:toXmlNode(document)
        return self.cssProperty:toXmlNode(document)
end

return CssPropertyView

