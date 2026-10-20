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

local SoundsFactoryInterface = require("org.allbinary.media.audio.SoundsFactoryInterface")

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

local BaseSoundsFactory = {}
BaseSoundsFactory.__index = BaseSoundsFactory
BaseSoundsFactory.className = "BaseSoundsFactory"

function BaseSoundsFactory:_init_fields()
    self.initialized = false
end

function BaseSoundsFactory.new()
    local self = setmetatable({}, BaseSoundsFactory)
    self:_init_fields()
    return self
end


function BaseSoundsFactory:init()
end


-- throws Exception
function BaseSoundsFactory:getSoundInterfaceArray()
        return java_new_array(nil, 0)
end


function BaseSoundsFactory:setInitialized(initialized)
        self.initialized = initialized
end


function BaseSoundsFactory:isInitialized()
        return self.initialized
end

return BaseSoundsFactory

