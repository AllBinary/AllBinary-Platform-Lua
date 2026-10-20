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
-- package org.allbinary.logic.visual.transform.template.customizer.includes.style.css

-- local HashMap = require("java.util.HashMap")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Validation = require("org.allbinary.logic.control.validate.Validation")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StylesData = require("org.allbinary.logic.visual.dhtml.style.StylesData")
local BodyData = require("org.allbinary.logic.visual.transform.template.customizer.bodies.BodyData")
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

local GenericCssStyleValidation = {}
GenericCssStyleValidation.__index = GenericCssStyleValidation
GenericCssStyleValidation.className = "GenericCssStyleValidation"
setmetatable(GenericCssStyleValidation, {__index = Validation})

function GenericCssStyleValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function GenericCssStyleValidation.new(...)
    local count = select("#", ...)
    if count == 0 then return GenericCssStyleValidation._new0(...)
    elseif count == 1 then return GenericCssStyleValidation._new1(...)
    elseif count == 1 then return GenericCssStyleValidation._new1(...)
    end
end


function GenericCssStyleValidation._new0()
    local self = setmetatable(Validation.new(), GenericCssStyleValidation)
    self:_init_fields()
    return self
end


function GenericCssStyleValidation._new1(document)
    local self = setmetatable(Validation.new(), GenericCssStyleValidation)
    self:_init_fields()
        local nodeList = document:getElementsByTagName(StylesData.getInstance().NAME)
    return self
end


function GenericCssStyleValidation._new1(hashMap)
    local self = setmetatable(Validation.new(), GenericCssStyleValidation)
    self:_init_fields()
        self:getFormData(hashMap)
    return self
end


-- throws Exception
function GenericCssStyleValidation:getFormData(hashMap)
end


function GenericCssStyleValidation:isValid()
        local try_ok, try_error = pcall(function()
            local isValid = true
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.IS_VALID)
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("End: " .. tostring(isValid), self, self.commonStrings.IS_VALID)
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


function GenericCssStyleValidation:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
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


function GenericCssStyleValidation:toValidationInfoDoc()
        return nil
end


function GenericCssStyleValidation:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function GenericCssStyleValidation:toXmlNode(document)
        local node = ModDomHelper.createNameValueNodes(document, BodyData.getInstance().NAME, StringUtil.getInstance().EMPTY_STRING)
        return node
end

return GenericCssStyleValidation

