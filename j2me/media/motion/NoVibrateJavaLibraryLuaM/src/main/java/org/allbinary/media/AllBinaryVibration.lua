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
-- package org.allbinary.media

local GameConfigurationCentral = require("org.allbinary.game.configuration.GameConfigurationCentral")
local AllBinaryVibrationME = require("org.allbinary.media.AllBinaryVibrationME")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryVibration = {}
AllBinaryVibration.__index = AllBinaryVibration
AllBinaryVibration.className = "AllBinaryVibration"
setmetatable(AllBinaryVibration, {__index = AllBinaryVibrationME})


function AllBinaryVibration.new()
    local self = setmetatable(AllBinaryVibrationME.new(), AllBinaryVibration)
    return self
end


function AllBinaryVibration.getInstance()
        return AllBinaryVibration.VIBRATION
end


function AllBinaryVibration.init()
        if math.tointeger(GameConfigurationCentral.getInstance().VIBRATION:getValue() // 1) == 0 then
            AllBinaryVibration.VIBRATION = AllBinaryNoVibration.NO_VIBRATION
        else
            AllBinaryVibration.VIBRATION = AllBinaryVibration.new()
        end
end


function AllBinaryVibration:vibrate(duration, type, volume)
end

AllBinaryVibration.VIBRATION = AllBinaryNoVibration.NO_VIBRATION

return AllBinaryVibration

