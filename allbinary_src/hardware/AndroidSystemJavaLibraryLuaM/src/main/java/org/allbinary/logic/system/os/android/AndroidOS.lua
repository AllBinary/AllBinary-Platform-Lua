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

local AndroidInfoFactory = require("org.allbinary.android.AndroidInfoFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local GenericOperatingSystem = require("org.allbinary.logic.system.os.GenericOperatingSystem")
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

local AndroidOS = {}
AndroidOS.__index = AndroidOS
AndroidOS.className = "AndroidOS"
setmetatable(AndroidOS, {__index = GenericOperatingSystem})

function AndroidOS:_init_fields()
    self.stringBuffer = StringMaker.new()
    self.DEVICE_ID = "DeviceId"
    self.DEVICE_SOFTWARE_VERSION = "DeviceSoftwareVersion"
    self.LINE_1_NUMBER = "Line1Number"
    self.OUYA = "ouya"
end


function AndroidOS.new()
    local self = setmetatable(GenericOperatingSystem.new(), AndroidOS)
    self:_init_fields()
        local SDK_VERSION = AndroidInfoFactory.getInstance():getVersion()
        if SDK_VERSION > 10 then
            self.scalable = true
        end
        local properties = AndroidSystemProperties.getInstance()
        local commonStrings = CommonSeps.getInstance()
        self.stringBuffer:append(self.DEVICE_ID)
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getDeviceId())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append(self.DEVICE_SOFTWARE_VERSION)
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getDeviceSoftwareVersion())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append(self.LINE_1_NUMBER)
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getLine1Number())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("NetworkCountryIso")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getNetworkCountryIso())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("NetworkOperator")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getNetworkOperator())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("NetworkOperatorName")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getNetworkOperatorName())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("NetworkType")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:appendint(java_int(properties:getNetworkType()))
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("PhoneType")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:appendint(java_int(properties:getPhoneType()))
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("SimCountryIso")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getSimCountryIso())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("SimOperator")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getSimOperator())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("SimOperatorName")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getSimOperatorName())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("SimSerialNumber")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getSimSerialNumber())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("SubscriberId")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getSubscriberId())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("VoiceMailAlphaTag")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getVoiceMailAlphaTag())
        self.stringBuffer:append(commonStrings.SPACE)
        self.stringBuffer:append("VoiceMailNumber")
        self.stringBuffer:append(commonStrings.EQUALS)
        self.stringBuffer:append(properties:getVoiceMailNumber())
        self.stringBuffer:append(commonStrings.SPACE)
    return self
end


function AndroidOS:isOverScan()
        local properties = AndroidSystemProperties.getInstance()
        if ((string.find(properties:getDevice():toLowerCase(), self.OUYA, 1, true) or 0) - 1) >= 0 then
            return true
        end
        return false
end


function AndroidOS:getOverScanXPercent()
        return 90
end


function AndroidOS:getOverScanYPercent()
        return 90
end


function AndroidOS:toString()
        local osBuffer = StringMaker.new()
        osBuffer:append(tostring(GenericOperatingSystem))
        osBuffer:append(CommonSeps.getInstance().SPACE)
        osBuffer:append("Other System Info: \n")
        osBuffer:append(tostring(self.stringBuffer))
        return tostring(osBuffer)
end
AndroidOS.__tostring = function(self) return self:toString() end

return AndroidOS

