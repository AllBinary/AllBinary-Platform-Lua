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
-- package org.allbinary.business.category.properties.root

local RootCategoryPropertiesAbstract = {}
package.loaded["org.allbinary.business.category.properties.root.RootCategoryPropertiesAbstract"] = RootCategoryPropertiesAbstract

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
local CategoryHierarchyInterface = java_lazy("org.allbinary.business.category.hierarchy.CategoryHierarchyInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local RootCategoryPropertiesInterface = require("org.allbinary.business.category.properties.root.RootCategoryPropertiesInterface")

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

-- class table RootCategoryPropertiesAbstract is declared before the requires
RootCategoryPropertiesAbstract.__index = RootCategoryPropertiesAbstract
RootCategoryPropertiesAbstract.className = "RootCategoryPropertiesAbstract"
RootCategoryPropertiesAbstract.javaClassName = "org.allbinary.business.category.properties.root.RootCategoryPropertiesAbstract"
RootCategoryPropertiesAbstract.java_implements = " RootCategoryPropertiesInterface "
RootCategoryPropertiesAbstract.java_interfaces = function() return {RootCategoryPropertiesInterface} end

function RootCategoryPropertiesAbstract:_init_fields()
    self.category = CategoryData.getInstance().ROOTCATEGORY
    self.fileName = require("allbinary_java").to_string(require("allbinary_java").to_string(self.category) .. require("allbinary_java").to_string(AbPathData.getInstance().EXTENSION_SEP)) .. require("allbinary_java").to_string(CategoryData.getInstance().UNCRYPTED_EXTENSION)
end


function RootCategoryPropertiesAbstract._jinit(self)
    RootCategoryPropertiesAbstract._init_fields(self)
    return self
end

function RootCategoryPropertiesAbstract.new(...)
    local self = setmetatable({}, RootCategoryPropertiesAbstract)
    RootCategoryPropertiesAbstract._jinit(self, ...)
    return self
end


function RootCategoryPropertiesAbstract:getKey()
        return self:getValue()
end


function RootCategoryPropertiesAbstract:getValue()
        return self.category
end


-- throws Exception
function RootCategoryPropertiesAbstract:setValue(value)
        error(require("java.lang.Exception").new("No Value Allowed"), 0)
end


-- throws Exception
function RootCategoryPropertiesAbstract:setRootFilePath_j1_1(value)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function RootCategoryPropertiesAbstract:setRootFilePath_j1_2(value)
        error(require("java.lang.Exception").new("No Value Allowed"), 0)
end
function RootCategoryPropertiesAbstract:setRootFilePath(...)
    local count = select("#", ...)
    if count == 1 then return self:setRootFilePath_j1(...) end
    error("No method setRootFilePath takes " .. count .. " arguments")
end
RootCategoryPropertiesAbstract.setRootFilePath__jdispatcher = RootCategoryPropertiesAbstract.setRootFilePath
function RootCategoryPropertiesAbstract:setRootFilePath_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "AbPath")) then return RootCategoryPropertiesAbstract.setRootFilePath_j1_1(self, ...) end
    return RootCategoryPropertiesAbstract.setRootFilePath_j1_2(self, ...)
end


-- throws Exception
function RootCategoryPropertiesAbstract:getRootFilePath()
        error(require("java.lang.Exception").new("No Value Allowed"), 0)
end


-- throws Exception
function RootCategoryPropertiesAbstract:isRealRoot()
        error(require("java.lang.Exception").new("No A Real Root"), 0)
end


-- throws Exception
function RootCategoryPropertiesAbstract:isRoot()
        error(require("java.lang.Exception").new("Root but not implemented"), 0)
end


-- throws Exception
function RootCategoryPropertiesAbstract:getWebAppPath(categoryHierarchyInterface)
        error(require("java.lang.Exception").new("Not Root"), 0)
end


function RootCategoryPropertiesAbstract:getPath(categoryHierarchyInterface)
        return AbPath.createAbPath()
end


function RootCategoryPropertiesAbstract:getFileName()
        return self.fileName
end


function RootCategoryPropertiesAbstract:isValid()
        return true
end


function RootCategoryPropertiesAbstract:toHashMap()
        local categoryHashMap = StdUtil.getInstance():createHashMap()
        categoryHashMap:put(CategoryData.getInstance().NAME, self.category)
        return categoryHashMap
end


function RootCategoryPropertiesAbstract:toVector()
        local categoryVector = BasicArrayListD.new()
        categoryVector:add(self.category)
        return categoryVector
end


-- throws Exception
function RootCategoryPropertiesAbstract:toValidationInfoDoc()
        return nil
end


-- throws Exception
function RootCategoryPropertiesAbstract:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function RootCategoryPropertiesAbstract:validationInfo()
        return nil
end

return RootCategoryPropertiesAbstract

