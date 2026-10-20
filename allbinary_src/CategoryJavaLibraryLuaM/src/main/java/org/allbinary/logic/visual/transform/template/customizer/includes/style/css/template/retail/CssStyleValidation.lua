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
-- package org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Validation = require("org.allbinary.logic.control.validate.Validation")
local ValidationInterface = require("org.allbinary.logic.control.validate.ValidationInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StyleData = require("org.allbinary.logic.visual.dhtml.style.StyleData")
local StylesData = require("org.allbinary.logic.visual.dhtml.style.StylesData")
local StylesValidationFactory = require("org.allbinary.logic.visual.dhtml.style.StylesValidationFactory")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CssStyleValidation = {}
CssStyleValidation.__index = CssStyleValidation
CssStyleValidation.className = "CssStyleValidation"
setmetatable(CssStyleValidation, {__index = Validation})

function CssStyleValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.cssStyleElementVector = nil
end

function CssStyleValidation.new(...)
    local count = select("#", ...)
    if count == 0 then return CssStyleValidation._new0(...)
    elseif count == 1 then return CssStyleValidation._new1(...)
    elseif count == 1 then return CssStyleValidation._new1(...)
    end
end


function CssStyleValidation._new0()
    local self = setmetatable(Validation.new(), CssStyleValidation)
    self:_init_fields()
        self.cssStyleElementVector = BasicArrayListD.new()
    return self
end


function CssStyleValidation._new1(document)
    local self = setmetatable(Validation.new(), CssStyleValidation)
    self:_init_fields()
        self.cssStyleElementVector = StylesValidationFactory.getInstance():getInstance(document)
    return self
end


function CssStyleValidation._new1(hashMap)
    local self = setmetatable(Validation.new(), CssStyleValidation)
    self:_init_fields()
        self.cssStyleElementVector = StylesValidationFactory.getInstance(hashMap)
    return self
end


function CssStyleValidation:isValid()
        local try_ok, try_error = pcall(function()
            local isValid = true
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.IS_VALID)
            end
            local size = self.cssStyleElementVector:size()
            for i = 0, size - 1 do
                local styleValidationInterface = self.cssStyleElementVector:get(i)
                if not styleValidationInterface:isValid() then
                    isValid = false
                end
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


function CssStyleValidation:validationInfo()
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


function CssStyleValidation:toValidationInfoDoc()
        return nil
end


function CssStyleValidation:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function CssStyleValidation:toXmlNode(document)
        local node = document:createElement(StylesData.getInstance().NAME)
        local styleNode = document:createElement(StyleData.getInstance().NAME)
        node:appendChild(styleNode)
        local size = self.cssStyleElementVector:size()
        for i = 0, size - 1 do
            local styleDomNodeInterface = self.cssStyleElementVector:get(i)
            styleNode:appendChild(styleDomNodeInterface:toXmlNode(document))
        end
        return node
end

return CssStyleValidation

