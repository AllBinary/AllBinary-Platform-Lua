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

local GameFeatureFactory = {}
GameFeatureFactory.__index = GameFeatureFactory
GameFeatureFactory.className = "GameFeatureFactory"

function GameFeatureFactory:_init_fields()
    self.SOUND = GameFeature.new("Sound")
    self.MUSIC = GameFeature.new("Music")
    self.SCREEN_SHAKE = Feature.new("Screen Shake")
    self.POST_IMAGE_LOADING_MODIFICATION = Feature.new("Post Image Loading Modification (Scaling, Rotation, or Other)")
    self.HEALTH_BARS = GameFeature.new("Health Bars")
    self.DAMAGE_FLOATERS = GameFeature.new("Damage Floaters")
    self.GAME_INPUT_LAYER_PROCESSOR = GameFeature.new("Game Input Layer Processor")
    self.ARTIFICIAL_INTELLEGENCE_PROCESSOR = GameFeature.new("Artificial Intelligence Layer Processor")
    self.COLLIDABLE_INTERFACE_LAYER_PROCESSOR = GameFeature.new("Collidable Interface Layer Processor")
    self.TICKABLE_LAYER_PROCESSOR = GameFeature.new("Tickable Layer Processor")
    self.CHEATING = GameFeature.new("Cheating")
    self.DROPPED_ITEMS = GameFeature.new("Drops")
    self.DROPPED_ITEMS_FROM_DEATH = GameFeature.new("Drops from Dead")
    self.TEST_DESTROYED_LAYER_PROCESSOR = GameFeature.new("Destroyed Layer Processor")
    self.COLLISIONS_WITH_SOURCE = GameFeature.new("Allow Collisions With Source")
    self.COLLISIONS_FORCED_TWO_DIMENSIONAL = GameFeature.new("Collisions Forced Two Dimensional")
end


function GameFeatureFactory.getInstance()
        return GameFeatureFactory.instance
end


function GameFeatureFactory.new()
    local self = setmetatable({}, GameFeatureFactory)
    self:_init_fields()
    return self
end

GameFeatureFactory.instance = GameFeatureFactory.new()

return GameFeatureFactory

