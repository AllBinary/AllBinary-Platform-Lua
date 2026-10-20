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
-- package org.allbinary.android.api1

local ActivityFractureUtil = require("org.allbinary.android.ActivityFractureUtil")
local Activity = require("android.app.Activity")
local WindowManager = require("android.view.WindowManager")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ActivityFractureUtilAPI1 = {}
ActivityFractureUtilAPI1.__index = ActivityFractureUtilAPI1
ActivityFractureUtilAPI1.className = "ActivityFractureUtilAPI1"
setmetatable(ActivityFractureUtilAPI1, {__index = ActivityFractureUtil})

function ActivityFractureUtilAPI1.new()
    local self = setmetatable(ActivityFractureUtil.new(), ActivityFractureUtilAPI1)
    return self
end


function ActivityFractureUtilAPI1.getInstance()
        return ActivityFractureUtilAPI1.instance
end


-- throws Exception
function ActivityFractureUtilAPI1:process(activity)
end


function ActivityFractureUtilAPI1:setFullScreen(activity)
        activity:getWindow():setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN)
end

ActivityFractureUtilAPI1.instance = ActivityFractureUtilAPI1.new()

return ActivityFractureUtilAPI1

