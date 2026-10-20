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
-- package org.allbinary.logic.visual.transform.template


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local XslData = {}
XslData.__index = XslData
XslData.className = "XslData"

function XslData:_init_fields()
    self.NAME = "XSL_NAME"
    self.ROOT_IMPORT_URI = "ROOT_IMPORT_URI"
end


function XslData.getInstance()
        return XslData.instance
end


function XslData.new()
    local self = setmetatable({}, XslData)
    self:_init_fields()
    return self
end

XslData.instance = XslData.new()

return XslData

