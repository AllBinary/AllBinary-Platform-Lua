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

local TransformInfoDomNode = {}
package.loaded["org.allbinary.logic.visual.transform.info.TransformInfoDomNode"] = TransformInfoDomNode

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
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local Attr = java_lazy("org.w3c.dom.Attr")
local NamedNodeMap = java_lazy("org.w3c.dom.NamedNodeMap")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransformInfo = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfo")
local TransformInfoData = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")

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

-- class table TransformInfoDomNode is declared before the requires
TransformInfoDomNode.__index = TransformInfoDomNode
TransformInfoDomNode.className = "TransformInfoDomNode"
TransformInfoDomNode.javaClassName = "org.allbinary.logic.visual.transform.info.TransformInfoDomNode"

function TransformInfoDomNode:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.transformInfoInterface == nil then self.transformInfoInterface = nil end
    if self.mappedName == nil then self.mappedName = nil end
end

function TransformInfoDomNode._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return TransformInfoDomNode._new1(self, ...)
    elseif count == 2 then return TransformInfoDomNode._new2(self, ...)
    end
    error("No constructor of TransformInfoDomNode takes " .. count .. " arguments")
end

function TransformInfoDomNode.new(...)
    local self = setmetatable({}, TransformInfoDomNode)
    TransformInfoDomNode._jinit(self, ...)
    return self
end

function TransformInfoDomNode._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Node")) then return TransformInfoDomNode._new1_1(self, ...) end
    return TransformInfoDomNode._new1_2(self, ...)
end

function TransformInfoDomNode._new2(self, ...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or java_is(java_a1, "TransformInfoInterface")) and (java_a2 == nil or type(java_a2) == "string") then return TransformInfoDomNode._new2_1(self, ...) end
    return TransformInfoDomNode._new2_2(self, ...)
end


function TransformInfoDomNode._new1_1(self, node)
    TransformInfoDomNode._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("Constructing TransformInfo From TransformInfoDomNode: ") .. require("allbinary_java").to_string(node:getNodeName()), self, "TransformInfoDomNode(Node node)")
        end
        local transformInfoData = TransformInfoData.getInstance()
        local attributes = node:getAttributes()
        local attrNode = attributes:getNamedItem(transformInfoData.NAME)
        local name = attrNode:getValue()
        local nodeList = node:getChildNodes()
        if nodeList:getLength() > 1 then
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Constructing Complete TransformInfo Node For: ")
                stringBuffer:append(name)
                stringBuffer:append(" with ")
                stringBuffer:appendint(java_int(nodeList:getLength()))
                stringBuffer:append(" children")
                self.logUtil:putF(tostring(stringBuffer), self, "TransformInfoObjectConfigComponent(Node node)")
            end
            local objectFileNameNode = DomSearchHelper.getNode(transformInfoData.OBJECTFILENAME, nodeList)
            local objectFileName = DomNodeHelper.getTextNodeValue(objectFileNameNode)
            local objectConfigFileNameNode = DomSearchHelper.getNode(transformInfoData.OBJECTCONFIGFILENAME, nodeList)
            local objectConfigFileName = DomNodeHelper.getTextNodeValue(objectConfigFileNameNode)
            local templateFileNameNode = DomSearchHelper.getNode(transformInfoData.TEMPLATEFILENAME, nodeList)
            local templateFileName = DomNodeHelper.getTextNodeValue(templateFileNameNode)
            local dataFileNameNode = DomSearchHelper.getNode(transformInfoData.DATAFILENAME, nodeList)
            local dataFileName = DomNodeHelper.getTextNodeValue(dataFileNameNode)
            self.transformInfoInterface = TransformInfo.new(name, objectFileName, objectConfigFileName, templateFileName, dataFileName)
        else
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Constructing Partial TransformInfo Node For: ")
                stringBuffer:append(name)
                stringBuffer:append(" with ")
                stringBuffer:appendint(java_int(nodeList:getLength()))
                stringBuffer:append(" children")
                self.logUtil:putF(tostring(stringBuffer), self, "TransformInfoObjectConfigComponent(Node node)")
            end
            self.transformInfoInterface = TransformInfo.new(name)
        end
        local templateAttrNode = attributes:getNamedItem(transformInfoData.MAPPED)
        if not rawequal(templateAttrNode, nil) then
            self.mappedName = templateAttrNode:getValue()
        else
            self.mappedName = self:getTransformInfoInterface():getName()
        end
    return self
end


function TransformInfoDomNode._new1_2(self, transformInfoInterface)
    TransformInfoDomNode._init_fields(self)
        self.transformInfoInterface = transformInfoInterface
        self.mappedName = transformInfoInterface:getName()
    return self
end


function TransformInfoDomNode._new2_1(self, transformInfoInterface, mappedName)
    TransformInfoDomNode._init_fields(self)
        self.transformInfoInterface = transformInfoInterface
        self.mappedName = mappedName
    return self
end


function TransformInfoDomNode._new2_2(self, name, mappedName)
    TransformInfoDomNode._init_fields(self)
        self.transformInfoInterface = TransformInfo.new(name)
        self.mappedName = mappedName
    return self
end


function TransformInfoDomNode:getTransformInfoInterface()
        return self.transformInfoInterface
end


function TransformInfoDomNode:getMappedName()
        return self.mappedName
end


function TransformInfoDomNode:getReplaceKey()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("<transform:component name=\"")
        stringBuffer:append("body")
        stringBuffer:append("\"/>")
        local key = tostring(stringBuffer)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("Component Key: ") .. require("allbinary_java").to_string(key), self, "getReplaceKey()")
        end
        return key
end

return TransformInfoDomNode

