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

local GameFeatureControlledInterface = require("org.allbinary.game.configuration.feature.GameFeatureControlledInterface")
local RelativeRelationship = require("org.allbinary.graphics.RelativeRelationship")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local ResourceRelativeRelationshipFactoryInterface = {}
ResourceRelativeRelationshipFactoryInterface.__index = ResourceRelativeRelationshipFactoryInterface
ResourceRelativeRelationshipFactoryInterface.className = "ResourceRelativeRelationshipFactoryInterface"
setmetatable(ResourceRelativeRelationshipFactoryInterface, {__index = GameFeatureControlledInterface})


-- throws Exception
function ResourceRelativeRelationshipFactoryInterface:getResourceRelativeRelationshipList(resource)
    error("abstract method getResourceRelativeRelationshipList")
end


-- throws Exception
function ResourceRelativeRelationshipFactoryInterface:addResourceRelativeRelationship(resource, relativeRelationship)
    error("abstract method addResourceRelativeRelationship")
end

return ResourceRelativeRelationshipFactoryInterface

