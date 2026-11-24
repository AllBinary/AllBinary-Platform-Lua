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

local AndroidSystemProperties = {}
package.loaded["org.allbinary.logic.system.os.android.AndroidSystemProperties"] = AndroidSystemProperties

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local Context = java_lazy("android.content.Context")
local Build = java_lazy("android.os.Build")
local ResourceUtil = java_lazy("org.allbinary.data.resource.ResourceUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table AndroidSystemProperties is declared before the requires
AndroidSystemProperties.__index = AndroidSystemProperties
AndroidSystemProperties.className = "AndroidSystemProperties"
AndroidSystemProperties.javaClassName = "org.allbinary.logic.system.os.android.AndroidSystemProperties"

function AndroidSystemProperties:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
end


function AndroidSystemProperties.getInstance()
        return AndroidSystemProperties.SINGLETON
end


function AndroidSystemProperties._jinit(self, context)
    AndroidSystemProperties._init_fields(self)
    return self
end

function AndroidSystemProperties.new(...)
    local self = setmetatable({}, AndroidSystemProperties)
    AndroidSystemProperties._jinit(self, ...)
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

