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

local Unit3DecalGameResources = {}
Unit3DecalGameResources.__index = Unit3DecalGameResources
Unit3DecalGameResources.className = "Unit3DecalGameResources"
setmetatable(Unit3DecalGameResources, {__index = BasicGameResources})


function Unit3DecalGameResources.new()
    local self = setmetatable(BasicGameResources.new(), Unit3DecalGameResources)
        local ROOT = "/unit_decal"
        local SMALL = "_40_by_40.png"
        local MEDIUM = SMALL
        local SIZE_FOUR = SMALL
        local SIZE_FIVE = SMALL
        local SIZE_SIX = SMALL
        local SIZE = {SMALL, MEDIUM, SIZE_FOUR, SIZE_FIVE, SIZE_SIX}
        BasicGameResources.init(self, ROOT, SIZE)
    return self
end


-- throws Exception
function Unit3DecalGameResources:append(ROOT, sizeString)
        BasicGameResources.append(self, ROOT, sizeString)
end


-- throws Exception
function Unit3DecalGameResources:getString()
        if AndroidUtil.isAndroid() then
            return GameGraphicsResourceUtil.getInstance():getStringForFeature(GraphicsFeatureFactory.getInstance().SPRITE_QUARTER_ROTATION_GRAPHICS)
        else
            return BasicGameResources.getString(self)
        end
end


function Unit3DecalGameResources.getInstance()
        return Unit3DecalGameResources.instance
end

Unit3DecalGameResources.instance = Unit3DecalGameResources.new()

return Unit3DecalGameResources

