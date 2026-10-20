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
-- package org.allbinary.android.api19

local Activity = require("android.app.Activity")
local View = require("android.view.View")
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

local ActivityFractureUtilAPI19 = {}
ActivityFractureUtilAPI19.__index = ActivityFractureUtilAPI19
ActivityFractureUtilAPI19.className = "ActivityFractureUtilAPI19"
setmetatable(ActivityFractureUtilAPI19, {__index = ActivityFractureUtilAPI5})

function ActivityFractureUtilAPI19.new()
    local self = setmetatable(ActivityFractureUtilAPI5.new(), ActivityFractureUtilAPI19)
    return self
end


function ActivityFractureUtilAPI19.getInstance()
        return ActivityFractureUtilAPI19.instance19
end


function ActivityFractureUtilAPI19:setFullScreen(activity)
        local decorView = activity:getWindow():getDecorView()
        local visibility = View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION | View.SYSTEM_UI_FLAG_FULLSCREEN
        decorView:setSystemUiVisibility(visibility)
end

ActivityFractureUtilAPI19.instance19 = ActivityFractureUtilAPI19.new()

return ActivityFractureUtilAPI19

