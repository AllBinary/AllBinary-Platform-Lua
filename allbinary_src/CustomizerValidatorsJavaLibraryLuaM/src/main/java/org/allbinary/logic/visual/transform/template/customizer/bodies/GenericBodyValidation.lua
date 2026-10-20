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
-- package org.allbinary.logic.visual.transform.template.customizer.bodies

-- local HashMap = require("java.util.HashMap")
local DomData = require("org.allbinary.data.tree.dom.DomData")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlData = require("org.allbinary.logic.communication.sql.AbSqlData")
local Validation = require("org.allbinary.logic.control.validate.Validation")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GenericBodyValidation = {}
GenericBodyValidation.__index = GenericBodyValidation
GenericBodyValidation.className = "GenericBodyValidation"
setmetatable(GenericBodyValidation, {__index = Validation})

function GenericBodyValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.body = nil
end

function GenericBodyValidation.new(...)
    local count = select("#", ...)
    if count == 0 then return GenericBodyValidation._new0(...)
    elseif count == 1 then return GenericBodyValidation._new1(...)
    elseif count == 1 then return GenericBodyValidation._new1(...)
    end
end


function GenericBodyValidation._new0()
    local self = setmetatable(Validation.new(), GenericBodyValidation)
    self:_init_fields()
        self.body = StringUtil.getInstance().EMPTY_STRING
    return self
end


function GenericBodyValidation._new1(document)
    local self = setmetatable(Validation.new(), GenericBodyValidation)
    self:_init_fields()
        local nodeList = document:getElementsByTagName(BodyData.getInstance().NAME)
        for index = 0, nodeList:getLength() - 1 do
            local aBodyNode = nodeList:item(index)
            local aBodyValueNode = DomSearchHelper.getNode(DomData.VALUE, aBodyNode:getChildNodes())
            self.body = DomNodeHelper.getTextNodeValue(aBodyValueNode)
        end
    return self
end


function GenericBodyValidation._new1(hashMap)
    local self = setmetatable(Validation.new(), GenericBodyValidation)
    self:_init_fields()
        self:getFormData(hashMap)
    return self
end


-- throws Exception
function GenericBodyValidation:getFormData(hashMap)
        self.body = hashMap:get(BodyData.getInstance().NAME)
end


function GenericBodyValidation:isValid()
        local try_ok, try_error = pcall(function()
            local isValid = true
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.IS_VALID)
            end
            if not StringValidationUtil.getInstance():isValidNotRequired(self.body, BodyData.getInstance().MIN, AbSqlData.MAXBLOB) then
                isValid = false
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("BodyValidation: " .. tostring(isValid), self, self.commonStrings.IS_VALID)
            end
            return isValid
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to validate form", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function GenericBodyValidation:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            do
                stringBuffer:append("Error: Data submitted is < ")
                stringBuffer:appendint(java_int(BodyData.getInstance().MIN))
                stringBuffer:append(" or > ")
                stringBuffer:appendint(java_int(AbSqlData.MAXBLOB))
            end
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


function GenericBodyValidation:toValidationInfoDoc()
        return nil
end


function GenericBodyValidation:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function GenericBodyValidation:toXmlNode(document)
        local node = ModDomHelper.createNameValueNodes(document, BodyData.getInstance().NAME, self.body)
        return node
end

return GenericBodyValidation

