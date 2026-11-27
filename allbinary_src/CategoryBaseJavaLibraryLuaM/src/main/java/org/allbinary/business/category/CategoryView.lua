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
-- package org.allbinary.business.category

local CategoryView = {}
package.loaded["org.allbinary.business.category.CategoryView"] = CategoryView

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local CategoryPropertiesInterface = java_lazy("org.allbinary.business.category.properties.CategoryPropertiesInterface")
local CategoryPropertiesView = java_lazy("org.allbinary.business.category.properties.CategoryPropertiesView")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local InterfaceUtil = java_lazy("org.allbinary.logic.java.anyType.InterfaceUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local CategoryData = java_lazy("org.allbinary.business.category.CategoryData")
local CategoryInterface = java_lazy("org.allbinary.business.category.CategoryInterface")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table CategoryView is declared before the requires
CategoryView.__index = CategoryView
CategoryView.className = "CategoryView"
CategoryView.javaClassName = "org.allbinary.business.category.CategoryView"
CategoryView.java_implements = " DomNodeInterface "
CategoryView.java_interfaces = function() return {DomNodeInterface} end

function CategoryView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.categoryInterface == nil then self.categoryInterface = nil end
end


function CategoryView._jinit(self, categoryInterface)
    CategoryView._init_fields(self)
        self.categoryInterface = categoryInterface
    return self
end

function CategoryView.new(...)
    local self = setmetatable({}, CategoryView)
    CategoryView._jinit(self, ...)
    return self
end


function CategoryView:getCategoryInterface()
        return self.categoryInterface
end


-- throws Exception
function CategoryView:toXmlNode(document)
        local node = document:createElement(CategoryData.getInstance().NAME)
        local childCategoryVector = self.categoryInterface:getChildNodes()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().CATEGORY) then
            self.logUtil:putF("Number Of Children: " .. tostring(childCategoryVector:size()), self, "toXmlNode")
        end
        local size = childCategoryVector:size()
        for i = 0, size - 1 do
            local anyType = childCategoryVector:get(i)
            local categoryPropertiesInterface = nil
            if InterfaceUtil.isImplemented("CategoryPropertiesInterface", anyType) then
                categoryPropertiesInterface = anyType
            elseif InterfaceUtil.isImplemented("CategoryInterface", anyType) then
                local categoryInterface = anyType
                categoryPropertiesInterface = categoryInterface:getProperties()
            else
                local isImpl = InterfaceUtil.viewAll(getmetatable(anyType), CommonSeps.getInstance().NEW_LINE)
                error(require("java.lang.Exception").new("CategoryView found unknown object.\n" .. "Show Testing:" .. isImpl), 0)
            end
            local childCategoryNode = CategoryPropertiesView.new(categoryPropertiesInterface):toXmlNode(document)
            node:appendChild(childCategoryNode)
        end
        return node
end

return CategoryView

