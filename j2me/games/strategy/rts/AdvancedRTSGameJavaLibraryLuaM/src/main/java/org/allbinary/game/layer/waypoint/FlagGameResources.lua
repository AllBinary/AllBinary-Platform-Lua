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
-- package org.allbinary.game.layer.waypoint

local BasicGameResources = require("org.allbinary.game.layer.resources.BasicGameResources")
local GameGraphicsResourceUtil = require("org.allbinary.game.layer.resources.GameGraphicsResourceUtil")
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

local FlagGameResources = {}
FlagGameResources.__index = FlagGameResources
FlagGameResources.className = "FlagGameResources"
setmetatable(FlagGameResources, {__index = BasicGameResources})

function FlagGameResources:_init_fields()
    self.NAME = StringUtil.getInstance().EMPTY_STRING
    self.RESOURCE_ICON_ANIMATION = StringUtil.getInstance().EMPTY_STRING
    self.RESOURCE_ICON_BUILD = StringUtil.getInstance().EMPTY_STRING
    self.RESOURCE_ICON = StringUtil.getInstance().EMPTY_STRING
    self.ICON_SIZE = "_64_by_64.png"
end


function FlagGameResources.new()
    local self = setmetatable(BasicGameResources.new(), FlagGameResources)
    self:_init_fields()
    return self
end


-- throws Exception
function FlagGameResources:append(ROOT, sizeString)
        BasicGameResources.append(self, ROOT, sizeString)
        local string = GameGraphicsResourceUtil.getInstance():getName()
        BasicGameResources.stringBuffer:delete(0, BasicGameResources.stringBuffer:length())
        BasicGameResources.stringBuffer:append(ROOT)
        BasicGameResources.stringBuffer:append(FlagGameResources.DESTROY)
        BasicGameResources.stringBuffer:append(string)
        BasicGameResources.stringBuffer:append(sizeString)
        self.RESOURCE_DESTROY = tostring(BasicGameResources.stringBuffer)
        BasicGameResources.stringBuffer:delete(0, BasicGameResources.stringBuffer:length())
        BasicGameResources.stringBuffer:append(FlagGameResources.ICON)
        BasicGameResources.stringBuffer:append(ROOT)
        self.RESOURCE_ICON_ANIMATION = tostring(BasicGameResources.stringBuffer)
        BasicGameResources.stringBuffer:delete(0, BasicGameResources.stringBuffer:length())
        BasicGameResources.stringBuffer:append(ROOT)
        BasicGameResources.stringBuffer:append(FlagGameResources.ICON)
        BasicGameResources.stringBuffer:append(string)
        BasicGameResources.stringBuffer:append(self.ICON_SIZE)
        self.RESOURCE_ICON = tostring(BasicGameResources.stringBuffer)
        BasicGameResources.stringBuffer:delete(0, BasicGameResources.stringBuffer:length())
        BasicGameResources.stringBuffer:append(ROOT)
        BasicGameResources.stringBuffer:append(FlagGameResources.ICON_BUILD)
        BasicGameResources.stringBuffer:append(string)
        BasicGameResources.stringBuffer:append(self.ICON_SIZE)
        self.RESOURCE_ICON_BUILD = tostring(BasicGameResources.stringBuffer)
end

FlagGameResources.ICON = "_icon"
FlagGameResources.BUILD = "_build"
FlagGameResources.DESTROY = "_destroy"
FlagGameResources.ICON_BUILD = "_icon" .. tostring(FlagGameResources.BUILD)

return FlagGameResources

