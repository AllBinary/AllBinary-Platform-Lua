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
-- package views.business.context.modules.storefront.customizer.includes.meta

local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local CustomizerUtil = require("views.business.context.modules.storefront.customizer.CustomizerUtil")
local MetaView = require("views.business.context.modules.storefront.customizer.includes.meta.MetaView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InsertMetaValidationView = {}
InsertMetaValidationView.__index = InsertMetaValidationView
InsertMetaValidationView.className = "InsertMetaValidationView"
setmetatable(InsertMetaValidationView, {__index = MetaView})

function InsertMetaValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function InsertMetaValidationView.new(transformInfoInterface)
    local self = setmetatable(MetaView.new(transformInfoInterface), InsertMetaValidationView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function InsertMetaValidationView:toXmlDoc()
        return nil
end


function InsertMetaValidationView:isValid()
        local try_ok, try_error = pcall(function()
            local isValid = true
            CustomizerUtil.getInstance():insert(self:getTransformInfoInterface(), self)
            return isValid
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to validate", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function InsertMetaValidationView:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Getting Validation Info"
        end
end


function InsertMetaValidationView:toValidationInfoDoc()
        return nil
end


function InsertMetaValidationView:toValidationInfoNode(document)
        return nil
end

return InsertMetaValidationView

