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
-- package org.allbinary.android.api30

local Activity = require("android.app.Activity")
local Window = require("android.view.Window")
local WindowCompat = require("androidx.core.view.WindowCompat")
local WindowInsetsCompat = require("androidx.core.view.WindowInsetsCompat")
local WindowInsetsControllerCompat = require("androidx.core.view.WindowInsetsControllerCompat")
local ActivityFractureUtilAPI5 = require("org.allbinary.android.api5.ActivityFractureUtilAPI5")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ActivityFractureUtilAPI30 = {}
ActivityFractureUtilAPI30.__index = ActivityFractureUtilAPI30
ActivityFractureUtilAPI30.className = "ActivityFractureUtilAPI30"
setmetatable(ActivityFractureUtilAPI30, {__index = ActivityFractureUtilAPI5})

function ActivityFractureUtilAPI30.new()
    local self = setmetatable(ActivityFractureUtilAPI5.new(), ActivityFractureUtilAPI30)
    return self
end


function ActivityFractureUtilAPI30.getInstance()
        return ActivityFractureUtilAPI30.instance30
end


function ActivityFractureUtilAPI30:setFullScreen(activity)
        local window = activity:getWindow()
        local windowInsetsController = WindowCompat.getInsetsController(window, window:getDecorView())
        windowInsetsController:hide(WindowInsetsCompat.Type:systemBars())
        windowInsetsController:setSystemBarsBehavior(WindowInsetsControllerCompat.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE)
end

ActivityFractureUtilAPI30.instance30 = ActivityFractureUtilAPI30.new()

return ActivityFractureUtilAPI30

