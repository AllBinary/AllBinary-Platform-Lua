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
-- package org.allbinary.game.configuration.event

local GameConfiguration = require("org.allbinary.game.configuration.GameConfiguration")
local BaseChangedGameFeatureListener = require("org.allbinary.game.configuration.event.BaseChangedGameFeatureListener")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ChangedGameFeatureListener = {}
ChangedGameFeatureListener.__index = ChangedGameFeatureListener
ChangedGameFeatureListener.className = "ChangedGameFeatureListener"
setmetatable(ChangedGameFeatureListener, {__index = BaseChangedGameFeatureListener})

function ChangedGameFeatureListener.new()
    local self = setmetatable(BaseChangedGameFeatureListener.new(), ChangedGameFeatureListener)
    return self
end


function ChangedGameFeatureListener.getInstance()
        return ChangedGameFeatureListener.gameFeatureListener
end


function ChangedGameFeatureListener:isChangedGameConfiguration(gameConfiguration)
        return self.list:contains(gameConfiguration)
end

ChangedGameFeatureListener.gameFeatureListener = ChangedGameFeatureListener.new()

return ChangedGameFeatureListener

