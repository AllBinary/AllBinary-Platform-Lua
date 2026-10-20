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

local ResourceLoadingLevel = require("org.allbinary.game.resource.ResourceLoadingLevel")
local ResourceLoadingLevelFactory = require("org.allbinary.game.resource.ResourceLoadingLevelFactory")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameInitializedEvent = {}
GameInitializedEvent.__index = GameInitializedEvent
GameInitializedEvent.className = "GameInitializedEvent"
setmetatable(GameInitializedEvent, {__index = AllBinaryEventObject})

function GameInitializedEvent:_init_fields()
    self.resourceLoadingLevel = ResourceLoadingLevelFactory.getInstance().LEVEL
    self.level = 0
end


function GameInitializedEvent.new(anyType)
    local self = setmetatable(AllBinaryEventObject.new(anyType), GameInitializedEvent)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function GameInitializedEvent:setLevel(level)
        self.level = level
        self.resourceLoadingLevel = ResourceLoadingLevelFactory.getInstance().LEVEL
end


function GameInitializedEvent:getLevel()
        return self.level
end


function GameInitializedEvent:setResourceLoadingLevel(resourceLoadingLevel)
        self.resourceLoadingLevel = resourceLoadingLevel
        self.level = self.resourceLoadingLevel:getLevel()
end


function GameInitializedEvent:getResourceLoadingLevel()
        return self.resourceLoadingLevel
end

return GameInitializedEvent

