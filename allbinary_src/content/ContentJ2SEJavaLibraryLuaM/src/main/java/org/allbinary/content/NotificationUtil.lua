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
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")
local TsUtil = require("org.allbinary.TsUtil")

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
    self.notificationManager = ResourceUtil.getInstance():getContext():getSystemService(Context.NOTIFICATION_SERVICE)
end

function NotificationUtil.new()
    local self = setmetatable({}, NotificationUtil)
    self:_init_fields()
    return self
end


function NotificationUtil.getInstance()
        return NotificationUtil.SINGLETON
end


function NotificationUtil:notify(command, resource, message)
        local context = ResourceUtil.getInstance():getContext()
        local intent = CommandUriAction.getInstance():getIntent(command)
        local integer = ResourceUtil.getInstance():getResourceId(resource)
        local notification = Notification.new(math.tointeger(integer // 1), message, math.floor(os.time() * 1000))
        local pendingIntent = PendingIntent.getActivity(context, 0, intent, 0)
        notification:setLatestEventInfo(context, command:getLabel(), message, pendingIntent)
        self.notificationManager:notify(TsUtil.getInstance():hashCode(command), notification)
end

NotificationUtil.SINGLETON = NotificationUtil.new()

return NotificationUtil

