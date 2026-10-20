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
-- package org.allbinary.content

-- local Command = require("javax.microedition.lcdui.Command")
local Notification = require("android.app.Notification")
local NotificationManager = require("android.app.NotificationManager")
local PendingIntent = require("android.app.PendingIntent")
local Context = require("android.content.Context")
local Intent = require("android.content.Intent")
local AndroidInfoFactory = require("org.allbinary.android.AndroidInfoFactory")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

local NotificationUtil = {}
NotificationUtil.__index = NotificationUtil
NotificationUtil.className = "NotificationUtil"

function NotificationUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.notificationManager = ResourceUtil.getInstance():getContext():getSystemService(Context.NOTIFICATION_SERVICE)
    self.notificationBuilder = nil
end


function NotificationUtil.getInstance()
        return NotificationUtil.SINGLETON
end


function NotificationUtil.new()
    local self = setmetatable({}, NotificationUtil)
    self:_init_fields()
        local SDK_VERSION = AndroidInfoFactory.getInstance():getVersion()
        if SDK_VERSION > 22 then
            self.notificationBuilder = NotificationBuilderAPI23.new()
        else
            self.notificationBuilder = NotificationBuilder.NULL_NOTIFICATION_BUILDER
        end
    return self
end


function NotificationUtil:notify(command, resource, message)
        local context = ResourceUtil.getInstance():getContext()
        local intent = CommandUriAction.getInstance():getIntent(command)
        local integer = ResourceUtil.getInstance():getResourceId(resource)
        local FLAG_IMMUTABLE = 1 << 26
        local SDK_VERSION = AndroidInfoFactory.getInstance():getVersion()
        local pendingIntent = PendingIntent.getActivity(context, 0, intent, (function() if SDK_VERSION > 22 then return FLAG_IMMUTABLE else return 0 end end)())
        if self.notificationBuilder == nil then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.EXCEPTION, self, commonStrings.NOT_IMPLEMENTED)
            return
        end
        self.notificationBuilder:build(context, command, message, integer, pendingIntent)
end

NotificationUtil.SINGLETON = NotificationUtil.new()

return NotificationUtil

