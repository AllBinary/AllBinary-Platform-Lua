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

local ThemeValidation = {}
package.loaded["org.allbinary.logic.visual.theme.ThemeValidation"] = ThemeValidation

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local CategoryData = java_lazy("org.allbinary.business.category.CategoryData")
local CategoryFactoryInterface = java_lazy("org.allbinary.business.category.CategoryFactoryInterface")
local StoreThemeCategoryFactory = java_lazy("org.allbinary.business.category.store.theme.StoreThemeCategoryFactory")
local StoreThemeCategoryInterface = java_lazy("org.allbinary.business.category.store.theme.StoreThemeCategoryInterface")
local CategoryLoaderFactory = java_lazy("org.allbinary.data.tree.category.CategoryLoaderFactory")
local CategoryLoaderInterface = java_lazy("org.allbinary.data.tree.category.CategoryLoaderInterface")
local DomData = java_lazy("org.allbinary.data.tree.dom.DomData")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlData = java_lazy("org.allbinary.logic.communication.sql.AbSqlData")
local CryptFileReader = java_lazy("org.allbinary.logic.control.crypt.file.CryptFileReader")
local ValidationInterface = java_lazy("org.allbinary.logic.control.validate.ValidationInterface")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local PathUtil = java_lazy("org.allbinary.logic.io.path.PathUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local CompositeTransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.CompositeTransformInfoInterface")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CssStyleValidation = java_lazy("org.allbinary.logic.visual.transform.template.customizer.includes.style.css.template.retail.CssStyleValidation")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local ThemeInterface = require("org.allbinary.logic.visual.theme.ThemeInterface")
local ThemeData = java_lazy("org.allbinary.logic.visual.theme.ThemeData")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table ThemeValidation is declared before the requires
ThemeValidation.__index = ThemeValidation
ThemeValidation.className = "ThemeValidation"
ThemeValidation.javaClassName = "org.allbinary.logic.visual.theme.ThemeValidation"
ThemeValidation.java_implements = " ThemeInterface ValidationInterface DomNodeInterface CompositeTransformInfoInterface "
ThemeValidation.java_interfaces = function() return {ThemeInterface, ValidationInterface, DomNodeInterface, CompositeTransformInfoInterface} end

function ThemeValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.transformInfoInterface == nil then self.transformInfoInterface = nil end
    if self.styleValidationInterface == nil then self.styleValidationInterface = nil end
    if self.themeName == nil then self.themeName = nil end
    if self.themePreviewImageName == nil then self.themePreviewImageName = nil end
    if self.webAppAbPath == nil then self.webAppAbPath = nil end
    if self.categoryAbPath == nil then self.categoryAbPath = nil end
    if self.fileAbPath == nil then self.fileAbPath = nil end
end

function ThemeValidation._jinit(self, ...)
    local count = select("#", ...)
    if count == 3 then return ThemeValidation._new3(self, ...)
    elseif count == 2 then return ThemeValidation._new2(self, ...)
    end
    error("No constructor of ThemeValidation takes " .. count .. " arguments")
end

function ThemeValidation.new(...)
    local self = setmetatable({}, ThemeValidation)
    ThemeValidation._jinit(self, ...)
    return self
end

function ThemeValidation._new2(self, ...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or java_is(java_a1, "TransformInfoInterface")) and (java_a2 == nil or java_is(java_a2, "HashMap")) then return ThemeValidation._new2_1(self, ...) end
    return ThemeValidation._new2_2(self, ...)
end


function ThemeValidation._new3(self, transformInfoInterface, cssStyleValidation, categoryThemePath)
    ThemeValidation._init_fields(self)
        self.transformInfoInterface = transformInfoInterface
        local pathData = AbPathData.getInstance()
        local pathUtil = PathUtil.getInstance()
        self.categoryAbPath = pathUtil:removeNameFromPath(categoryThemePath)
        self.themeName = pathData:getNameFromPath(categoryThemePath)
        self.styleValidationInterface = cssStyleValidation
        self:init()
    return self
end


function ThemeValidation._new2_1(self, transformInfoInterface, hashMap)
    ThemeValidation._init_fields(self)
        self.transformInfoInterface = transformInfoInterface
        local categoryThemeAbPath = AbPath.new(hashMap:get(ThemeData.getInstance().PATH), StringUtil.getInstance().EMPTY_STRING)
        local pathData = AbPathData.getInstance()
        local pathUtil = PathUtil.getInstance()
        self.categoryAbPath = pathUtil:removeNameFromPath(tostring(categoryThemeAbPath))
        self.themeName = pathData:getNameFromPath(tostring(categoryThemeAbPath))
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
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


function ThemeValidation._new2_2(self, storeThemeCategoryInterface, node)
    ThemeValidation._init_fields(self)
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
function ThemeValidation:init_j0()
        local categoryFactoryInterface = StoreThemeCategoryFactory.new(self:getTransformInfoInterface())
        local categoryLoaderInterface = CategoryLoaderFactory.getInstance(categoryFactoryInterface)
        local rootStoreThemeCategoryInterface = categoryFactoryInterface:getRootInstance()
        self:init(rootStoreThemeCategoryInterface)
end


-- throws Exception
function ThemeValidation:init_j1(storeThemeCategoryInterface)
        self.fileAbPath = AbPath.new(tostring(storeThemeCategoryInterface:getRootFilePath()) .. tostring(self.categoryAbPath), StringUtil.getInstance().EMPTY_STRING)
        self.webAppAbPath = storeThemeCategoryInterface:getWebAppPath()
end
function ThemeValidation:init(...)
    local count = select("#", ...)
    if count == 0 then return self:init_j0(...) end
    if count == 1 then return self:init_j1(...) end
    error("No method init takes " .. count .. " arguments")
end
ThemeValidation.init__jdispatcher = ThemeValidation.init


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
        local try_ok, try_error, try_value = pcall(function()
            local isValid = true
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
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
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF("End: " .. tostring(isValid), self, self.commonStrings.IS_VALID)
            end
            do return "__jreturn", isValid end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to validate form", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function ThemeValidation:validationInfo()
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Theme Validation Error")
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Validating Form"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
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

