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
-- package views.business.context.modules.storefront.customizer.includes.style.css.template.retail

-- local HashMap = require("java.util.HashMap")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local NameSpaceRequestParams = require("org.allbinary.logic.communication.http.request.NameSpaceRequestParams")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CssStyleValidation = require("org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail.CssStyleValidation")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local CustomizerUtil = require("views.business.context.modules.storefront.customizer.CustomizerUtil")
local StoreCustomizerComponentUtil = require("views.business.context.modules.storefront.customizer.StoreCustomizerComponentUtil")
local CssCustomizerView = require("views.business.context.modules.storefront.customizer.includes.style.css.CssCustomizerView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InsertCssValidationView = {}
InsertCssValidationView.__index = InsertCssValidationView
InsertCssValidationView.className = "InsertCssValidationView"
setmetatable(InsertCssValidationView, {__index = CssCustomizerView})

function InsertCssValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function InsertCssValidationView.new(transformInfoInterface)
    local self = setmetatable(CssCustomizerView.new(transformInfoInterface), InsertCssValidationView)
    self:_init_fields()
        -- super(...) made self above
        local requestHashMap = NameSpaceRequestParams.new(self:getPageContext()):toHashMap()
        self.styleValidationInterface = CssStyleValidation.new(requestHashMap)
    return self
end


-- throws Exception
function InsertCssValidationView:toXmlDoc()
        return nil
end


function InsertCssValidationView:isValid()
        local try_ok, try_error = pcall(function()
            local isValid = true
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Started Validation", self, self.commonStrings.IS_VALID)
            end
            if isValid == true then
                CustomizerUtil.getInstance():insert(self:getTransformInfoInterface(), self.styleValidationInterface)
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


function InsertCssValidationView:validationInfo()
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


function InsertCssValidationView:toValidationInfoDoc()
        return nil
end


function InsertCssValidationView:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function InsertCssValidationView:view()
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

return InsertCssValidationView

