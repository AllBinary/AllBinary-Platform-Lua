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
-- package taghelpers

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local ViewHelper = require("taghelpers.ViewHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ValidationViewHelper = {}
ValidationViewHelper.__index = ValidationViewHelper
ValidationViewHelper.className = "ValidationViewHelper"
setmetatable(ValidationViewHelper, {__index = ViewHelper})

function ValidationViewHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.viewInterface = nil
end


function ValidationViewHelper.new(hashMap, pageContext)
    local self = setmetatable(ViewHelper.new(hashMap, pageContext), ValidationViewHelper)
    self:_init_fields()
        -- super(...) made self above
        self.viewInterface = self:getViewObject()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function ValidationViewHelper:isValid()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPER) then
                self.logUtil:putF("Started", self, self.commonStrings.IS_VALID)
            end
            return self.viewInterface:isValid()
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function ValidationViewHelper:validationInfo()
        local try_ok, try_error = pcall(function()
            return self.viewInterface:validationInfo()
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "validationInfo()", e)
            end
            return "Unknown Validation Error"
        end
end


function ValidationViewHelper:toValidationInfoDoc()
        local try_ok, try_error = pcall(function()
            return self.viewInterface:toValidationInfoDoc()
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "toValidationInfoDoc()", e)
            end
            return nil
        end
end


function ValidationViewHelper:toValidationInfoNode(document)
        local try_ok, try_error = pcall(function()
            return self.viewInterface:toValidationInfoNode(document)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "toValidationInfoNode()", e)
            end
            return nil
        end
end

return ValidationViewHelper

