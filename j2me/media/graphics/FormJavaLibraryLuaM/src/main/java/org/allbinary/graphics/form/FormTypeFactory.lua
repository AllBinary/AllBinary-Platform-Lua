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

local FormTypeFactory = {}
package.loaded["org.allbinary.graphics.form.FormTypeFactory"] = FormTypeFactory

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

local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local FormType = java_lazy("org.allbinary.graphics.form.FormType")

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

-- class table FormTypeFactory is declared before the requires
FormTypeFactory.__index = FormTypeFactory
FormTypeFactory.className = "FormTypeFactory"
FormTypeFactory.javaClassName = "org.allbinary.graphics.form.FormTypeFactory"

function FormTypeFactory:_init_fields()
    self.UNK = "Unknown FormType"
    self.NULL_FORM_TYPE = FormType.new(StringUtil.getInstance().NULL_STRING)
    self.TEMP_HORIZONTAL_FORM = FormType.new("TempHorizontal")
    self.HORIZONTAL_FORM = FormType.new("Horizontal")
    self.VERTICAL_CENTER_FORM = FormType.new("Vertical")
end

function FormTypeFactory._jinit(self)
    FormTypeFactory._init_fields(self)
    return self
end

function FormTypeFactory.new()
    return FormTypeFactory._jinit(setmetatable({}, FormTypeFactory))
end


function FormTypeFactory.getInstance()
        return FormTypeFactory.instance_f
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

FormTypeFactory.instance_f = FormTypeFactory.new()

return FormTypeFactory

