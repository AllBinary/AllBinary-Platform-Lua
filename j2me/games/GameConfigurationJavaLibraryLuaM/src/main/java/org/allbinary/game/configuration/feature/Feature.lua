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

local ChangedGameFeatureListener = require("org.allbinary.game.configuration.event.ChangedGameFeatureListener")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Feature = {}
Feature.__index = Feature
Feature.className = "Feature"

function Feature:_init_fields()
    self.name = nil
end


function Feature.new(name)
    local self = setmetatable({}, Feature)
    self:_init_fields()
        self.name = name
        Feature.add(name, self)
        ChangedGameFeatureListener.getInstance():add(self)
    return self
end


function Feature.getInstance(name)
        return Feature.hashtable:get(name)
end


function Feature.add(name, gameFeature)
        Feature.hashtable:put(name, gameFeature)
end


function Feature:toString()
        return self:getName()
end
Feature.__tostring = function(self) return self:toString() end


function Feature:getName()
        return self.name
end

Feature.hashtable = StdUtil.getInstance():createHashtable()

return Feature

