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
-- package org.allbinary.logic.visual.theme

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local CategoryData = require("org.allbinary.business.category.CategoryData")
local CategoryFactoryInterface = require("org.allbinary.business.category.CategoryFactoryInterface")
local StoreThemeCategoryFactory = require("org.allbinary.business.category.store.theme.StoreThemeCategoryFactory")
local StoreThemeCategoryInterface = require("org.allbinary.business.category.store.theme.StoreThemeCategoryInterface")
local CategoryLoaderFactory = require("org.allbinary.data.tree.category.CategoryLoaderFactory")
local CategoryLoaderInterface = require("org.allbinary.data.tree.category.CategoryLoaderInterface")
local DomData = require("org.allbinary.data.tree.dom.DomData")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlData = require("org.allbinary.logic.communication.sql.AbSqlData")
local CryptFileReader = require("org.allbinary.logic.control.crypt.file.CryptFileReader")
local ValidationInterface = require("org.allbinary.logic.control.validate.ValidationInterface")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local PathUtil = require("org.allbinary.logic.io.path.PathUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local CompositeTransformInfoInterface = require("org.allbinary.logic.visual.transform.info.CompositeTransformInfoInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CssStyleValidation = require("org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail.CssStyleValidation")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local ThemeInterface = require("org.allbinary.logic.visual.theme.ThemeInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ThemeValidation = {}
ThemeValidation.__index = ThemeValidation
ThemeValidation.className = "ThemeValidation"

function ThemeValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.transformInfoInterface = nil
    self.styleValidationInterface = nil
    self.themeName = nil
    self.themePreviewImageName = nil
    self.webAppAbPath = nil
    self.categoryAbPath = nil
    self.fileAbPath = nil
end

function ThemeValidation.new(...)
    local count = select("#", ...)
    if count == 3 then return ThemeValidation._new3(...)
    elseif count == 2 then return ThemeValidation._new2(...)
    elseif count == 2 then return ThemeValidation._new2(...)
    end
end


function ThemeValidation._new3(transformInfoInterface, cssStyleValidation, categoryThemePath)
    local self = setmetatable({}, ThemeValidation)
    self:_init_fields()
        self.transformInfoInterface = transformInfoInterface
        local pathData = AbPathData.getInstance()
        local pathUtil = PathUtil.getInstance()
        self.categoryAbPath = pathUtil:removeNameFromPath(categoryThemePath)
        self.themeName = pathData:getNameFromPath(categoryThemePath)
        self.styleValidationInterface = cssStyleValidation
        self:init()
    return self
end


function ThemeValidation._new2(transformInfoInterface, hashMap)
    local self = setmetatable({}, ThemeValidation)
    self:_init_fields()
        self.transformInfoInterface = transformInfoInterface
        local categoryThemeAbPath = AbPath.new(hashMap:get(ThemeData.getInstance().PATH), StringUtil.getInstance().EMPTY_STRING)
        local pathData = AbPathData.getInstance()
        local pathUtil = PathUtil.getInstance()
        self.categoryAbPath = pathUtil:removeNameFromPath(tostring(categoryThemeAbPath))
        self.themeName = pathData:getNameFromPath(tostring(categoryThemeAbPath))
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("CategoryThemePath: ")
            stringBuffer:append(tostring(categoryThemeAbPath))
            stringBuffer:append(" & CategoryPath: ")
            stringBuffer:append(tostring(self.categoryAbPath))
            stringBuffer:append(" & ThemeName: ")
            stringBuffer:append(self.themeName)
            self.logUtil:putF("Http Request Constructor", self, tostring(stringBuffer))
        end
        self:init()
    return self
end


function ThemeValidation._new2(storeThemeCategoryInterface, node)
    local self = setmetatable({}, ThemeValidation)
    self:_init_fields()
        self.transformInfoInterface = storeThemeCategoryInterface:getTransformInfoInterface()
        self.categoryAbPath = storeThemeCategoryInterface:getPath()
        local themeNameNode = DomSearchHelper.getNode(ThemeData.getInstance().NAME, node:getChildNodes())
        local valueNode = DomSearchHelper.getNode(DomData.VALUE, themeNameNode:getChildNodes())
        self.themeName = DomNodeHelper.getTextNodeValue(valueNode)
        local previewImageNameNode = DomSearchHelper.getNode(ThemeData.getInstance().PREVIEW_IMAGE_NAME, node:getChildNodes())
        local previewImageNameValueNode = DomSearchHelper.getNode(DomData.VALUE, previewImageNameNode:getChildNodes())
        self.themePreviewImageName = DomNodeHelper.getTextNodeValue(previewImageNameValueNode)
        self.webAppAbPath = storeThemeCategoryInterface:getWebAppPath()
        self:init(storeThemeCategoryInterface)
    return self
end


-- throws Exception
function ThemeValidation:init()
        local categoryFactoryInterface = StoreThemeCategoryFactory.new(self:getTransformInfoInterface())
        local categoryLoaderInterface = CategoryLoaderFactory.getInstance(categoryFactoryInterface)
        local rootStoreThemeCategoryInterface = categoryFactoryInterface:getRootInstance()
        self:init(rootStoreThemeCategoryInterface)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function ThemeValidation:init(storeThemeCategoryInterface)
        self.fileAbPath = AbPath.new(tostring(storeThemeCategoryInterface:getRootFilePath()) .. tostring(self.categoryAbPath), StringUtil.getInstance().EMPTY_STRING)
        self.webAppAbPath = storeThemeCategoryInterface:getWebAppPath()
end


-- throws Exception
function ThemeValidation:getTransformInfoInterface()
        return self.transformInfoInterface
end


function ThemeValidation:getName()
        return self.themeName
end


function ThemeValidation:getPreviewImageName()
        return self.themePreviewImageName
end


function ThemeValidation:getPreviewImagePath()
        return tostring(self.webAppAbPath) .. tostring(self.categoryAbPath)
end


function ThemeValidation:getPath()
        return tostring(self.categoryAbPath)
end


-- throws Exception
function ThemeValidation:getCssStyleValidation()
        if self.styleValidationInterface == nil then
            local cssStyleFileAbPath = AbPath.new(tostring(self.fileAbPath), self.themeName .. tostring(AbPathData.getInstance().EXTENSION_SEP) .. tostring(CategoryData.getInstance().UNCRYPTED_EXTENSION))
            local cryptFileReader = CryptFileReader.new(CategoryData.getInstance().UNCRYPTED_EXTENSION, CategoryData.getInstance().ENCRYPTED_EXTENSION)
            local document = DomDocumentHelper.create(cryptFileReader:get(cssStyleFileAbPath))
            self.styleValidationInterface = CssStyleValidation.new(document)
        end
        return self.styleValidationInterface
end


function ThemeValidation:isValid()
        local try_ok, try_error = pcall(function()
            local isValid = true
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.IS_VALID)
            end
            if not StringValidationUtil.getInstance():isValidRequired(tostring(self.categoryAbPath), AbSqlData.MINSTRING, AbSqlData.MAXSTRING) then
                isValid = false
            end
            if not StringValidationUtil.getInstance():isValidRequired(self.themeName, AbSqlData.MINSTRING, AbSqlData.MAXSTRING) then
                isValid = false
            end
            if not self:getCssStyleValidation():isValid() then
                isValid = false
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("End: " .. tostring(isValid), self, self.commonStrings.IS_VALID)
            end
            return isValid
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to validate form", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function ThemeValidation:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Theme Validation Error")
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Validating Form"
        end
end


function ThemeValidation:toValidationInfoDoc()
        return nil
end


function ThemeValidation:toValidationInfoNode(document)
        return nil
end


function ThemeValidation:getKey()
        return self:getName()
end


function ThemeValidation:toVector()
        local vector = BasicArrayListD.new()
        vector:add(self:getName())
        vector:add(self:getPath())
        vector:add(self:getPreviewImageName())
        vector:add(self:getPreviewImagePath())
        return vector
end


function ThemeValidation:toHashMap()
        local themeData = ThemeData.getInstance()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(themeData.NAME, self:getName())
        hashMap:put(themeData.PATH, self:getPath())
        hashMap:put(themeData.PREVIEW_IMAGE_NAME, self:getPreviewImageName())
        hashMap:put(themeData.PREVIEW_IMAGE_PATH, self:getPreviewImagePath())
        return hashMap
end


-- throws Exception
function ThemeValidation:toXmlNode(document)
        local node = ModDomHelper.createNameValueNodes(document, ThemeData.getInstance().NAME, self:toHashMap())
        local domNodeInterface = self:getCssStyleValidation()
        node:appendChild(domNodeInterface:toXmlNode(document))
        return node
end

return ThemeValidation

