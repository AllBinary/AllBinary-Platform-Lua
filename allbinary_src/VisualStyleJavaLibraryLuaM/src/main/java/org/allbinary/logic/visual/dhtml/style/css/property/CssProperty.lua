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

local CssProperty = {}
package.loaded["org.allbinary.logic.visual.dhtml.style.css.property.CssProperty"] = CssProperty

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

local HashMap = java_lazy("java.util.HashMap")
local DomData = java_lazy("org.allbinary.data.tree.dom.DomData")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local CssPropertyData = java_lazy("org.allbinary.logic.visual.dhtml.style.css.property.CssPropertyData")
local CssPropertyValues = java_lazy("org.allbinary.logic.visual.dhtml.style.css.property.CssPropertyValues")

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

-- class table CssProperty is declared before the requires
CssProperty.__index = CssProperty
CssProperty.className = "CssProperty"
CssProperty.javaClassName = "org.allbinary.logic.visual.dhtml.style.css.property.CssProperty"
CssProperty.java_implements = " DomNodeInterface "
CssProperty.java_interfaces = function() return {DomNodeInterface} end

function CssProperty:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.propertyName == nil then self.propertyName = nil end
    if self.cssPropertyValues == nil then self.cssPropertyValues = nil end
end

function CssProperty._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return CssProperty._new1(self, ...)
    end
    error("No constructor of CssProperty takes " .. count .. " arguments")
end

function CssProperty.new(...)
    local self = setmetatable({}, CssProperty)
    CssProperty._jinit(self, ...)
    return self
end

function CssProperty._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or type(java_a1) == "string") then return CssProperty._new1_1(self, ...) end
    return CssProperty._new1_2(self, ...)
end


function CssProperty._new1_1(self, name)
    CssProperty._init_fields(self)
        self.propertyName = name
        self.cssPropertyValues = CssPropertyValues.new()
    return self
end


function CssProperty._new1_2(self, node)
    CssProperty._init_fields(self)
        local propertyNode = DomSearchHelper.getNode(DomData.VALUE, node:getChildNodes())
        self.propertyName = DomNodeHelper.getTextNodeValue(propertyNode)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().STYLE) then
            self.logUtil:putF(require("allbinary_java").to_string("Name: ") .. require("allbinary_java").to_string(self:getName()), self, "CssProperty()")
        end
        local propertyValuesNode = DomSearchHelper.getNode(CssPropertyData.getInstance().VALUES, node:getChildNodes())
        self.cssPropertyValues = CssPropertyValues.new(propertyValuesNode)
    return self
end


function CssProperty:getName()
        return self.propertyName
end


function CssProperty:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(CssPropertyData.getInstance().NAME, self.propertyName)
        return hashMap
end


-- throws Exception
function CssProperty:toXmlNode(document)
        local hashMap = self:toHashMap()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("CssView HashMap: ") .. require("allbinary_java").to_string(tostring(hashMap)), self, "toXmlNode()")
        end
        local node = ModDomHelper.createNameValueNodes(document, CssPropertyData.getInstance().NAME, self.propertyName)
        node:appendChild(self.cssPropertyValues:toXmlNode(document))
        return node
end

return CssProperty

