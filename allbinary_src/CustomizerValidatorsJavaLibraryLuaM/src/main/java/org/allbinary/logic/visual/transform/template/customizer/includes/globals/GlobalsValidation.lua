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
-- package org.allbinary.logic.visual.transform.template.customizer.includes.globals

local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local StoreFrontView = require("org.allbinary.business.context.modules.storefront.StoreFrontView")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Validation = require("org.allbinary.logic.control.validate.Validation")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
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

local GlobalsValidation = {}
GlobalsValidation.__index = GlobalsValidation
GlobalsValidation.className = "GlobalsValidation"
setmetatable(GlobalsValidation, {__index = Validation})

function GlobalsValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.storeFrontInterface = nil
end

function GlobalsValidation.new(...)
    local count = select("#", ...)
    if count == 1 then return GlobalsValidation._new1(...)
    elseif count == 1 then return GlobalsValidation._new1(...)
    end
end


function GlobalsValidation._new1(storeName)
    local self = setmetatable(Validation.new(), GlobalsValidation)
    self:_init_fields()
        self.storeFrontInterface = StoreFrontFactory.getInstance(storeName)
    return self
end


function GlobalsValidation._new1(document)
    local self = setmetatable(Validation.new(), GlobalsValidation)
    self:_init_fields()
        error(java_exception("Exception", CommonStrings.getInstance().NOT_IMPLEMENTED), 0)
    return self
end


function GlobalsValidation:isValid()
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


function GlobalsValidation:validationInfo()
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


function GlobalsValidation:toValidationInfoDoc()
        return nil
end


function GlobalsValidation:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function GlobalsValidation:toXmlNode(document)
        local node = document:createElement(GlobalsData.NAME)
        node:appendChild(StoreFrontView.new(self.storeFrontInterface):toXmlNode(document))
        return node
end

return GlobalsValidation

