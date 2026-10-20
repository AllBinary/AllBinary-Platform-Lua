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

local ResourceLoadingLevel = {}
ResourceLoadingLevel.__index = ResourceLoadingLevel
ResourceLoadingLevel.className = "ResourceLoadingLevel"

function ResourceLoadingLevel:_init_fields()
    self.name = nil
    self.level = nil
end


function ResourceLoadingLevel.new(name, level)
    local self = setmetatable({}, ResourceLoadingLevel)
    self:_init_fields()
        self.name = name
        self.level = level
    return self
end


function ResourceLoadingLevel:getLevel()
        return self.level
end


function ResourceLoadingLevel:getName()
        return self.name
end

return ResourceLoadingLevel

