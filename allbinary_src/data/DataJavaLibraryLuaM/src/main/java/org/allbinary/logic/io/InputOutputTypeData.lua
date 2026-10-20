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
-- package org.allbinary.logic.io


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InputOutputTypeData = {}
InputOutputTypeData.__index = InputOutputTypeData
InputOutputTypeData.className = "InputOutputTypeData"

function InputOutputTypeData:_init_fields()
    self.NAME = "INPUT_OUTPUT_TYPE_NAME"
    self.FILE = "INPUT_OUTPUT_TYPE_FILE"
    self.RESPONSE = "INPUT_OUTPUT_TYPE_RESPONSE"
    self.DB = "INPUT_OUTPUT_TYPE_DB"
    self.JSP = "jsp"
    self.JSP_FRAGMENT = "jspf"
    self.PHP = "php"
    self.ASP = "asp"
    self.PL = "pl"
    self.DEFAULT = self.JSP
    self.DEFAULT_FRAGMENT = self.JSP_FRAGMENT
end


function InputOutputTypeData.getInstance()
        return InputOutputTypeData.instance
end


function InputOutputTypeData.new()
    local self = setmetatable({}, InputOutputTypeData)
    self:_init_fields()
    return self
end

InputOutputTypeData.instance = InputOutputTypeData.new()

return InputOutputTypeData

