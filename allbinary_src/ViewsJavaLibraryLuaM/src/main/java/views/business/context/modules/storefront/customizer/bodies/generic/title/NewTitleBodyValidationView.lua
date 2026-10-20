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
-- package views.business.context.modules.storefront.customizer.bodies.generic.title

local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TitleBodyValidation = require("org.allbinary.logic.visual.transform.template.customizer.bodies.title.TitleBodyValidation")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local CustomizerUtil = require("views.business.context.modules.storefront.customizer.CustomizerUtil")
local TitleBodyCustomizerView = require("views.business.context.modules.storefront.customizer.bodies.generic.title.TitleBodyCustomizerView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NewTitleBodyValidationView = {}
NewTitleBodyValidationView.__index = NewTitleBodyValidationView
NewTitleBodyValidationView.className = "NewTitleBodyValidationView"
setmetatable(NewTitleBodyValidationView, {__index = TitleBodyCustomizerView})

function NewTitleBodyValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function NewTitleBodyValidationView.new(transformInfoInterface)
    local self = setmetatable(TitleBodyCustomizerView.new(transformInfoInterface), NewTitleBodyValidationView)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. transformInfoInterface:getName(), self, "NewTitleBodyValidationView()")
        end
        self.titleBody = TitleBodyValidation.new()
    return self
end


-- throws Exception
function NewTitleBodyValidationView:toXmlDoc()
        return nil
end


function NewTitleBodyValidationView:isValid()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("View Name: " .. self:getTransformInfoInterface():getName(), self, self.commonStrings.IS_VALID)
            end
            do
                CustomizerUtil.getInstance():insert(self:getTransformInfoInterface(), self.titleBody)
            end
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


function NewTitleBodyValidationView:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.titleBody:validationInfo())
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


function NewTitleBodyValidationView:toValidationInfoDoc()
        return nil
end


function NewTitleBodyValidationView:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function NewTitleBodyValidationView:view()
        return self.views.ValidationOnlyTempUtil:getInstance():view(self)
end

return NewTitleBodyValidationView

