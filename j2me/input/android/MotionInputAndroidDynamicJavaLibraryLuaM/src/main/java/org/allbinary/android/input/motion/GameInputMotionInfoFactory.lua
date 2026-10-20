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

local AndroidInfoFactory = require("org.allbinary.android.AndroidInfoFactory")
local GameInputMotionInfoAPI1 = require("org.allbinary.android.input.motion.api1.GameInputMotionInfoAPI1")
local GameInputMotionInfoAPI5 = require("org.allbinary.android.input.motion.api5.GameInputMotionInfoAPI5")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameInputMotionInfoFactory = {}
GameInputMotionInfoFactory.__index = GameInputMotionInfoFactory
GameInputMotionInfoFactory.className = "GameInputMotionInfoFactory"

function GameInputMotionInfoFactory.new()
    local self = setmetatable({}, GameInputMotionInfoFactory)
    return self
end


function GameInputMotionInfoFactory.getInstance()
        local SDK_VERSION = AndroidInfoFactory.getInstance():getVersion()
        if SDK_VERSION <= 4 then
            return GameInputMotionInfoAPI1.getInstance()
        else
            return GameInputMotionInfoAPI5.getInstance()
        end
end

return GameInputMotionInfoFactory

