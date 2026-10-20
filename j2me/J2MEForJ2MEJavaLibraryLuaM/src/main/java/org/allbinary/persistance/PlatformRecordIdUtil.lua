-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.persistance

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
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

local PlatformRecordIdUtil = {}
PlatformRecordIdUtil.__index = PlatformRecordIdUtil
PlatformRecordIdUtil.className = "PlatformRecordIdUtil"

function PlatformRecordIdUtil:_init_fields()
    self.PLATFORM_SHORT_NAME = "JME"
end

function PlatformRecordIdUtil.new()
    local self = setmetatable({}, PlatformRecordIdUtil)
    self:_init_fields()
    return self
end


function PlatformRecordIdUtil.getInstance()
        return PlatformRecordIdUtil.instance
end


function PlatformRecordIdUtil:getRecordId(abeClientInformation, baseRecordId)
        return tostring(StringMaker.new():append(abeClientInformation:toShortString()):append(CommonSeps.getInstance().UNDERSCORE):append(self.PLATFORM_SHORT_NAME):append(baseRecordId))
end

PlatformRecordIdUtil.instance = PlatformRecordIdUtil.new()

return PlatformRecordIdUtil

