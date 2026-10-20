--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- III
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.logic.visual.transform.template.customizer.includes.meta

-- local HashMap = require("java.util.HashMap")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Validation = require("org.allbinary.logic.control.validate.Validation")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local HtmlMetaAttributeData = require("org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaAttributeData")
local HtmlMetaAttributeDataFactory = require("org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaAttributeDataFactory")
local HtmlMetaData = require("org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaData")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MetaValidation = {}
MetaValidation.__index = MetaValidation
MetaValidation.className = "MetaValidation"
setmetatable(MetaValidation, {__index = Validation})

function MetaValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.label = nil
    self.name = nil
    self.httpEquiv = nil
    self.content = nil
end

function MetaValidation.new(...)
    local count = select("#", ...)
    if count == 4 then return MetaValidation._new4(...)
    elseif count == 1 then return MetaValidation._new1(...)
    end
end


function MetaValidation._new4(htmlMetaAttributeData, label, attributeValue, contentValue)
    local self = setmetatable(Validation.new(), MetaValidation)
    self:_init_fields()
        self.label = label
        if htmlMetaAttributeData:equals(HtmlMetaAttributeDataFactory.getInstance().HTTP_EQUIV) then
            self.httpEquiv = attributeValue
        elseif htmlMetaAttributeData:equals(HtmlMetaAttributeDataFactory.getInstance().NAME) then
            self.name = attributeValue
        end
        self.content = contentValue
    return self
end


function MetaValidation._new1(document)
    local self = setmetatable(Validation.new(), MetaValidation)
    self:_init_fields()
        error(java_exception("Exception", CommonStrings.getInstance().NOT_IMPLEMENTED), 0)
    return self
end


function MetaValidation:isValid()
        local try_ok, try_error = pcall(function()
            local valid = true
            return valid
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to validate form", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function MetaValidation:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Validating Form"
        end
end


function MetaValidation:toValidationInfoDoc()
        return nil
end


function MetaValidation:toValidationInfoNode(document)
        return nil
end


function MetaValidation:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        local htmlMetaAttributeDataFactory = HtmlMetaAttributeDataFactory.getInstance()
        hashMap:put(tostring(HtmlMetaData.getInstance().LABEL), self.label)
        hashMap:put(tostring(htmlMetaAttributeDataFactory.NAME), self.name)
        hashMap:put(tostring(htmlMetaAttributeDataFactory.HTTP_EQUIV), self.httpEquiv)
        hashMap:put(tostring(htmlMetaAttributeDataFactory.CONTENT), self.content)
        return hashMap
end


-- throws Exception
function MetaValidation:toXmlNode(document)
        local node = ModDomHelper.createNameValueNodes(document, tostring(HtmlMetaData.getInstance().NAME), self:toHashMap())
        return node
end

return MetaValidation

