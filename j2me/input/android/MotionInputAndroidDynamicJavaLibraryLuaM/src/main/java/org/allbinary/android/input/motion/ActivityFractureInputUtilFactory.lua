--
-- AllBinary Open License Version 1
-- Copyright (c) 2009 AllBinary
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
-- package org.allbinary.android.input.motion

local ActivityFractureUtil = require("org.allbinary.android.ActivityFractureUtil")
local AndroidInfoFactory = require("org.allbinary.android.AndroidInfoFactory")
local ActivityFractureUtilAPI1 = require("org.allbinary.android.api1.ActivityFractureUtilAPI1")
local ActivityFractureUtilAPI16 = require("org.allbinary.android.api16.ActivityFractureUtilAPI16")
local ActivityFractureUtilAPI19 = require("org.allbinary.android.api19.ActivityFractureUtilAPI19")
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

local ActivityFractureInputUtilFactory = {}
ActivityFractureInputUtilFactory.__index = ActivityFractureInputUtilFactory
ActivityFractureInputUtilFactory.className = "ActivityFractureInputUtilFactory"

function ActivityFractureInputUtilFactory.new()
    local self = setmetatable({}, ActivityFractureInputUtilFactory)
    return self
end


function ActivityFractureInputUtilFactory.getInstance()
        local SDK_VERSION = AndroidInfoFactory.getInstance():getVersion()
        if SDK_VERSION <= 4 then
            return ActivityFractureUtilAPI1.getInstance()
        elseif SDK_VERSION <= 15 then
            return ActivityFractureUtilAPI5.getInstance()
        elseif SDK_VERSION <= 16 then
            return ActivityFractureUtilAPI16.getInstance()
        else
            return ActivityFractureUtilAPI19.getInstance()
        end
end

return ActivityFractureInputUtilFactory

