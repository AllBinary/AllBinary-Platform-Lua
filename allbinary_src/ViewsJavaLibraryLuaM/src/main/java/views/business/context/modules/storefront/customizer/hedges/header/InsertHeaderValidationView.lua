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

-- local HashMap = require("java.util.HashMap")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local MultipartRequestParams = require("org.allbinary.logic.communication.http.request.MultipartRequestParams")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local HeadingValidation = require("org.allbinary.logic.visual.transform.template.customizer.hedges.heading.HeadingValidation")
local LogoData = require("org.allbinary.logic.visual.transform.template.customizer.widgets.logo.LogoData")
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

local InsertHeaderValidationView = {}
InsertHeaderValidationView.__index = InsertHeaderValidationView
InsertHeaderValidationView.className = "InsertHeaderValidationView"
setmetatable(InsertHeaderValidationView, {__index = TopBarView})

function InsertHeaderValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.LOGOPATH = "logo/"
end


function InsertHeaderValidationView.new(transformInfoInterface)
    local self = setmetatable(TopBarView.new(transformInfoInterface), InsertHeaderValidationView)
    self:_init_fields()
        -- super(...) made self above
        local multipartRequestHashMap = MultipartRequestParams.new(self:getPageContext()):toHashMap()
        local storeFrontInterface = StoreFrontFactory.getInstance(self:getWeblisketSession():getStoreName())
        local fullPath = tostring(self.URLGLOBALS:getWebappPath() + storeFrontInterface:getCurrentHostNamePath()) .. self.LOGOPATH
        multipartRequestHashMap:put(LogoData.getInstance().IMAGEPATH, fullPath)
        self.heading = HeadingValidation.new(multipartRequestHashMap)
    return self
end


-- throws Exception
function InsertHeaderValidationView:toXmlDoc()
        return nil
end


function InsertHeaderValidationView:isValid()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("topbarValidation", self, self.commonStrings.IS_VALID)
            end
            local isValid = self.heading:isValid()
            if isValid == true then
                CustomizerUtil.getInstance():insert(self:getTransformInfoInterface(), self)
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


function InsertHeaderValidationView:validationInfo()
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


function InsertHeaderValidationView:toValidationInfoDoc()
        return nil
end


function InsertHeaderValidationView:toValidationInfoNode(document)
        return nil
end

return InsertHeaderValidationView

