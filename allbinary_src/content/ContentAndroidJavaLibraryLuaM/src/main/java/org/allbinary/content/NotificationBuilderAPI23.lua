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
local Builder = require("android.app.Notification.Builder")
local PendingIntent = require("android.app.PendingIntent")
local Context = require("android.content.Context")
local Parcelable = require("android.os.Parcelable")
local NotificationBuilder = require("org.allbinary.content.NotificationBuilder")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NotificationBuilderAPI23 = {}
NotificationBuilderAPI23.__index = NotificationBuilderAPI23
NotificationBuilderAPI23.className = "NotificationBuilderAPI23"
setmetatable(NotificationBuilderAPI23, {__index = NotificationBuilder})

function NotificationBuilderAPI23.new()
    local self = setmetatable(NotificationBuilder.new(), NotificationBuilderAPI23)
    return self
end


function NotificationBuilderAPI23:build(context, command, message, integer, pendingIntent)
        local notification = Builder.new(context):setSmallIcon(math.tointeger(integer // 1)):setTicker(message):setWhen(math.floor(os.time() * 1000)):setContentTitle(command:getLabel()):setContentText(message):setContentIntent(pendingIntent):build()
        return notification
end

return NotificationBuilderAPI23

