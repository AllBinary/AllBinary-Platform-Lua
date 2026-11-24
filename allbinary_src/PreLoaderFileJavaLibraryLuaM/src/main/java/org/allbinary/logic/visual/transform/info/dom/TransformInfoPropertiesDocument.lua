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
-- package org.allbinary.logic.visual.transform.info.dom

local TransformInfoPropertiesDocument = {}
package.loaded["org.allbinary.logic.visual.transform.info.dom.TransformInfoPropertiesDocument"] = TransformInfoPropertiesDocument

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
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentFileHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentFileHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local TransformInfoData = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoProperties = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoProperties")
local TransformInfoPropertiesFactory = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoPropertiesFactory")
local TransformInfosData = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfosData")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table TransformInfoPropertiesDocument is declared before the requires
TransformInfoPropertiesDocument.__index = TransformInfoPropertiesDocument
TransformInfoPropertiesDocument.className = "TransformInfoPropertiesDocument"
TransformInfoPropertiesDocument.javaClassName = "org.allbinary.logic.visual.transform.info.dom.TransformInfoPropertiesDocument"

function TransformInfoPropertiesDocument:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.document == nil then self.document = nil end
end


function TransformInfoPropertiesDocument._jinit(self, filePath)
    TransformInfoPropertiesDocument._init_fields(self)
        local xmlFile = AbFile.createAbFile(filePath)
        self.document = DomDocumentFileHelper.createDocument(xmlFile)
    return self
end

function TransformInfoPropertiesDocument.new(...)
    local self = setmetatable({}, TransformInfoPropertiesDocument)
    TransformInfoPropertiesDocument._jinit(self, ...)
    return self
end


function TransformInfoPropertiesDocument:toTransformInfoPropertiesHashMap()
        local try_ok, try_error, try_value = pcall(function()
            local transformInfoPropertiesHashMap = StdUtil.getInstance():createHashMap()
            local transformInfosNode = self.document:getElementsByTagName(TransformInfosData.getInstance().NAME):item(0)
            local transformInfosChildNodeList = transformInfosNode:getChildNodes()
            local transformInfoNodeVector = DomSearchHelper.getAllNodes(TransformInfoData.getInstance().NAME, transformInfosChildNodeList)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF("Size: " .. tostring(transformInfoNodeVector:size()), self, "toTransformInfoPropertiesHashMap()")
            end
            local size = transformInfoNodeVector:size()
            local node = nil
            local transformInfoProperties = nil
            for index = 0, size - 1 do
                node = transformInfoNodeVector:get(index)
                transformInfoProperties = TransformInfoPropertiesFactory.getInstance():getInstance(node)
                transformInfoPropertiesHashMap:put(transformInfoProperties:getName(), transformInfoProperties)
            end
            do return "__jreturn", transformInfoPropertiesHashMap end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "toTransformInfoPropertiesHashMap()", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return TransformInfoPropertiesDocument

