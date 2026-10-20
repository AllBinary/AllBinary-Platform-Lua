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
-- package org.allbinary.logic.visual.transform.template.customizer.page

-- local HashMap = require("java.util.HashMap")
local PageData = require("org.allbinary.business.page.PageData")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Validation = require("org.allbinary.logic.control.validate.Validation")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TitleData = require("org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData")
local TitleValidation = require("org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleValidation")
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

local PageValidation = {}
PageValidation.__index = PageValidation
PageValidation.className = "PageValidation"
setmetatable(PageValidation, {__index = Validation})

function PageValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.title = nil
end

function PageValidation.new(...)
    local count = select("#", ...)
    if count == 0 then return PageValidation._new0(...)
    elseif count == 1 then return PageValidation._new1(...)
    elseif count == 1 then return PageValidation._new1(...)
    end
end


function PageValidation._new0()
    local self = setmetatable(Validation.new(), PageValidation)
    self:_init_fields()
        self.title = TitleValidation.new()
    return self
end


function PageValidation._new1(document)
    local self = setmetatable(Validation.new(), PageValidation)
    self:_init_fields()
        local node = DomSearchHelper.getNode(TitleData.getInstance().NAME, document:getElementsByTagName(PageData.getInstance().NAME))
        self.title = TitleValidation.new(node)
    return self
end


function PageValidation._new1(hashMap)
    local self = setmetatable(Validation.new(), PageValidation)
    self:_init_fields()
        self:getFormData(hashMap)
    return self
end


function PageValidation:getFormData(hashMap)
        self.title = TitleValidation.new(hashMap)
end


function PageValidation:isValid()
        local try_ok, try_error = pcall(function()
            local valid = true
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("PageValidation", self, self.commonStrings.IS_VALID)
            end
            if not self.title:isValid() then
                valid = false
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("PageValidation: " .. tostring(valid), self, self.commonStrings.IS_VALID)
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


function PageValidation:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            if not self.title:isValid() then
                stringBuffer:append(self.title:validationInfo())
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


function PageValidation:toValidationInfoDoc()
        return nil
end


function PageValidation:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function PageValidation:toXmlNode(document)
        local node = document:createElement(PageData.getInstance().NAME)
        node:appendChild(self.title:toXmlNode(document))
        return node
end

return PageValidation

