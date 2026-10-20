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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationInterface = require("org.allbinary.logic.control.validate.ValidationInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local CategoryPropertiesView = require("org.allbinary.business.category.properties.CategoryPropertiesView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CategoryPropertiesValidationView = {}
CategoryPropertiesValidationView.__index = CategoryPropertiesValidationView
CategoryPropertiesValidationView.className = "CategoryPropertiesValidationView"
setmetatable(CategoryPropertiesValidationView, {__index = CategoryPropertiesView})

function CategoryPropertiesValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function CategoryPropertiesValidationView.new(categoryPropertiesInterface)
    local self = setmetatable(CategoryPropertiesView.new(categoryPropertiesInterface), CategoryPropertiesValidationView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function CategoryPropertiesValidationView:isValid()
        return self.categoryPropertiesInterface:isValid()
end


-- throws Exception
function CategoryPropertiesValidationView:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.categoryPropertiesInterface:validationInfo())
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation info error", self, "validationInfo()", e)
            end
            return "Error Validating Data"
        end
end


-- throws Exception
function CategoryPropertiesValidationView:toValidationInfoDoc()
        return nil
end


-- throws Exception
function CategoryPropertiesValidationView:toValidationInfoNode(document)
        return nil
end

return CategoryPropertiesValidationView

