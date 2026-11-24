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
-- package org.allbinary.business.category.properties

local CategoryProperties = {}
package.loaded["org.allbinary.business.category.properties.CategoryProperties"] = CategoryProperties

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
local CategoryData = java_lazy("org.allbinary.business.category.CategoryData")
local CategoryInterface = java_lazy("org.allbinary.business.category.CategoryInterface")
local CategoryUtil = java_lazy("org.allbinary.business.category.CategoryUtil")
local CategoryHierarchyInterface = java_lazy("org.allbinary.business.category.hierarchy.CategoryHierarchyInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlData = java_lazy("org.allbinary.logic.communication.sql.AbSqlData")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local CategoryPropertiesInterface = require("org.allbinary.business.category.properties.CategoryPropertiesInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

-- class table CategoryProperties is declared before the requires
CategoryProperties.__index = CategoryProperties
CategoryProperties.className = "CategoryProperties"
CategoryProperties.javaClassName = "org.allbinary.business.category.properties.CategoryProperties"
CategoryProperties.java_implements = " CategoryPropertiesInterface "
CategoryProperties.java_interfaces = function() return {CategoryPropertiesInterface} end

function CategoryProperties:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.category == nil then self.category = nil end
end

function CategoryProperties._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return CategoryProperties._new1(self, ...)
    end
    error("No constructor of CategoryProperties takes " .. count .. " arguments")
end

function CategoryProperties.new(...)
    local self = setmetatable({}, CategoryProperties)
    CategoryProperties._jinit(self, ...)
    return self
end

function CategoryProperties._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or type(java_a1) == "string") then return CategoryProperties._new1_1(self, ...) end
    if true and (java_a1 == nil or java_is(java_a1, "Node")) then return CategoryProperties._new1_2(self, ...) end
    return CategoryProperties._new1_3(self, ...)
end


function CategoryProperties._new1_1(self, name)
    CategoryProperties._init_fields(self)
        self.category = name
    return self
end


function CategoryProperties._new1_2(self, node)
    CategoryProperties._init_fields(self)
        self.category = CategoryUtil.getNameFromNode(node)
    return self
end


function CategoryProperties._new1_3(self, categoryPropertiesHashMap)
    CategoryProperties._init_fields(self)
        self.category = tostring(categoryPropertiesHashMap:get(CategoryData.getInstance().NAME))
    return self
end


function CategoryProperties:isRealRoot()
        return false
end


function CategoryProperties:isRoot()
        return false
end


function CategoryProperties:getKey()
        return self:getValue()
end


function CategoryProperties:getValue()
        return self.category
end


-- throws Exception
function CategoryProperties:getPath(categoryHierarchyInterface)
        local abPathData = AbPathData.getInstance()
        local pathStringBuffer = StringMaker.new()
        local list = BasicArrayListD.new()
        local nextParentCategoryInterface = categoryHierarchyInterface:getParent()
        if self ~= nextParentCategoryInterface:getProperties() then
            local depthIndex = 0
            while nextParentCategoryInterface ~= nil do
                if nextParentCategoryInterface:getProperties():isRealRoot() then
                    break
                end
                if nextParentCategoryInterface:getProperties():isRoot() then
                    list:addAt(0, tostring(nextParentCategoryInterface:getPath()))
                else
                    pathStringBuffer:delete(0, pathStringBuffer:length())
                    list:addAt(0, tostring(pathStringBuffer:append(abPathData.SEPARATOR):append(nextParentCategoryInterface:getProperties():getValue())))
                end
                if nextParentCategoryInterface == nextParentCategoryInterface:getHierarchy():getParent() then
                    break
                end
                nextParentCategoryInterface = nextParentCategoryInterface:getHierarchy():getParent()
                depthIndex = depthIndex + 1
                if depthIndex > CategoryProperties.MAXDEPTH then
                    error(require("java.lang.Exception").new("Probably Major Error"), 0)
                end
            end
        end
        pathStringBuffer:delete(0, pathStringBuffer:length())
        pathStringBuffer:append(abPathData.SEPARATOR):append(self:getValue())
        local size = list:size()
        for index = 0, size - 1 do
            pathStringBuffer:append(list:get(index))
        end
        pathStringBuffer:append(abPathData.SEPARATOR)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().CATEGORY) then
            self.logUtil:putF("path = " .. tostring(pathStringBuffer), self, "getPath")
        end
        return AbPath.new(tostring(pathStringBuffer), StringUtil.getInstance().EMPTY_STRING)
end


function CategoryProperties:getFileName()
        return self:getValue() + AbPathData.getInstance().EXTENSION_SEP + CategoryData.getInstance().UNCRYPTED_EXTENSION
end


-- throws Exception
function CategoryProperties:getWebAppPath()
        error(require("java.lang.Exception").new("Not Root"), 0)
end


function CategoryProperties:setValue(value)
        self.category = value
end


function CategoryProperties:isValid()
        local returnBoolean = false
        if StringValidationUtil.getInstance():isValidRequired(self.category, 1, AbSqlData.MAXSTRING) then
            returnBoolean = true
        end
        return returnBoolean
end


function CategoryProperties:toHashMap()
        local categoryHashMap = StdUtil.getInstance():createHashMap()
        categoryHashMap:put(CategoryData.getInstance().NAME, self.category)
        return categoryHashMap
end


function CategoryProperties:toVector()
        local categoryVector = BasicArrayListD.new()
        categoryVector:add(self.category)
        return categoryVector
end


-- throws Exception
function CategoryProperties:toValidationInfoDoc()
        return nil
end


-- throws Exception
function CategoryProperties:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function CategoryProperties:validationInfo()
        return nil
end

CategoryProperties.MAXDEPTH = 100

return CategoryProperties

