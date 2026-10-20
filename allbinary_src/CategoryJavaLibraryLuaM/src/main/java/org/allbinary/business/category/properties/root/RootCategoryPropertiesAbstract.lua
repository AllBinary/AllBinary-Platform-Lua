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

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local CategoryData = require("org.allbinary.business.category.CategoryData")
local CategoryHierarchyInterface = require("org.allbinary.business.category.hierarchy.CategoryHierarchyInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RootCategoryPropertiesAbstract = {}
RootCategoryPropertiesAbstract.__index = RootCategoryPropertiesAbstract
RootCategoryPropertiesAbstract.className = "RootCategoryPropertiesAbstract"

function RootCategoryPropertiesAbstract:_init_fields()
    self.category = CategoryData.getInstance().ROOTCATEGORY
    self.fileName = self.category .. tostring(AbPathData.getInstance().EXTENSION_SEP) .. tostring(CategoryData.getInstance().UNCRYPTED_EXTENSION)
end


function RootCategoryPropertiesAbstract.new()
    local self = setmetatable({}, RootCategoryPropertiesAbstract)
    self:_init_fields()
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
        error(java_exception("Exception", "No Value Allowed"), 0)
end


-- throws Exception
function RootCategoryPropertiesAbstract:setRootFilePath(value)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function RootCategoryPropertiesAbstract:setRootFilePath(value)
        error(java_exception("Exception", "No Value Allowed"), 0)
end


-- throws Exception
function RootCategoryPropertiesAbstract:getRootFilePath()
        error(java_exception("Exception", "No Value Allowed"), 0)
end


-- throws Exception
function RootCategoryPropertiesAbstract:isRealRoot()
        error(java_exception("Exception", "No A Real Root"), 0)
end


-- throws Exception
function RootCategoryPropertiesAbstract:isRoot()
        error(java_exception("Exception", "Root but not implemented"), 0)
end


-- throws Exception
function RootCategoryPropertiesAbstract:getWebAppPath(categoryHierarchyInterface)
        error(java_exception("Exception", "Not Root"), 0)
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

