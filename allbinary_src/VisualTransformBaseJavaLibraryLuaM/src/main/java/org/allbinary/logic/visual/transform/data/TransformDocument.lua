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
-- package org.allbinary.logic.visual.transform.data

local TransformDocument = {}
package.loaded["org.allbinary.logic.visual.transform.data.TransformDocument"] = TransformDocument

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

local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransformDocumentInterface = require("org.allbinary.logic.visual.transform.data.TransformDocumentInterface")

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

-- class table TransformDocument is declared before the requires
TransformDocument.__index = TransformDocument
TransformDocument.className = "TransformDocument"
TransformDocument.javaClassName = "org.allbinary.logic.visual.transform.data.TransformDocument"
TransformDocument.java_implements = " TransformDocumentInterface "
TransformDocument.java_interfaces = function() return {TransformDocumentInterface} end

function TransformDocument:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.baseNode == nil then self.baseNode = nil end
    if self.document == nil then self.document = nil end
end


function TransformDocument._jinit(self)
    TransformDocument._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            self.document = DomDocumentHelper.create()
            local allbinaryNode = self.document:createElement("allbinary")
            self.baseNode = allbinaryNode
            self.document:appendChild(self.baseNode)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:putF(self:log(), self, self.commonStrings.CONSTRUCTOR)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
            end
            error(e, 0)
        end
    return self
end

function TransformDocument.new(...)
    local self = setmetatable({}, TransformDocument)
    TransformDocument._jinit(self, ...)
    return self
end


function TransformDocument:getBaseNode()
        return self.baseNode
end


function TransformDocument:getDoc()
        return self.document
end


-- throws Exception
function TransformDocument:log()
        local stringBuffer = StringMaker.new()
        if self.baseNode ~= nil then
            stringBuffer:append("BaseNode: ")
            stringBuffer:append(self.baseNode:getNodeName())
        else
            stringBuffer:append("Log-Error: BaseNode is Null")
        end
        stringBuffer:append("\nDocument: ")
        stringBuffer:append(XmlDocumentHelper.toString(self.document))
        return tostring(stringBuffer)
end

return TransformDocument

