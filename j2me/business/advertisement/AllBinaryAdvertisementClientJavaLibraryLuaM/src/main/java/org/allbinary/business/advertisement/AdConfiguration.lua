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
-- package org.allbinary.business.advertisement

local Direction = require("org.allbinary.direction.Direction")
local GameState = require("org.allbinary.game.state.GameState")

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

local AdConfiguration = {}
AdConfiguration.__index = AdConfiguration
AdConfiguration.className = "AdConfiguration"

function AdConfiguration:_init_fields()
    self.INNERACTIVE = nil
    self.LEADBOLT = nil
    self.ADMOB = nil
end


function AdConfiguration.new(advertIdArray)
    local self = setmetatable({}, AdConfiguration)
    self:_init_fields()
        self.INNERACTIVE = advertIdArray[1]
        self.ADMOB = advertIdArray[2]
        self.LEADBOLT = advertIdArray[3]
    return self
end


function AdConfiguration:getValidAdSpots()
        return java_new_array(nil, 0)
end


function AdConfiguration:process(gameState)
end


function AdConfiguration:processDemo(state)
end


function AdConfiguration:setShowAds()
end


function AdConfiguration:setToggleAds(showAds)
end


function AdConfiguration:isShowAds()
        return true
end

return AdConfiguration

