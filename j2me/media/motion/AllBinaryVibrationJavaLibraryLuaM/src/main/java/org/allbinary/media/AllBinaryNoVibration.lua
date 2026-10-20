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

local AllBinaryNoVibration = {}
AllBinaryNoVibration.__index = AllBinaryNoVibration
AllBinaryNoVibration.className = "AllBinaryNoVibration"
setmetatable(AllBinaryNoVibration, {__index = AllBinaryVibrationME})

function AllBinaryNoVibration.new()
    local self = setmetatable(AllBinaryVibrationME.new(), AllBinaryNoVibration)
    return self
end


function AllBinaryNoVibration:vibrate(duration, type, volume)
end

AllBinaryNoVibration.NO_VIBRATION = AllBinaryNoVibration.new()

return AllBinaryNoVibration

