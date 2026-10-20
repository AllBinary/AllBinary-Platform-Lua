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
-- package org.allbinary.media.audio

local BaseSoundsFactory = require("org.allbinary.media.audio.BaseSoundsFactory")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local EarlySoundsFactory = {}
EarlySoundsFactory.__index = EarlySoundsFactory
EarlySoundsFactory.className = "EarlySoundsFactory"
setmetatable(EarlySoundsFactory, {__index = BaseSoundsFactory})

function EarlySoundsFactory.new()
    local self = setmetatable(BaseSoundsFactory.new(), EarlySoundsFactory)
    return self
end


-- throws Exception
function EarlySoundsFactory:getSoundInterfaceArray()
        local soundInterfaceArray = java_new_array(nil, 2)
        local index = 0
        soundInterfaceArray[(function() local value = index index = value + 1 return value end)() + 1] = SelectSound.getInstance()
        soundInterfaceArray[(function() local value = index index = value + 1 return value end)() + 1] = ErrorSound.getInstance()
        return soundInterfaceArray
end


function EarlySoundsFactory.getInstance()
        return EarlySoundsFactory.instance
end

EarlySoundsFactory.instance = EarlySoundsFactory.new()

return EarlySoundsFactory

