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
-- package org.allbinary.game.configuration.feature


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TouchFeatureFactory = {}
TouchFeatureFactory.__index = TouchFeatureFactory
TouchFeatureFactory.className = "TouchFeatureFactory"

function TouchFeatureFactory:_init_fields()
    self.TOUCH_ENABLED = TouchFeature.new("Touch Enabled")
    self.SHOW_SCREEN_BUTTONS = TouchFeature.new("Show")
    self.AUTO_HIDE_SHOW_SCREEN_BUTTONS = TouchFeature.new("Auto Hide (One Level)")
    self.HIDE_SCREEN_BUTTONS = TouchFeature.new("Hide")
end


function TouchFeatureFactory.getInstance()
        return TouchFeatureFactory.instance
end


function TouchFeatureFactory.new()
    local self = setmetatable({}, TouchFeatureFactory)
    self:_init_fields()
    return self
end

TouchFeatureFactory.instance = TouchFeatureFactory.new()

return TouchFeatureFactory

