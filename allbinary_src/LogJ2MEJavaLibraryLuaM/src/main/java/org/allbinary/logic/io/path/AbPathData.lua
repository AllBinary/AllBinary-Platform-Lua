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
-- package org.allbinary.logic.io.path

local FilePathData = require("org.allbinary.logic.io.file.FilePathData")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbPathData = {}
AbPathData.__index = AbPathData
AbPathData.className = "AbPathData"

function AbPathData:_init_fields()
    self.EXTENSION_SEP = CommonSeps.getInstance().PERIOD
    self.SEPARATORCHAR = "/"
    self.SEPARATOR = CommonSeps.getInstance().FORWARD_SLASH
end


function AbPathData.getInstance()
        return AbPathData.instance
end


function AbPathData.new()
    local self = setmetatable({}, AbPathData)
    self:_init_fields()
    return self
end

AbPathData.instance = AbPathData.new()

return AbPathData

