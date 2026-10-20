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
-- package org.allbinary.logic.visual.transform.template.customizer.hedges.heading

-- local HashMap = require("java.util.HashMap")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Validation = require("org.allbinary.logic.control.validate.Validation")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local LogoData = require("org.allbinary.logic.visual.transform.template.customizer.widgets.logo.LogoData")
local LogoValidation = require("org.allbinary.logic.visual.transform.template.customizer.widgets.logo.LogoValidation")
local TitleData = require("org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData")
local TitleValidation = require("org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleValidation")
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

local HeadingValidation = {}
HeadingValidation.__index = HeadingValidation
HeadingValidation.className = "HeadingValidation"
setmetatable(HeadingValidation, {__index = Validation})

function HeadingValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.title = nil
    self.logo = nil
end

function HeadingValidation.new(...)
    local count = select("#", ...)
    if count == 0 then return HeadingValidation._new0(...)
    elseif count == 1 then return HeadingValidation._new1(...)
    elseif count == 1 then return HeadingValidation._new1(...)
    end
end


function HeadingValidation._new0()
    local self = setmetatable(Validation.new(), HeadingValidation)
    self:_init_fields()
        self.title = TitleValidation.new()
        self.logo = LogoValidation.new()
    return self
end


function HeadingValidation._new1(document)
    local self = setmetatable(Validation.new(), HeadingValidation)
    self:_init_fields()
        local headingNodeList = document:getElementsByTagName(HeadingData.NAME)
        local titleNode = DomSearchHelper.getNode(TitleData.getInstance().NAME, headingNodeList:item(0):getChildNodes())
        local logoNode = DomSearchHelper.getNode(LogoData.getInstance().NAME, headingNodeList:item(0):getChildNodes())
        self.title = TitleValidation.new(titleNode)
        self.logo = LogoValidation.new(logoNode)
    return self
end


function HeadingValidation._new1(hashMap)
    local self = setmetatable(Validation.new(), HeadingValidation)
    self:_init_fields()
        self:getFormData(hashMap)
    return self
end


-- throws Exception
function HeadingValidation:getFormData(hashMap)
        self.title = TitleValidation.new(hashMap)
        self.logo = LogoValidation.new(hashMap)
end


function HeadingValidation:isValid()
        local try_ok, try_error = pcall(function()
            local valid = true
            local titleValid = true
            local logoValid = true
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.IS_VALID)
            end
            if not self.title:isValid() then
                titleValid = false
            end
            if not self.logo:isValid() then
                logoValid = false
            else
                self.logo:processLogoFile()
            end
            if not titleValid and not logoValid then
                valid = false
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("HeadingValidation: " .. tostring(valid), self, self.commonStrings.IS_VALID)
            end
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


function HeadingValidation:validationInfo()
        local try_ok, try_error = pcall(function()
            local valid = true
            local titleValid = true
            local logoValid = true
            local stringBuffer = StringMaker.new()
            if not self.title:isValid() then
                titleValid = false
            end
            if not self.logo:isValid() then
                logoValid = false
            end
            if not titleValid and not logoValid then
                valid = false
            end
            if not valid then
                stringBuffer:append("Include a title and/or logo for the header.")
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


function HeadingValidation:toValidationInfoDoc()
        return nil
end


function HeadingValidation:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function HeadingValidation:toXmlNode(document)
        local node = document:createElement(HeadingData.NAME)
        node:appendChild(self.logo:toXmlNode(document))
        node:appendChild(self.title:toXmlNode(document))
        return node
end

return HeadingValidation

