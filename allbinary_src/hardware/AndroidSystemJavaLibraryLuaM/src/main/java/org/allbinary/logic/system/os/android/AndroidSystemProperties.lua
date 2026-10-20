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
-- package org.allbinary.logic.system.os.android

local Context = require("android.content.Context")
local Build = require("android.os.Build")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AndroidSystemProperties = {}
AndroidSystemProperties.__index = AndroidSystemProperties
AndroidSystemProperties.className = "AndroidSystemProperties"

function AndroidSystemProperties:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
end


function AndroidSystemProperties.getInstance()
        return AndroidSystemProperties.SINGLETON
end


function AndroidSystemProperties.new(context)
    local self = setmetatable({}, AndroidSystemProperties)
    self:_init_fields()
    return self
end


function AndroidSystemProperties:getDeviceId()
        return StringUtil.getInstance().EMPTY_STRING
end


function AndroidSystemProperties:getDeviceSoftwareVersion()
        return self.commonStrings.DISABLE
end


function AndroidSystemProperties:getLine1Number()
        return self.commonStrings.DISABLE
end


function AndroidSystemProperties:getNetworkCountryIso()
        return self.commonStrings.DISABLE
end


function AndroidSystemProperties:getNetworkOperator()
        return self.commonStrings.DISABLE
end


function AndroidSystemProperties:getNetworkOperatorName()
        return self.commonStrings.DISABLE
end


function AndroidSystemProperties:getSimCountryIso()
        return self.commonStrings.DISABLE
end


function AndroidSystemProperties:getSimOperator()
        return self.commonStrings.DISABLE
end


function AndroidSystemProperties:getSimOperatorName()
        return self.commonStrings.DISABLE
end


function AndroidSystemProperties:getSimSerialNumber()
        return self.commonStrings.DISABLE
end


function AndroidSystemProperties:getSubscriberId()
        return self.commonStrings.DISABLE
end


function AndroidSystemProperties:getVoiceMailAlphaTag()
        return self.commonStrings.DISABLE
end


function AndroidSystemProperties:getVoiceMailNumber()
        return self.commonStrings.DISABLE
end


function AndroidSystemProperties:getNetworkType()
        return -1
end


function AndroidSystemProperties:getPhoneType()
        return -1
end


function AndroidSystemProperties:getBoard()
        return Build.BOARD
end


function AndroidSystemProperties:getBrand()
        return Build.BRAND
end


function AndroidSystemProperties:getDevice()
        return Build.DEVICE
end


function AndroidSystemProperties:getFingerprint()
        return Build.FINGERPRINT
end


function AndroidSystemProperties:getHost()
        return Build.HOST
end


function AndroidSystemProperties:getId()
        return Build.ID
end


function AndroidSystemProperties:getModel()
        return Build.MODEL
end


function AndroidSystemProperties:getProduct()
        return Build.PRODUCT
end


function AndroidSystemProperties:getTags()
        return Build.TAGS
end


function AndroidSystemProperties:getTime()
        return Build.TIME
end


function AndroidSystemProperties:getType()
        return Build.TYPE
end


function AndroidSystemProperties:getUser()
        return Build.USER
end

AndroidSystemProperties.SINGLETON = AndroidSystemProperties.new(ResourceUtil.getInstance():getContext())

return AndroidSystemProperties

