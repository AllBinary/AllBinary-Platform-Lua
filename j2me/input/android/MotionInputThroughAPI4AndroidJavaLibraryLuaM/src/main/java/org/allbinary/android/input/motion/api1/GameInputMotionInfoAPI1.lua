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
-- package org.allbinary.android.input.motion.api1

local GameInputMotionInfo = require("org.allbinary.android.input.motion.GameInputMotionInfo")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameInputMotionInfoAPI1 = {}
GameInputMotionInfoAPI1.__index = GameInputMotionInfoAPI1
GameInputMotionInfoAPI1.className = "GameInputMotionInfoAPI1"
setmetatable(GameInputMotionInfoAPI1, {__index = GameInputMotionInfo})


function GameInputMotionInfoAPI1.getInstance()
        return GameInputMotionInfoAPI1.instance
end


function GameInputMotionInfoAPI1.new()
    local self = setmetatable(GameInputMotionInfo.new(4, 1), GameInputMotionInfoAPI1)
        -- super(...) made self above
    return self
end

GameInputMotionInfoAPI1.instance = GameInputMotionInfoAPI1.new()

return GameInputMotionInfoAPI1

