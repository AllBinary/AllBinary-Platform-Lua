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

local MainFeatureFactory = {}
MainFeatureFactory.__index = MainFeatureFactory
MainFeatureFactory.className = "MainFeatureFactory"

function MainFeatureFactory:_init_fields()
    self.FULL_SCREEN = Feature.new("Full Screen")
    self.TITLE_BAR = Feature.new("Title Bar")
    self.STATIC = Feature.new("Static Dependent Feature")
    self.LOAD_ONDEMAND = Feature.new("Load OnDemand")
    self.LOAD_ALL = Feature.new("Load All")
end

function MainFeatureFactory.new()
    local self = setmetatable({}, MainFeatureFactory)
    self:_init_fields()
    return self
end


function MainFeatureFactory.getInstance()
        return MainFeatureFactory.instance
end

MainFeatureFactory.instance = MainFeatureFactory.new()

return MainFeatureFactory

