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
-- package org.allbinary.logic.communication.log

local AbPathData = require("org.allbinary.logic.io.path.AbPathData")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LogData = {}
LogData.__index = LogData
LogData.className = "LogData"

function LogData:_init_fields()
    self.MAX = 5000000
    self.extension = "log"
    self.backupFileExt = tostring(AbPathData.getInstance().EXTENSION_SEP) .. "bak" .. tostring(AbPathData.getInstance().EXTENSION_SEP) .. "txt"
    self.ALLBINARY = "allbinary"
    self.NAME = "LOG_NAME"
    self.DESCRIPTION = "LOG_DESCRIPTION"
end

function LogData.new()
    local self = setmetatable({}, LogData)
    self:_init_fields()
    return self
end

return LogData

