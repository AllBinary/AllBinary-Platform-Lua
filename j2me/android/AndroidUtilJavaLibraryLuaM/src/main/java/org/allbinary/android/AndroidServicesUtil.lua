-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2019 AllBinary 
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
-- package org.allbinary.android

local AndroidServicesUtil = {}
package.loaded["org.allbinary.android.AndroidServicesUtil"] = AndroidServicesUtil

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

-- local List = require("java.util.List")
local ActivityManager = java_lazy("android.app.ActivityManager")
local RunningServiceInfo = java_lazy("android.app.ActivityManager.RunningServiceInfo")
local ComponentName = java_lazy("android.content.ComponentName")
local Context = java_lazy("android.content.Context")
local ResourceUtil = java_lazy("org.allbinary.data.resource.ResourceUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")

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

-- class table AndroidServicesUtil is declared before the requires
AndroidServicesUtil.__index = AndroidServicesUtil
AndroidServicesUtil.className = "AndroidServicesUtil"
AndroidServicesUtil.javaClassName = "org.allbinary.android.AndroidServicesUtil"

function AndroidServicesUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.resourceUtil = ResourceUtil.getInstance()
    self.SERVICE_LIMIT_MAX = 1000
    self.IS_SERVICE_RUNNING = "isServiceRunning"
    self.SERVICE_NOT_FOUND_RUNNING = "Service not found Running: "
end

function AndroidServicesUtil._jinit(self)
    AndroidServicesUtil._init_fields(self)
    return self
end

function AndroidServicesUtil.new()
    return AndroidServicesUtil._jinit(setmetatable({}, AndroidServicesUtil))
end


function AndroidServicesUtil.getInstance()
        return AndroidServicesUtil.instance_f
end


function AndroidServicesUtil:isServiceRunning(name)
        local activityManager = self.resourceUtil:getContext():getSystemService(Context.ACTIVITY_SERVICE)
        local runningServicesList = activityManager:getRunningServices(self.SERVICE_LIMIT_MAX)
        local runningServiceInfo = nil
        local serviceComponent = nil
        local serviceName = nil
        local size = runningServicesList:size()
        for index = 0, size - 1 do
            runningServiceInfo = runningServicesList:get(index)
            serviceComponent = runningServiceInfo.service
            serviceName = tostring(serviceComponent)
            if ((string.find(serviceName, name, 1, true) or 0) - 1) >= 0 then
                return true
            end
        end
        self.logUtil:putF(self.SERVICE_NOT_FOUND_RUNNING .. name, self, self.IS_SERVICE_RUNNING)
        return false
end

AndroidServicesUtil.instance_f = AndroidServicesUtil.new()

return AndroidServicesUtil

