--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 leIIgal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.logic.visual.transform.template.customizer.bodies.title

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
local BodyData = require("org.allbinary.logic.visual.transform.template.customizer.bodies.BodyData")
local TitleData = require("org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData")
local TitleNotRequiredValidation = require("org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleNotRequiredValidation")
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

local TitleBodyValidation = {}
TitleBodyValidation.__index = TitleBodyValidation
TitleBodyValidation.className = "TitleBodyValidation"
setmetatable(TitleBodyValidation, {__index = Validation})

function TitleBodyValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.body = nil
    self.titleValidation = nil
end

function TitleBodyValidation.new(...)
    local count = select("#", ...)
    if count == 0 then return TitleBodyValidation._new0(...)
    elseif count == 1 then return TitleBodyValidation._new1(...)
    elseif count == 1 then return TitleBodyValidation._new1(...)
    end
end


function TitleBodyValidation._new0()
    local self = setmetatable(Validation.new(), TitleBodyValidation)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
        local stringUtil = StringUtil.getInstance()
        self.body = stringUtil.EMPTY_STRING
        self.titleValidation = TitleNotRequiredValidation.new()
    return self
end


function TitleBodyValidation._new1(document)
    local self = setmetatable(Validation.new(), TitleBodyValidation)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, "Constructor(document)")
        end
        local nodeList = document:getElementsByTagName(BodyData.getInstance().NAME)
        for index = 0, nodeList:getLength() - 1 do
            local aBodyNode = nodeList:item(index)
            local aBodyValueNode = DomSearchHelper.getNode(DomData.VALUE, aBodyNode:getChildNodes())
            self.body = DomNodeHelper.getTextNodeValue(aBodyValueNode)
            local titleNode = DomSearchHelper.getNode(TitleData.getInstance().NAME, aBodyNode:getChildNodes())
            self.titleValidation = TitleNotRequiredValidation.new(titleNode)
            if index > 1 then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF("To Many Body Nodes", self, self.commonStrings.CONSTRUCTOR)
                end
            end
        end
    return self
end


function TitleBodyValidation._new1(hashMap)
    local self = setmetatable(Validation.new(), TitleBodyValidation)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF(self.commonStrings.START, self, "Constructor(hashmap)")
        end
        self:getFormData(hashMap)
    return self
end


-- throws Exception
function TitleBodyValidation:getFormData(hashMap)
        self.body = hashMap:get(BodyData.getInstance().NAME)
        self.titleValidation = TitleNotRequiredValidation.new(hashMap)
end


function TitleBodyValidation:isValid()
        local try_ok, try_error = pcall(function()
            local isValid = true
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("TitleBodyValidation", self, self.commonStrings.IS_VALID)
            end
            if not StringValidationUtil.getInstance():isValidNotRequired(self.body, BodyData.getInstance().MIN, AbSqlData.MAXBLOB) then
                isValid = false
            end
            if not self.titleValidation:isValid() then
                isValid = false
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("TitleBodyValidation: " .. tostring(isValid), self, self.commonStrings.IS_VALID)
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


function TitleBodyValidation:validationInfo()
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
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Validating Form"
        end
end


function TitleBodyValidation:toValidationInfoDoc()
        return nil
end


function TitleBodyValidation:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function TitleBodyValidation:toXmlNode(document)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Title Body: " .. self.body, self, "toXmlNode(document)")
        end
        local node = ModDomHelper.createNameValueNodes(document, BodyData.getInstance().NAME, self.body)
        node:appendChild(self.titleValidation:toXmlNode(document))
        return node
end

return TitleBodyValidation

