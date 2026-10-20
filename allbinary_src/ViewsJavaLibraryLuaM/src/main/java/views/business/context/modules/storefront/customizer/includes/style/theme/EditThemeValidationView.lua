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

local CategoryFactoryInterface = require("org.allbinary.business.category.CategoryFactoryInterface")
local CategoryInterface = require("org.allbinary.business.category.CategoryInterface")
local StoreThemeCategoryFactory = require("org.allbinary.business.category.store.theme.StoreThemeCategoryFactory")
local StoreThemeCategoryInterface = require("org.allbinary.business.category.store.theme.StoreThemeCategoryInterface")
local StoreThemeCategoryPathValidationView = require("org.allbinary.business.category.store.theme.StoreThemeCategoryPathValidationView")
local CategoryLoaderFactory = require("org.allbinary.data.tree.category.CategoryLoaderFactory")
local CategoryLoaderInterface = require("org.allbinary.data.tree.category.CategoryLoaderInterface")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
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

local EditThemeValidationView = {}
EditThemeValidationView.__index = EditThemeValidationView
EditThemeValidationView.className = "EditThemeValidationView"
setmetatable(EditThemeValidationView, {__index = ThemeCustomizerView})

function EditThemeValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function EditThemeValidationView.new(transformInfoInterface)
    local self = setmetatable(ThemeCustomizerView.new(transformInfoInterface), EditThemeValidationView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function EditThemeValidationView:isValid()
        local try_ok, try_error = pcall(function()
            local isValid = true
            local categoryFactoryInterface = StoreThemeCategoryFactory.new(self:getTransformInfoInterface())
            local categoryLoaderInterface = CategoryLoaderFactory.getInstance(categoryFactoryInterface)
            local rootStoreThemeCategoryInterface = categoryFactoryInterface:getRootInstance()
            local storeThemeCategoryInterface = categoryLoaderInterface:getAll(rootStoreThemeCategoryInterface)
            self.validationInterface = StoreThemeCategoryPathValidationView.new(storeThemeCategoryInterface)
            isValid = self.validationInterface:isValid()
            local domNodeInterface = self.validationInterface
            local document = DomDocumentHelper.create()
            document:appendChild(domNodeInterface:toXmlNode(document))
            local documentString = XmlDocumentHelper.toString(document)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:putF("Setting Data: " .. documentString, self, self.commonStrings.CONSTRUCTOR)
            end
            self:getTransformInfoInterface():setData(documentString)
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


function EditThemeValidationView:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.validationInterface:validationInfo())
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


function EditThemeValidationView:toValidationInfoDoc()
        return nil
end


function EditThemeValidationView:toValidationInfoNode(document)
        return nil
end

return EditThemeValidationView

