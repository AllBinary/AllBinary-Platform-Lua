-- Generated Code Do Not Modify
-- package org.allbinary.game.input

local AndroidInfoFactory = require("org.allbinary.android.AndroidInfoFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ActivityFractureControllerUtilFactory = {}
ActivityFractureControllerUtilFactory.__index = ActivityFractureControllerUtilFactory
ActivityFractureControllerUtilFactory.className = "ActivityFractureControllerUtilFactory"

function ActivityFractureControllerUtilFactory.new()
    local self = setmetatable({}, ActivityFractureControllerUtilFactory)
    return self
end


function ActivityFractureControllerUtilFactory.getInstance()
        local SDK_VERSION = AndroidInfoFactory.getInstance():getVersion()
        if SDK_VERSION <= 8 then
            return AndroidAPI1KeyFactory.getInstance()
        elseif SDK_VERSION <= 11 then
            return AndroidAPI9KeyFactory.getInstance()
        else
            return AndroidAPI12KeyFactory.getAPI12Instance()
        end
end

return ActivityFractureControllerUtilFactory

