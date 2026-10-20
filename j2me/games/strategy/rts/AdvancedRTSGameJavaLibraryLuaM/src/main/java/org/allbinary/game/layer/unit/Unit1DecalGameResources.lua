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

local Unit1DecalGameResources = {}
Unit1DecalGameResources.__index = Unit1DecalGameResources
Unit1DecalGameResources.className = "Unit1DecalGameResources"
setmetatable(Unit1DecalGameResources, {__index = BasicGameResources})


function Unit1DecalGameResources.new()
    local self = setmetatable(BasicGameResources.new(), Unit1DecalGameResources)
        local ROOT = "/unit_decal"
        local SMALL = "_20_by_20.png"
        local MEDIUM = SMALL
        local SIZE_FOUR = SMALL
        local SIZE_FIVE = SMALL
        local SIZE_SIX = SMALL
        local SIZE = {SMALL, MEDIUM, SIZE_FOUR, SIZE_FIVE, SIZE_SIX}
        BasicGameResources.init(self, ROOT, SIZE)
    return self
end


-- throws Exception
function Unit1DecalGameResources:append(ROOT, sizeString)
        BasicGameResources.append(self, ROOT, sizeString)
end


-- throws Exception
function Unit1DecalGameResources:getString()
        if AndroidUtil.isAndroid() then
            return GameGraphicsResourceUtil.getInstance():getStringForFeature(GraphicsFeatureFactory.getInstance().SPRITE_QUARTER_ROTATION_GRAPHICS)
        else
            return BasicGameResources.getString(self)
        end
end


function Unit1DecalGameResources.getInstance()
        return Unit1DecalGameResources.instance
end

Unit1DecalGameResources.instance = Unit1DecalGameResources.new()

return Unit1DecalGameResources

