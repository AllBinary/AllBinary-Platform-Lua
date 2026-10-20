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
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UnitGameResources = {}
UnitGameResources.__index = UnitGameResources
UnitGameResources.className = "UnitGameResources"
setmetatable(UnitGameResources, {__index = BasicGameResources})

function UnitGameResources:_init_fields()
    self.NAME = StringUtil.getInstance().EMPTY_STRING
    self.RESOURCE_ICON_ANIMATION = StringUtil.getInstance().EMPTY_STRING
    self.RESOURCE_ICON_BUILD = StringUtil.getInstance().EMPTY_STRING
    self.RESOURCE_ICON = StringUtil.getInstance().EMPTY_STRING
    self.ICON_SIZE = "_64_by_64.png"
end


function UnitGameResources.new()
    local self = setmetatable(BasicGameResources.new(), UnitGameResources)
    self:_init_fields()
    return self
end


-- throws Exception
function UnitGameResources:append(ROOT, sizeString)
        BasicGameResources.append(self, ROOT, sizeString)
        local string = GameGraphicsResourceUtil.getInstance():getName()
        BasicGameResources.stringBuffer:delete(0, BasicGameResources.stringBuffer:length())
        BasicGameResources.stringBuffer:append(ROOT)
        BasicGameResources.stringBuffer:append(UnitGameResources.DESTROY)
        BasicGameResources.stringBuffer:append(string)
        BasicGameResources.stringBuffer:append(sizeString)
        self.RESOURCE_DESTROY = tostring(BasicGameResources.stringBuffer)
        BasicGameResources.stringBuffer:delete(0, BasicGameResources.stringBuffer:length())
        BasicGameResources.stringBuffer:append(UnitGameResources.ICON)
        BasicGameResources.stringBuffer:append(ROOT)
        self.RESOURCE_ICON_ANIMATION = tostring(BasicGameResources.stringBuffer)
        BasicGameResources.stringBuffer:delete(0, BasicGameResources.stringBuffer:length())
        BasicGameResources.stringBuffer:append(ROOT)
        BasicGameResources.stringBuffer:append(UnitGameResources.ICON)
        BasicGameResources.stringBuffer:append(string)
        BasicGameResources.stringBuffer:append(self.ICON_SIZE)
        self.RESOURCE_ICON = tostring(BasicGameResources.stringBuffer)
        BasicGameResources.stringBuffer:delete(0, BasicGameResources.stringBuffer:length())
        BasicGameResources.stringBuffer:append(ROOT)
        BasicGameResources.stringBuffer:append(UnitGameResources.ICON_BUILD)
        BasicGameResources.stringBuffer:append(string)
        BasicGameResources.stringBuffer:append(self.ICON_SIZE)
        self.RESOURCE_ICON_BUILD = tostring(BasicGameResources.stringBuffer)
end


-- throws Exception
function UnitGameResources:getString()
        if AndroidUtil.isAndroid() then
            return GameGraphicsResourceUtil.getInstance():getStringForFeature(GraphicsFeatureFactory.getInstance().SPRITE_QUARTER_ROTATION_GRAPHICS)
        else
            return BasicGameResources.getString(self)
        end
end

UnitGameResources.ICON = "_icon"
UnitGameResources.BUILD = "_build"
UnitGameResources.DESTROY = "_destroy"
UnitGameResources.ICON_BUILD = "_icon" .. tostring(UnitGameResources.BUILD)

return UnitGameResources

