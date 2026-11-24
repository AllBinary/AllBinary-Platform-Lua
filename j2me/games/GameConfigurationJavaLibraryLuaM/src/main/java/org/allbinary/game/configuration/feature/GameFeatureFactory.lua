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

local GameFeatureFactory = {}
package.loaded["org.allbinary.game.configuration.feature.GameFeatureFactory"] = GameFeatureFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local Feature = java_lazy("org.allbinary.game.configuration.feature.Feature")
local GameFeature = java_lazy("org.allbinary.game.configuration.feature.GameFeature")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table GameFeatureFactory is declared before the requires
GameFeatureFactory.__index = GameFeatureFactory
GameFeatureFactory.className = "GameFeatureFactory"
GameFeatureFactory.javaClassName = "org.allbinary.game.configuration.feature.GameFeatureFactory"

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
        return GameFeatureFactory.instance_f
end


function GameFeatureFactory._jinit(self)
    GameFeatureFactory._init_fields(self)
    return self
end

function GameFeatureFactory.new(...)
    local self = setmetatable({}, GameFeatureFactory)
    GameFeatureFactory._jinit(self, ...)
    return self
end

GameFeatureFactory.instance_f = GameFeatureFactory.new()

return GameFeatureFactory

