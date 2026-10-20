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
-- package org.allbinary.logic.visual.transform.info.objectConfig

local CommonDataFileStrings = require("org.allbinary.logic.io.file.CommonDataFileStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfoObjectConfigData = {}
TransformInfoObjectConfigData.__index = TransformInfoObjectConfigData
TransformInfoObjectConfigData.className = "TransformInfoObjectConfigData"

function TransformInfoObjectConfigData:_init_fields()
    self.NAME = "OBJECTCONFIG_NAME"
    self.VARKEY = "$"
    self.UNCRYPTED_EXTENSION = CommonDataFileStrings.getInstance().UNCRYPTED_EXTENSION
    self.ENCRYPTED_EXTENSION = CommonDataFileStrings.getInstance().ENCRYPTED_EXTENSION
end


function TransformInfoObjectConfigData.getInstance()
        return TransformInfoObjectConfigData.instance
end


function TransformInfoObjectConfigData.new()
    local self = setmetatable({}, TransformInfoObjectConfigData)
    self:_init_fields()
    return self
end

TransformInfoObjectConfigData.instance = TransformInfoObjectConfigData.new()

return TransformInfoObjectConfigData

