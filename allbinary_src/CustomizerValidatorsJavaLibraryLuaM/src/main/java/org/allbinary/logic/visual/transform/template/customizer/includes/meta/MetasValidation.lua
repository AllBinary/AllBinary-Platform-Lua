--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- II
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.logic.visual.transform.template.customizer.includes.meta

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Validation = require("org.allbinary.logic.control.validate.Validation")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local HtmlMetaAttributeDataFactory = require("org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaAttributeDataFactory")
local HtmlMetaAttributeValuesData = require("org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetaAttributeValuesData")
local HtmlMetasData = require("org.allbinary.logic.visual.dhtml.html.head.meta.HtmlMetasData")
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

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local MetasValidation = {}
MetasValidation.__index = MetasValidation
MetasValidation.className = "MetasValidation"
setmetatable(MetasValidation, {__index = Validation})

function MetasValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.storeFrontInterface = nil
    self.metaValidationVector = nil
end

function MetasValidation.new(...)
    local count = select("#", ...)
    if count == 1 then return MetasValidation._new1(...)
    elseif count == 1 then return MetasValidation._new1(...)
    end
end


function MetasValidation._new1(storeName)
    local self = setmetatable(Validation.new(), MetasValidation)
    self:_init_fields()
        self.storeFrontInterface = StoreFrontFactory.getInstance(storeName)
        self.metaValidationVector = BasicArrayListD.new()
        local contentValue = self.storeFrontInterface:getName() .. " E-Commerce Site"
        local keywordsMetaValidation = MetaValidation.new(HtmlMetaAttributeDataFactory.getInstance().NAME, "Keywords", HtmlMetaAttributeValuesData.getInstance().KEYWORDS, contentValue)
        local abstractMetaValidation = MetaValidation.new(HtmlMetaAttributeDataFactory.getInstance().NAME, "Abstract", HtmlMetaAttributeValuesData.getInstance().ABSTRACT, contentValue)
        local descriptionMetaValidation = MetaValidation.new(HtmlMetaAttributeDataFactory.getInstance().NAME, "Description", HtmlMetaAttributeValuesData.getInstance().DESCRIPTION, contentValue)
        self.metaValidationVector:add(keywordsMetaValidation)
        self.metaValidationVector:add(abstractMetaValidation)
        self.metaValidationVector:add(descriptionMetaValidation)
    return self
end


function MetasValidation._new1(document)
    local self = setmetatable(Validation.new(), MetasValidation)
    self:_init_fields()
        error(java_exception("Exception", CommonStrings.getInstance().NOT_IMPLEMENTED), 0)
    return self
end


function MetasValidation:isValid()
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


function MetasValidation:validationInfo()
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


function MetasValidation:toValidationInfoDoc()
        return nil
end


function MetasValidation:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function MetasValidation:toXmlNode(document)
        local node = document:createElement(HtmlMetasData.getInstance().NAME)
        local metaArray = self.metaValidationVector:toArrayType(java_new_array(nil, self.metaValidationVector:size()))
        local size = (metaArray.n or #metaArray)
        for i = 0, size - 1 do
            local metaValidation = metaArray[i + 1]
            node:appendChild(metaValidation:toXmlNode(document))
        end
        return node
end

return MetasValidation

