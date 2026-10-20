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

local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local TransformDocumentInterface = require("org.allbinary.logic.visual.transform.data.TransformDocumentInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformDocument = {}
TransformDocument.__index = TransformDocument
TransformDocument.className = "TransformDocument"

function TransformDocument:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.baseNode = nil
    self.document = nil
end


function TransformDocument.new()
    local self = setmetatable({}, TransformDocument)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            self.document = DomDocumentHelper.create()
            local allbinaryNode = self.document:createElement("allbinary")
            self.baseNode = allbinaryNode
            self.document:appendChild(self.baseNode)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:putF(self:log(), self, self.commonStrings.CONSTRUCTOR)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
            end
            error(e, 0)
        end
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

