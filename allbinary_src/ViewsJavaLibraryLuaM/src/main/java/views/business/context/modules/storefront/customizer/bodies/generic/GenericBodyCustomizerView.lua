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
-- package views.business.context.modules.storefront.customizer.bodies.generic

local PageData = require("org.allbinary.business.page.PageData")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local StoreTransformer = require("org.allbinary.logic.visual.transform.StoreTransformer")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local GenericBodyValidation = require("org.allbinary.logic.visual.transform.template.customizer.bodies.GenericBodyValidation")
local TransformTemplateCustomizerUtil = require("org.allbinary.logic.visual.transform.template.util.TransformTemplateCustomizerUtil")
local StringEscapeUtils = require("org.apache.commons.lang3.StringEscapeUtils")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GenericBodyCustomizerView = {}
GenericBodyCustomizerView.__index = GenericBodyCustomizerView
GenericBodyCustomizerView.className = "GenericBodyCustomizerView"
setmetatable(GenericBodyCustomizerView, {__index = HttpStoreComponentView})

function GenericBodyCustomizerView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.body = nil
end


function GenericBodyCustomizerView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), GenericBodyCustomizerView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function GenericBodyCustomizerView:addDomNodeInterfaces()
        self:addDomNodeInterface(self.body)
        self:addDomNodeInterface(self)
end


-- throws Exception
function GenericBodyCustomizerView:toXmlNode(document)
        local pageName = TransformTemplateCustomizerUtil.getInstance():getPageNameHack(self:getTransformInfoInterface():getName(), self:getWeblisketSession():getStoreName())
        if StringValidationUtil.getInstance():isEmpty(pageName) then
            pageName = GenericBodyCustomizerView.NAME
        end
        return ModDomHelper.createNameValueNodes(document, PageData.getInstance().NAME, pageName)
end


-- throws Exception
function GenericBodyCustomizerView:view()
        local try_ok, try_error = pcall(function()
            self:addDomNodeInterfaces()
            local success = XmlDocumentHelper.toString(self:getDoc())
            local result = StoreTransformer.new(self.abeClientInformation, self:getTransformInfoInterface()):translate(success)
            return StringEscapeUtils.unescapeHtml3(result)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

GenericBodyCustomizerView.NAME = "None"

return GenericBodyCustomizerView

