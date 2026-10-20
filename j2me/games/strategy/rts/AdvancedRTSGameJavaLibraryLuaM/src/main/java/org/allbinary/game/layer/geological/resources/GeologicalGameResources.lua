-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2002 AllBinary 
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
-- package org.allbinary.game.layer.geological.resources

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

local GeologicalGameResources = {}
GeologicalGameResources.__index = GeologicalGameResources
GeologicalGameResources.className = "GeologicalGameResources"
setmetatable(GeologicalGameResources, {__index = BasicGameResources})


function GeologicalGameResources.new()
    local self = setmetatable(BasicGameResources.new(), GeologicalGameResources)
        local ROOT = "/resource"
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
function GeologicalGameResources:append(ROOT, sizeString)
        BasicGameResources.append(self, ROOT, sizeString)
end


-- throws Exception
function GeologicalGameResources:getString()
        if AndroidUtil.isAndroid() then
            return GameGraphicsResourceUtil.getInstance():getStringForFeature(GraphicsFeatureFactory.getInstance().SPRITE_QUARTER_ROTATION_GRAPHICS)
        else
            return BasicGameResources.getString(self)
        end
end


function GeologicalGameResources.getInstance()
        return GeologicalGameResources.instance
end

GeologicalGameResources.instance = GeologicalGameResources.new()

return GeologicalGameResources

