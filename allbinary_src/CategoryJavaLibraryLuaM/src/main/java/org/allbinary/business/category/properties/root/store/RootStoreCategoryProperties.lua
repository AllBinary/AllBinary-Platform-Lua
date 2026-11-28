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
-- package org.allbinary.business.category.properties.root.store

local RootStoreCategoryProperties = {}
package.loaded["org.allbinary.business.category.properties.root.store.RootStoreCategoryProperties"] = RootStoreCategoryProperties

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
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local CategoryData = java_lazy("org.allbinary.business.category.CategoryData")
local CategoryUtil = java_lazy("org.allbinary.business.category.CategoryUtil")
local CategoryHierarchyInterface = java_lazy("org.allbinary.business.category.hierarchy.CategoryHierarchyInterface")
local CategoryPropertiesInterface = java_lazy("org.allbinary.business.category.properties.CategoryPropertiesInterface")
local RootCategoryPropertiesInterface = java_lazy("org.allbinary.business.category.properties.root.RootCategoryPropertiesInterface")
local StoreFrontFactory = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoHttpInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table RootStoreCategoryProperties is declared before the requires
RootStoreCategoryProperties.__index = RootStoreCategoryProperties
RootStoreCategoryProperties.className = "RootStoreCategoryProperties"
RootStoreCategoryProperties.javaClassName = "org.allbinary.business.category.properties.root.store.RootStoreCategoryProperties"
RootStoreCategoryProperties.java_implements = " RootCategoryPropertiesInterface CategoryPropertiesInterface "
RootStoreCategoryProperties.java_interfaces = function() return {RootCategoryPropertiesInterface, CategoryPropertiesInterface} end

function RootStoreCategoryProperties:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.pathData = AbPathData.getInstance()
    if self.fileAbPath == nil then self.fileAbPath = nil end
    if self.abPath == nil then self.abPath = nil end
    if self.category == nil then self.category = nil end
    if self.isRealRoot_f == nil then self.isRealRoot_f = false end
    if self.webAppAbPath == nil then self.webAppAbPath = nil end
    if self.transformInfoInterface == nil then self.transformInfoInterface = nil end
end

function RootStoreCategoryProperties._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return RootStoreCategoryProperties._new1(self, ...)
    elseif count == 2 then return RootStoreCategoryProperties._new2(self, ...)
    end
    error("No constructor of RootStoreCategoryProperties takes " .. count .. " arguments")
end

function RootStoreCategoryProperties.new(...)
    local self = setmetatable({}, RootStoreCategoryProperties)
    RootStoreCategoryProperties._jinit(self, ...)
    return self
end

function RootStoreCategoryProperties._new2(self, ...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or java_is(java_a1, "TransformInfoInterface")) and (java_a2 == nil or java_is(java_a2, "AbPath")) then return RootStoreCategoryProperties._new2_1(self, ...) end
    if true and (java_a1 == nil or java_is(java_a1, "TransformInfoInterface")) and (java_a2 == nil or java_is(java_a2, "Node")) then return RootStoreCategoryProperties._new2_2(self, ...) end
    return RootStoreCategoryProperties._new2_3(self, ...)
end


function RootStoreCategoryProperties._new1(self, transformInfoInterface)
    RootStoreCategoryProperties._init_fields(self)
        self.transformInfoInterface = transformInfoInterface
        self.abPath = AbPath.createAbPath()
        self.category = CategoryData.getInstance().ROOTCATEGORY
        self.isRealRoot_f = true
        self:initPath()
        self:log()
    return self
end


function RootStoreCategoryProperties._new2_1(self, transformInfoInterface, categoryAbPath)
    RootStoreCategoryProperties._init_fields(self)
        self.transformInfoInterface = transformInfoInterface
        self.abPath = categoryAbPath
        self.category = self.pathData:getNameFromPath(tostring(categoryAbPath))
        if StringValidationUtil.getInstance():isEmpty(self.category) then
            self.isRealRoot_f = true
            self.category = CategoryData.getInstance().ROOTCATEGORY
        end
        self:initPath()
        self:log()
    return self
end


function RootStoreCategoryProperties._new2_2(self, transformInfoInterface, node)
    RootStoreCategoryProperties._init_fields(self)
        self.transformInfoInterface = transformInfoInterface
        local categoryPath = CategoryUtil.getNameFromNode(node)
        self.abPath = AbPath.new(categoryPath, StringUtil.getInstance().EMPTY_STRING)
        self.category = self.pathData:getNameFromPath(categoryPath)
        if StringValidationUtil.getInstance():isEmpty(self.category) then
            self.isRealRoot_f = true
            self.category = CategoryData.getInstance().ROOTCATEGORY
        end
        self:initPath()
        self:log()
    return self
end


function RootStoreCategoryProperties._new2_3(self, transformInfoInterface, categoryPropertiesHashMap)
    RootStoreCategoryProperties._init_fields(self)
        self.transformInfoInterface = transformInfoInterface
        local categoryPath = tostring(categoryPropertiesHashMap:get(CategoryData.getInstance().NAME))
        self.abPath = AbPath.new(categoryPath, StringUtil.getInstance().EMPTY_STRING)
        self.category = self.pathData:getNameFromPath(categoryPath)
        if StringValidationUtil.getInstance():isEmpty(self.category) then
            self.isRealRoot_f = true
            self.category = CategoryData.getInstance().ROOTCATEGORY
        end
        self:initPath()
        self:log()
    return self
end


-- throws Exception
function RootStoreCategoryProperties:initPath()
        local transformInfoHttpStoreInterface = self.transformInfoInterface
        local storeFrontInterface = StoreFrontFactory.getInstance(transformInfoHttpStoreInterface:getStoreName())
        local postPath = storeFrontInterface:getCurrentHostNamePath() + storeFrontInterface:getCategoryPath()
        local httpServletRequest = transformInfoHttpStoreInterface:getPageContext():getRequest()
        self.webAppAbPath = AbPath.new(require("allbinary_java").to_string(httpServletRequest:getContextPath()) .. require("allbinary_java").to_string(postPath), StringUtil.getInstance().EMPTY_STRING)
        self:setRootFilePath(AbPath.new(require("allbinary_java").to_string(URLGLOBALS.getMainPath()) .. require("allbinary_java").to_string(postPath), StringUtil.getInstance().EMPTY_STRING))
end


function RootStoreCategoryProperties:isRealRoot()
        return self.isRealRoot_f
end


function RootStoreCategoryProperties:isRoot()
        return true
end


function RootStoreCategoryProperties:getKey()
        return self:getValue()
end


function RootStoreCategoryProperties:setPath(path)
        self.abPath = path
end


function RootStoreCategoryProperties:setRootFilePath(value)
        self.fileAbPath = value
end


function RootStoreCategoryProperties:getRootFilePath()
        return self.fileAbPath
end


function RootStoreCategoryProperties:getValue()
        return self.category
end


-- throws Exception
function RootStoreCategoryProperties:getWebAppPath()
        return self.webAppAbPath
end


function RootStoreCategoryProperties:getPath(categoryHierarchyInterface)
        return self.abPath
end


function RootStoreCategoryProperties:getFileName()
        return self:getValue() + AbPathData.getInstance().EXTENSION_SEP + CategoryData.getInstance().UNCRYPTED_EXTENSION
end


function RootStoreCategoryProperties:setValue(value)
        self.category = value
end


function RootStoreCategoryProperties:isValid()
        return true
end


function RootStoreCategoryProperties:toHashMap()
        local categoryHashMap = StdUtil.getInstance():createHashMap()
        categoryHashMap:put(CategoryData.getInstance().NAME, self:getValue())
        return categoryHashMap
end


function RootStoreCategoryProperties:toVector()
        local categoryVector = BasicArrayListD.new()
        categoryVector:add(self:getValue())
        return categoryVector
end


-- throws Exception
function RootStoreCategoryProperties:toValidationInfoDoc()
        return nil
end


-- throws Exception
function RootStoreCategoryProperties:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function RootStoreCategoryProperties:validationInfo()
        return nil
end


function RootStoreCategoryProperties:log()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().CATEGORY) then
            self.logUtil:putF(tostring(StringMaker.new():append("filePath = "):append(tostring(self.fileAbPath)):append("\npath = "):append(tostring(self.abPath)):append("\ncategory = "):append(self.category)), self, "log()")
        end
end

return RootStoreCategoryProperties

