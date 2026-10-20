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
-- package org.allbinary.graphics.form

local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FormTypeFactory = {}
FormTypeFactory.__index = FormTypeFactory
FormTypeFactory.className = "FormTypeFactory"

function FormTypeFactory:_init_fields()
    self.UNK = "Unknown FormType"
    self.NULL_FORM_TYPE = FormType.new(StringUtil.getInstance().NULL_STRING)
    self.TEMP_HORIZONTAL_FORM = FormType.new("TempHorizontal")
    self.HORIZONTAL_FORM = FormType.new("Horizontal")
    self.VERTICAL_CENTER_FORM = FormType.new("Vertical")
end

function FormTypeFactory.new()
    local self = setmetatable({}, FormTypeFactory)
    self:_init_fields()
    return self
end


function FormTypeFactory.getInstance()
        return FormTypeFactory.instance
end


function FormTypeFactory:getFormType()
        local displayInfo = DisplayInfoSingleton.getInstance()
        local formType = nil
        if displayInfo:isPortrait() then
            formType = self.VERTICAL_CENTER_FORM
        else
            formType = self.HORIZONTAL_FORM
        end
        return formType
end

FormTypeFactory.instance = FormTypeFactory.new()

return FormTypeFactory

