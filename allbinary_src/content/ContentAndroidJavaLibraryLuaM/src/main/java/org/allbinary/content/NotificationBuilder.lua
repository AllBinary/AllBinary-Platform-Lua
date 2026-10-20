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

local NullParcelable = require("org.allbinary.android.NullParcelable")
-- local Command = require("javax.microedition.lcdui.Command")
local PendingIntent = require("android.app.PendingIntent")
local Context = require("android.content.Context")
local Parcelable = require("android.os.Parcelable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NotificationBuilder = {}
NotificationBuilder.__index = NotificationBuilder
NotificationBuilder.className = "NotificationBuilder"

function NotificationBuilder.new()
    local self = setmetatable({}, NotificationBuilder)
    return self
end


function NotificationBuilder:build(context, command, message, integer, pendingIntent)
        return NullParcelable.NULL_PARCELABLE
end

NotificationBuilder.NULL_NOTIFICATION_BUILDER = NotificationBuilder.new()

return NotificationBuilder

