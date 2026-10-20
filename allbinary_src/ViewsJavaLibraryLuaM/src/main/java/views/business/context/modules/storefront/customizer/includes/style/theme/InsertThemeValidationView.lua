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
-- package views.business.context.modules.storefront.customizer.includes.style.theme

-- local HashMap = require("java.util.HashMap")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local NameSpaceRequestParams = require("org.allbinary.logic.communication.http.request.NameSpaceRequestParams")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local ThemeValidation = require("org.allbinary.logic.visual.theme.ThemeValidation")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local CustomizerUtil = require("views.business.context.modules.storefront.customizer.CustomizerUtil")
local StoreCustomizerComponentUtil = require("views.business.context.modules.storefront.customizer.StoreCustomizerComponentUtil")
local ThemeCustomizerView = require("views.business.context.modules.storefront.customizer.includes.style.theme.ThemeCustomizerView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InsertThemeValidationView = {}
InsertThemeValidationView.__index = InsertThemeValidationView
InsertThemeValidationView.className = "InsertThemeValidationView"
setmetatable(InsertThemeValidationView, {__index = ThemeCustomizerView})

function InsertThemeValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.requestHashMap = nil
end


function InsertThemeValidationView.new(transformInfoInterface)
    local self = setmetatable(ThemeCustomizerView.new(transformInfoInterface), InsertThemeValidationView)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, "started")
        end
        self.requestHashMap = NameSpaceRequestParams.new(self:getPageContext()):toHashMap()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, "begin loading theme")
        end
    return self
end


-- throws Exception
function InsertThemeValidationView:toXmlDoc()
        return nil
end


function InsertThemeValidationView:isValid()
        local try_ok, try_error = pcall(function()
            local isValid = true
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Started Validation", self, self.commonStrings.IS_VALID)
            end
            local themeValidation = ThemeValidation.new(self:getTransformInfoInterface(), self.requestHashMap)
            if themeValidation:isValid() == false then
                isValid = false
            end
            self.validationInterface = themeValidation:getCssStyleValidation()
            isValid = self.validationInterface:isValid()
            if isValid == true then
                CustomizerUtil.getInstance():insert(self:getTransformInfoInterface(), self.validationInterface)
            end
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


function InsertThemeValidationView:validationInfo()
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


function InsertThemeValidationView:toValidationInfoDoc()
        return nil
end


function InsertThemeValidationView:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function InsertThemeValidationView:view()
        local try_ok, try_error = pcall(function()
            return StoreCustomizerComponentUtil.getInstance():generate(self.abeClientInformation, self:getTransformInfoInterface())
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

return InsertThemeValidationView

