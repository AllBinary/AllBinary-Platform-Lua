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

-- local List = require("java.util.List")
local ActivityManager = require("android.app.ActivityManager")
local RunningServiceInfo = require("android.app.ActivityManager.RunningServiceInfo")
local ComponentName = require("android.content.ComponentName")
local Context = require("android.content.Context")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AndroidServicesUtil = {}
AndroidServicesUtil.__index = AndroidServicesUtil
AndroidServicesUtil.className = "AndroidServicesUtil"

function AndroidServicesUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.resourceUtil = ResourceUtil.getInstance()
    self.SERVICE_LIMIT_MAX = 1000
    self.IS_SERVICE_RUNNING = "isServiceRunning"
    self.SERVICE_NOT_FOUND_RUNNING = "Service not found Running: "
end

function AndroidServicesUtil.new()
    local self = setmetatable({}, AndroidServicesUtil)
    self:_init_fields()
    return self
end


function AndroidServicesUtil.getInstance()
        return AndroidServicesUtil.instance
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

AndroidServicesUtil.instance = AndroidServicesUtil.new()

return AndroidServicesUtil

