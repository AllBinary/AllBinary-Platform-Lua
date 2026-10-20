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
-- package views.business.context.modules.storefront.customizer.hedges.header

local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local HeadingValidation = require("org.allbinary.logic.visual.transform.template.customizer.hedges.heading.HeadingValidation")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local CustomizerUtil = require("views.business.context.modules.storefront.customizer.CustomizerUtil")
local TopBarView = require("views.business.context.modules.storefront.customizer.hedges.header.TopBarView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NewHeaderValidationView = {}
NewHeaderValidationView.__index = NewHeaderValidationView
NewHeaderValidationView.className = "NewHeaderValidationView"
setmetatable(NewHeaderValidationView, {__index = TopBarView})

function NewHeaderValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function NewHeaderValidationView.new(transformInfoInterface)
    local self = setmetatable(TopBarView.new(transformInfoInterface), NewHeaderValidationView)
    self:_init_fields()
        -- super(...) made self above
        self.heading = HeadingValidation.new()
    return self
end


-- throws Exception
function NewHeaderValidationView:toXmlDoc()
        return nil
end


function NewHeaderValidationView:isValid()
        local try_ok, try_error = pcall(function()
            CustomizerUtil.getInstance():insert(self:getTransformInfoInterface(), self)
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to validate", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function NewHeaderValidationView:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.heading:validationInfo())
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


function NewHeaderValidationView:toValidationInfoDoc()
        return nil
end


function NewHeaderValidationView:toValidationInfoNode(document)
        return nil
end

return NewHeaderValidationView

