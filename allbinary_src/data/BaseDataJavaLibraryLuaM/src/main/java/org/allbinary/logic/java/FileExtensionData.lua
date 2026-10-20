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
-- package org.allbinary.logic.java


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FileExtensionData = {}
FileExtensionData.__index = FileExtensionData
FileExtensionData.className = "FileExtensionData"

function FileExtensionData:_init_fields()
    self.DOT_JAVA_SOURCE = ".java"
    self.JAVA_SOURCE = "java"
end


function FileExtensionData.getInstance()
        return FileExtensionData.instance
end


function FileExtensionData.new()
    local self = setmetatable({}, FileExtensionData)
    self:_init_fields()
    return self
end

FileExtensionData.instance = FileExtensionData.new()

return FileExtensionData

