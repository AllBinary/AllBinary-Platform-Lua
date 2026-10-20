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

-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local AcceptableResponseGenerator = require("org.allbinary.logic.communication.http.AcceptableResponseGenerator")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SearchRequest = require("org.allbinary.logic.control.search.SearchRequest")
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

local TransformHttpRequestDocument = {}
TransformHttpRequestDocument.__index = TransformHttpRequestDocument
TransformHttpRequestDocument.className = "TransformHttpRequestDocument"

function TransformHttpRequestDocument:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.baseNode = nil
    self.document = nil
end

function TransformHttpRequestDocument.new(...)
    local count = select("#", ...)
    if count == 2 then return TransformHttpRequestDocument._new2(...)
    elseif count == 1 then return TransformHttpRequestDocument._new1(...)
    end
end


function TransformHttpRequestDocument._new2(pageContext, weblisketSession)
    local self = setmetatable({}, TransformHttpRequestDocument)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            local contentType = AcceptableResponseGenerator.getInstance():get(pageContext:getRequest())
            self.document = DomDocumentHelper.create()
            local contentTypeNode = self.document:createElement(contentType)
            local languageTypeNode = self.document:createElement(TransformHttpRequestDocument.language)
            local localTypeNode = self.document:createElement(TransformHttpRequestDocument.local_)
            self.baseNode = localTypeNode
            languageTypeNode:appendChild(localTypeNode)
            contentTypeNode:appendChild(languageTypeNode)
            self.document:appendChild(contentTypeNode)
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


function TransformHttpRequestDocument._new1(searchRequest)
    local self = setmetatable({}, TransformHttpRequestDocument)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            local contentType = searchRequest:getContentType()
            self.document = DomDocumentHelper.create()
            local contentTypeNode = self.document:createElement(contentType)
            local languageTypeNode = self.document:createElement(TransformHttpRequestDocument.language)
            local localTypeNode = self.document:createElement(TransformHttpRequestDocument.local_)
            self.baseNode = localTypeNode
            languageTypeNode:appendChild(localTypeNode)
            contentTypeNode:appendChild(languageTypeNode)
            self.document:appendChild(contentTypeNode)
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


function TransformHttpRequestDocument:getBaseNode()
        return self.baseNode
end


function TransformHttpRequestDocument:getDoc()
        return self.document
end


-- throws Exception
function TransformHttpRequestDocument:log()
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

TransformHttpRequestDocument.language = "en"
TransformHttpRequestDocument.local_ = "US"

return TransformHttpRequestDocument

