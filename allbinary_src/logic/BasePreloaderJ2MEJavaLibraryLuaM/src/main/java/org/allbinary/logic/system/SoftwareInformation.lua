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
-- package org.allbinary.logic.system

local KotlinUtil = require("org.allbinary.KotlinUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
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

local SoftwareInformation = {}
SoftwareInformation.__index = SoftwareInformation
SoftwareInformation.className = "SoftwareInformation"

function SoftwareInformation:_init_fields()
    self.name = nil
    self.shortName = nil
    self.version = nil
end


function SoftwareInformation.new(name, version, shortName)
    local self = setmetatable({}, SoftwareInformation)
    self:_init_fields()
        self.name = name
        self.version = version
        self.shortName = tostring(StringMaker.new():append(shortName):append(KotlinUtil.getShortName()))
    return self
end


function SoftwareInformation:getName()
        return self.name
end


function SoftwareInformation:getVersion()
        return self.version
end


function SoftwareInformation:toShortString()
        return self.shortName
end


function SoftwareInformation:toString()
        local NAME = "Name: "
        local VERSION = "Version: "
        local stringBuffer = StringMaker.new()
        stringBuffer:append(NAME)
        stringBuffer:append(self:getName())
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(VERSION)
        stringBuffer:append(self:getVersion())
        return tostring(stringBuffer)
end
SoftwareInformation.__tostring = function(self) return self:toString() end

return SoftwareInformation

