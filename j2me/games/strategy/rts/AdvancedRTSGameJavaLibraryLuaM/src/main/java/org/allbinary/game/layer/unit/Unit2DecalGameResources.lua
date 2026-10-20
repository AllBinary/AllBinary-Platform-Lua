-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer.unit

local BasicGameResources = require("org.allbinary.game.layer.resources.BasicGameResources")
local GameGraphicsResourceUtil = require("org.allbinary.game.layer.resources.GameGraphicsResourceUtil")
local AndroidUtil = require("org.allbinary.AndroidUtil")
local GraphicsFeatureFactory = require("org.allbinary.game.configuration.feature.GraphicsFeatureFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Unit2DecalGameResources = {}
Unit2DecalGameResources.__index = Unit2DecalGameResources
Unit2DecalGameResources.className = "Unit2DecalGameResources"
setmetatable(Unit2DecalGameResources, {__index = BasicGameResources})


function Unit2DecalGameResources.new()
    local self = setmetatable(BasicGameResources.new(), Unit2DecalGameResources)
        local ROOT = "/unit_decal"
        local SMALL = "_30_by_30.png"
        local MEDIUM = SMALL
        local SIZE_FOUR = SMALL
        local SIZE_FIVE = SMALL
        local SIZE_SIX = SMALL
        local SIZE = {SMALL, MEDIUM, SIZE_FOUR, SIZE_FIVE, SIZE_SIX}
        BasicGameResources.init(self, ROOT, SIZE)
    return self
end


-- throws Exception
function Unit2DecalGameResources:append(ROOT, sizeString)
        BasicGameResources.append(self, ROOT, sizeString)
end


-- throws Exception
function Unit2DecalGameResources:getString()
        if AndroidUtil.isAndroid() then
            return GameGraphicsResourceUtil.getInstance():getStringForFeature(GraphicsFeatureFactory.getInstance().SPRITE_QUARTER_ROTATION_GRAPHICS)
        else
            return BasicGameResources.getString(self)
        end
end


function Unit2DecalGameResources.getInstance()
        return Unit2DecalGameResources.instance
end

Unit2DecalGameResources.instance = Unit2DecalGameResources.new()

return Unit2DecalGameResources

