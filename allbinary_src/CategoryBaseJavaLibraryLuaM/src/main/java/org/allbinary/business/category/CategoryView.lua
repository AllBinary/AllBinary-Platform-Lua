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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local CategoryPropertiesInterface = require("org.allbinary.business.category.properties.CategoryPropertiesInterface")
local CategoryPropertiesView = require("org.allbinary.business.category.properties.CategoryPropertiesView")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local InterfaceUtil = require("org.allbinary.logic.java.anyType.InterfaceUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

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

local CategoryView = {}
CategoryView.__index = CategoryView
CategoryView.className = "CategoryView"

function CategoryView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.categoryInterface = nil
end


function CategoryView.new(categoryInterface)
    local self = setmetatable({}, CategoryView)
    self:_init_fields()
        self.categoryInterface = categoryInterface
    return self
end


function CategoryView:getCategoryInterface()
        return self.categoryInterface
end


-- throws Exception
function CategoryView:toXmlNode(document)
        local node = document:createElement(CategoryData.getInstance().NAME)
        local childCategoryVector = self.categoryInterface:getChildNodes()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().CATEGORY) then
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
                error(java_exception("Exception", "CategoryView found unknown object.\n" .. "Show Testing:" .. isImpl), 0)
            end
            local childCategoryNode = CategoryPropertiesView.new(categoryPropertiesInterface):toXmlNode(document)
            node:appendChild(childCategoryNode)
        end
        return node
end

return CategoryView

