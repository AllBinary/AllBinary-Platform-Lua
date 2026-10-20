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
-- package org.allbinary.game.resource


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ResourceLoadingLevelFactory = {}
ResourceLoadingLevelFactory.__index = ResourceLoadingLevelFactory
ResourceLoadingLevelFactory.className = "ResourceLoadingLevelFactory"

function ResourceLoadingLevelFactory:_init_fields()
    self.LOAD_EARLY = ResourceLoadingLevel.new("Load Early", Integer.MAX_VALUE)
    self.LOAD_TOUCH = ResourceLoadingLevel.new("Load Touch", Integer.MAX_VALUE - 1)
    self.LOAD_GAME = ResourceLoadingLevel.new("Load Game", Integer.MAX_VALUE - 2)
    self.LEVEL = ResourceLoadingLevel.new("Level", Integer.MAX_VALUE - 99)
    self.MAX_LEVEL = ResourceLoadingLevel.new("Max Level", Integer.MAX_VALUE - 100)
    self.LOAD_ALL = ResourceLoadingLevel.new("Load All", -1)
    self.RESOURCE_LOADING_LEVEL_ARRAY = {self.LOAD_ALL, self.MAX_LEVEL, self.LEVEL, self.LOAD_GAME, self.LOAD_TOUCH, self.LOAD_EARLY}
end

function ResourceLoadingLevelFactory.new()
    local self = setmetatable({}, ResourceLoadingLevelFactory)
    self:_init_fields()
    return self
end


function ResourceLoadingLevelFactory.getInstance()
        return ResourceLoadingLevelFactory.instance
end


function ResourceLoadingLevelFactory:getLevelString(level)
        for index = 0, (self.RESOURCE_LOADING_LEVEL_ARRAY.n or #self.RESOURCE_LOADING_LEVEL_ARRAY) - 1 do
            if level == self.RESOURCE_LOADING_LEVEL_ARRAY[index + 1]:getLevel() then
                return self.RESOURCE_LOADING_LEVEL_ARRAY[index + 1]:getName()
            end
        end
        return tostring(level)
end

ResourceLoadingLevelFactory.instance = ResourceLoadingLevelFactory.new()

return ResourceLoadingLevelFactory

