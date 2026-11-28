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
-- package org.allbinary.logic.visual.transform.info

local TransformInfoPropertiesFactory = {}
package.loaded["org.allbinary.logic.visual.transform.info.TransformInfoPropertiesFactory"] = TransformInfoPropertiesFactory

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

local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local Attr = java_lazy("org.w3c.dom.Attr")
local NamedNodeMap = java_lazy("org.w3c.dom.NamedNodeMap")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransformInfoData = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoProperties = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoProperties")

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

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
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

-- class table TransformInfoPropertiesFactory is declared before the requires
TransformInfoPropertiesFactory.__index = TransformInfoPropertiesFactory
TransformInfoPropertiesFactory.className = "TransformInfoPropertiesFactory"
TransformInfoPropertiesFactory.javaClassName = "org.allbinary.logic.visual.transform.info.TransformInfoPropertiesFactory"

function TransformInfoPropertiesFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function TransformInfoPropertiesFactory.getInstance()
        return TransformInfoPropertiesFactory.instance_f
end
TransformInfoPropertiesFactory.getInstance__static = TransformInfoPropertiesFactory.getInstance


function TransformInfoPropertiesFactory._jinit(self)
    TransformInfoPropertiesFactory._init_fields(self)
    return self
end

function TransformInfoPropertiesFactory.new(...)
    local self = setmetatable({}, TransformInfoPropertiesFactory)
    TransformInfoPropertiesFactory._jinit(self, ...)
    return self
end


-- throws Exception
function TransformInfoPropertiesFactory:getInstance(node)
        local transformInfoChildNodeList = node:getChildNodes()
        local transformInfoData = TransformInfoData.getInstance()
        local attributes = node:getAttributes()
        local attrNode = attributes:getNamedItem(transformInfoData.NAME)
        local name = attrNode:getValue()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(CommonLabels.getInstance().NEXT) .. require("allbinary_java").to_string(" View Name: ")) .. require("allbinary_java").to_string(name), self, "toTransformInfoPropertiesHashMap()")
        end
        local labelNode = DomSearchHelper.getNodeNoThrow(transformInfoData.LABEL, transformInfoChildNodeList)
        local label = DomNodeHelper.getTextNodesValue(labelNode)
        if rawequal(label, nil) then
            label = name
        end
        local descriptionNode = DomSearchHelper.getNode(transformInfoData.DESCRIPTION, transformInfoChildNodeList)
        local description = DomNodeHelper.getTextNodesValue(descriptionNode)
        local objectFileNode = DomSearchHelper.getNode(transformInfoData.OBJECTFILENAME, transformInfoChildNodeList)
        local objectFileName = DomNodeHelper.getTextNodeValue(objectFileNode)
        local objectConfigFileNode = DomSearchHelper.getNode(transformInfoData.OBJECTCONFIGFILENAME, transformInfoChildNodeList)
        local objectConfigFileName = DomNodeHelper.getTextNodeValue(objectConfigFileNode)
        local templateFileNode = DomSearchHelper.getNode(transformInfoData.TEMPLATEFILENAME, transformInfoChildNodeList)
        local templateFileName = DomNodeHelper.getTextNodeValue(templateFileNode)
        local transformInfoProperties = TransformInfoProperties.new(name, label, description, objectFileName, objectConfigFileName, templateFileName)
        return transformInfoProperties
end
TransformInfoPropertiesFactory.getInstance__instance = TransformInfoPropertiesFactory.getInstance
function TransformInfoPropertiesFactory.getInstance(...)
                
    if select("#", ...) == 0 then return TransformInfoPropertiesFactory.getInstance__static() end
                
    return TransformInfoPropertiesFactory.getInstance__instance(...)
                
end

TransformInfoPropertiesFactory.instance_f = TransformInfoPropertiesFactory.new()

return TransformInfoPropertiesFactory

