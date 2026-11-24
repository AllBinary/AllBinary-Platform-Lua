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
-- package org.allbinary.business.category.store.theme

local StoreThemeCategoryFactory = {}
package.loaded["org.allbinary.business.category.store.theme.StoreThemeCategoryFactory"] = StoreThemeCategoryFactory

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
local CategoryFactoryInterface = java_lazy("org.allbinary.business.category.CategoryFactoryInterface")
local CategoryInterface = java_lazy("org.allbinary.business.category.CategoryInterface")
local CategoryUtil = java_lazy("org.allbinary.business.category.CategoryUtil")
local CategoryPropertiesFactory = java_lazy("org.allbinary.business.category.properties.CategoryPropertiesFactory")
local CategoryPropertiesFactoryInterface = java_lazy("org.allbinary.business.category.properties.CategoryPropertiesFactoryInterface")
local RootStoreThemeCategoryPropertiesFactory = java_lazy("org.allbinary.business.category.properties.root.store.theme.RootStoreThemeCategoryPropertiesFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local StoreThemeCategory = java_lazy("org.allbinary.business.category.store.theme.StoreThemeCategory")

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

-- class table StoreThemeCategoryFactory is declared before the requires
StoreThemeCategoryFactory.__index = StoreThemeCategoryFactory
StoreThemeCategoryFactory.className = "StoreThemeCategoryFactory"
StoreThemeCategoryFactory.javaClassName = "org.allbinary.business.category.store.theme.StoreThemeCategoryFactory"
StoreThemeCategoryFactory.java_implements = " CategoryFactoryInterface "
StoreThemeCategoryFactory.java_interfaces = function() return {CategoryFactoryInterface} end

function StoreThemeCategoryFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.transformInfoInterface == nil then self.transformInfoInterface = nil end
end


function StoreThemeCategoryFactory._jinit(self, transformInfoInterface)
    StoreThemeCategoryFactory._init_fields(self)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().CATEGORY) then
            self.logUtil:putF(self.commonStrings.START, self, "StoreCategoryFactory(TransformInfoInterface transformInfoInterface)")
        end
        self.transformInfoInterface = transformInfoInterface
    return self
end

function StoreThemeCategoryFactory.new(...)
    local self = setmetatable({}, StoreThemeCategoryFactory)
    StoreThemeCategoryFactory._jinit(self, ...)
    return self
end


function StoreThemeCategoryFactory:getRootInstance_j0()
        local try_ok, try_error, try_value = pcall(function()
            local categoryPropertiesFactoryInterface = RootStoreThemeCategoryPropertiesFactory.new(self.transformInfoInterface)
            do return "__jreturn", StoreThemeCategory.new(self.transformInfoInterface, categoryPropertiesFactoryInterface, 0) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getRootInstance()", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function StoreThemeCategoryFactory:getRootInstance_j1(categoryAbPath)
        local try_ok, try_error, try_value = pcall(function()
            local level = CategoryUtil.getPathLevel(categoryAbPath)
            local categoryPropertiesFactoryInterface = RootStoreThemeCategoryPropertiesFactory.new(self.transformInfoInterface, categoryAbPath)
            do return "__jreturn", StoreThemeCategory.new(self.transformInfoInterface, categoryPropertiesFactoryInterface, level) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getRootInstance(String)", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function StoreThemeCategoryFactory:getRootInstance(...)
    local count = select("#", ...)
    if count == 0 then return self:getRootInstance_j0(...) end
    if count == 1 then return self:getRootInstance_j1(...) end
    error("No method getRootInstance takes " .. count .. " arguments")
end
StoreThemeCategoryFactory.getRootInstance__jdispatcher = StoreThemeCategoryFactory.getRootInstance


function StoreThemeCategoryFactory:getRootInstanceFromNode(node)
        local try_ok, try_error, try_value = pcall(function()
            local categoryPropertiesFactoryInterface = RootStoreThemeCategoryPropertiesFactory.new(self.transformInfoInterface, node)
            local categoryPath = AbPath.new(CategoryUtil.getNameFromNode(node), StringUtil.getInstance().EMPTY_STRING)
            local level = CategoryUtil.getPathLevel(categoryPath)
            do return "__jreturn", StoreThemeCategory.new(self.transformInfoInterface, node, categoryPropertiesFactoryInterface, level) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getRootInstance(node)", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function StoreThemeCategoryFactory:getInstance_j2_1(categoryPath, level)
        local try_ok, try_error, try_value = pcall(function()
            local categoryPropertiesFactoryInterface = CategoryPropertiesFactory.new(categoryPath)
            do return "__jreturn", StoreThemeCategory.new(self.transformInfoInterface, categoryPropertiesFactoryInterface, level) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstance(String, int)", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function StoreThemeCategoryFactory:getInstance_j3_1(rootCategoryInterface, parentCategoryInterface, categoryPath)
        local try_ok, try_error, try_value = pcall(function()
            local categoryPropertiesFactoryInterface = CategoryPropertiesFactory.new(categoryPath)
            do return "__jreturn", StoreThemeCategory.new(self.transformInfoInterface, rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstance(CategoryInterface, CategoryInterface , String, int)", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function StoreThemeCategoryFactory:getInstance_j2_2(node, level)
        local try_ok, try_error, try_value = pcall(function()
            local categoryPropertiesFactoryInterface = CategoryPropertiesFactory.new(node)
            do return "__jreturn", StoreThemeCategory.new(self.transformInfoInterface, categoryPropertiesFactoryInterface, level) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstance(Node, int)", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function StoreThemeCategoryFactory:getInstance_j3_2(rootCategoryInterface, parentCategoryInterface, node)
        local try_ok, try_error, try_value = pcall(function()
            local categoryPropertiesFactoryInterface = CategoryPropertiesFactory.new(node)
            do return "__jreturn", StoreThemeCategory.new(self.transformInfoInterface, rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstance(CategoryInterface, CategoryInterface, Node, int)", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function StoreThemeCategoryFactory:getInstance_j2_3(categoryPropertiesHashMap, level)
        local try_ok, try_error, try_value = pcall(function()
            local categoryPropertiesFactoryInterface = CategoryPropertiesFactory.new(categoryPropertiesHashMap)
            do return "__jreturn", StoreThemeCategory.new(self.transformInfoInterface, categoryPropertiesFactoryInterface, level) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstance(HashMap)", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function StoreThemeCategoryFactory:getInstance_j3_3(rootCategoryInterface, parentCategoryInterface, categoryPropertiesHashMap)
        local try_ok, try_error, try_value = pcall(function()
            local categoryPropertiesFactoryInterface = CategoryPropertiesFactory.new(categoryPropertiesHashMap)
            do return "__jreturn", StoreThemeCategory.new(self.transformInfoInterface, rootCategoryInterface, parentCategoryInterface, categoryPropertiesFactoryInterface) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getInstance(CategoryInterface, CategoryInterface, HashMap)", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function StoreThemeCategoryFactory:getInstance(...)
    local count = select("#", ...)
    if count == 2 then return self:getInstance_j2(...) end
    if count == 3 then return self:getInstance_j3(...) end
    error("No method getInstance takes " .. count .. " arguments")
end
StoreThemeCategoryFactory.getInstance__jdispatcher = StoreThemeCategoryFactory.getInstance
function StoreThemeCategoryFactory:getInstance_j2(...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or type(java_a1) == "string") and math.type(java_a2) == "integer" then return StoreThemeCategoryFactory.getInstance_j2_1(self, ...) end
    if true and (java_a1 == nil or java_is(java_a1, "Node")) and math.type(java_a2) == "integer" then return StoreThemeCategoryFactory.getInstance_j2_2(self, ...) end
    return StoreThemeCategoryFactory.getInstance_j2_3(self, ...)
end
function StoreThemeCategoryFactory:getInstance_j3(...)
    local java_a1, java_a2, java_a3 = ...
    if true and (java_a1 == nil or java_is(java_a1, "CategoryInterface")) and (java_a2 == nil or java_is(java_a2, "CategoryInterface")) and (java_a3 == nil or type(java_a3) == "string") then return StoreThemeCategoryFactory.getInstance_j3_1(self, ...) end
    if true and (java_a1 == nil or java_is(java_a1, "CategoryInterface")) and (java_a2 == nil or java_is(java_a2, "CategoryInterface")) and (java_a3 == nil or java_is(java_a3, "Node")) then return StoreThemeCategoryFactory.getInstance_j3_2(self, ...) end
    return StoreThemeCategoryFactory.getInstance_j3_3(self, ...)
end

return StoreThemeCategoryFactory

