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

local CssPropertyValues = {}
package.loaded["org.allbinary.logic.visual.dhtml.style.css.property.CssPropertyValues"] = CssPropertyValues

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
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local DomData = java_lazy("org.allbinary.data.tree.dom.DomData")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local CssPropertyData = java_lazy("org.allbinary.logic.visual.dhtml.style.css.property.CssPropertyData")
local CssPropertyValueData = java_lazy("org.allbinary.logic.visual.dhtml.style.css.property.CssPropertyValueData")

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

-- class table CssPropertyValues is declared before the requires
CssPropertyValues.__index = CssPropertyValues
CssPropertyValues.className = "CssPropertyValues"
CssPropertyValues.javaClassName = "org.allbinary.logic.visual.dhtml.style.css.property.CssPropertyValues"
CssPropertyValues.java_implements = " DomNodeInterface "
CssPropertyValues.java_interfaces = function() return {DomNodeInterface} end

function CssPropertyValues:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.propertyValueVector == nil then self.propertyValueVector = nil end
end

function CssPropertyValues._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return CssPropertyValues._new0(self, ...)
    elseif count == 1 then return CssPropertyValues._new1(self, ...)
    end
    error("No constructor of CssPropertyValues takes " .. count .. " arguments")
end

function CssPropertyValues.new(...)
    local self = setmetatable({}, CssPropertyValues)
    CssPropertyValues._jinit(self, ...)
    return self
end


function CssPropertyValues._new0(self)
    CssPropertyValues._init_fields(self)
        self.propertyValueVector = BasicArrayListD.new()
    return self
end


function CssPropertyValues._new1(self, node)
    CssPropertyValues._init_fields(self)
        local indexPropertyValueHashMap = StdUtil.getInstance():createHashMap()
        self.propertyValueVector = BasicArrayListD.new()
        local cssPropertyNodeVector = DomSearchHelper.getAllNodes(CssPropertyValueData.getInstance().NAME, node:getChildNodes())
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().STYLE) then
            self.logUtil:putF(require("allbinary_java").to_string("Number Of Properties: ") .. require("allbinary_java").to_string(cssPropertyNodeVector:size()), self, "CssProperties()")
        end
        local size = cssPropertyNodeVector:size()
        for index = 0, size - 1 do
            local cssPropertyValueNode = cssPropertyNodeVector:get(index)
            local valueNode = DomSearchHelper.getNode(DomData.VALUE, cssPropertyValueNode:getChildNodes())
            local propertyValue = DomNodeHelper.getTextNodeValue(valueNode)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().STYLE) then
                self.logUtil:putF(require("allbinary_java").to_string("Property Value: ") .. require("allbinary_java").to_string(propertyValue), self, "CssProperties()")
            end
            local indexNode = DomSearchHelper.getNode(DomData.INDEX, cssPropertyValueNode:getChildNodes())
            local indexValue = DomNodeHelper.getTextNodeValue(indexNode)
            indexPropertyValueHashMap:put(indexValue, propertyValue)
        end
        local size2 = indexPropertyValueHashMap:keySet():size()
        for index = 0, size2 - 1 do
            local indexInt = index
            local propertyValue = indexPropertyValueHashMap:get(tostring(indexInt))
            self.propertyValueVector:add(propertyValue)
        end
    return self
end


function CssPropertyValues:toHashMap()
        local commonSeps = CommonSeps.getInstance()
        local cssPropertyValueData = CssPropertyValueData.getInstance()
        local hashMap = StdUtil.getInstance():createHashMap()
        local stringBuffer = StringMaker.new()
        local size = self.propertyValueVector:size()
        do
            local index = 0
            while index < size do
            local value = self.propertyValueVector:get(index)
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append(cssPropertyValueData.NAME)
            stringBuffer:append(commonSeps.BRACKET_OPEN)
            stringBuffer:appendint(index)
            stringBuffer:append(commonSeps.BRACKET_CLOSE)
            hashMap:put(tostring(stringBuffer), value)
            index = index + 1
            index = index + 1
            end
        end
        return hashMap
end


-- throws Exception
function CssPropertyValues:toXmlNode(document)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            local hashMap = self:toHashMap()
            self.logUtil:putF(require("allbinary_java").to_string("CssPropertyValues HashMap: ") .. require("allbinary_java").to_string(tostring(hashMap)), self, "toXmlNode()")
        end
        return ModDomHelper.createNameValueIndexNodes(document, CssPropertyData.getInstance().VALUES, CssPropertyValueData.getInstance().NAME, self.propertyValueVector)
end

return CssPropertyValues

