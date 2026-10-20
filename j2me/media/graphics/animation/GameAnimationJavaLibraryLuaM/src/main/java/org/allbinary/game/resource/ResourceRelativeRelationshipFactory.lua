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

local RelativeRelationship = require("org.allbinary.graphics.RelativeRelationship")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local ResourceRelativeRelationshipFactoryInterface = require("org.allbinary.game.resource.ResourceRelativeRelationshipFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ResourceRelativeRelationshipFactory = {}
ResourceRelativeRelationshipFactory.__index = ResourceRelativeRelationshipFactory
ResourceRelativeRelationshipFactory.className = "ResourceRelativeRelationshipFactory"

function ResourceRelativeRelationshipFactory:_init_fields()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
    self.hashtable = StdUtil.getInstance():createHashtable()
    self.initialized = false
end

function ResourceRelativeRelationshipFactory.new()
    local self = setmetatable({}, ResourceRelativeRelationshipFactory)
    self:_init_fields()
    return self
end


-- throws Exception
function ResourceRelativeRelationshipFactory:init(level)
        self:setInitialized(true)
end


-- throws Exception
function ResourceRelativeRelationshipFactory:getResourceRelativeRelationshipList(resource)
        local listCanBeNull = self.hashtable:get(resource)
        if listCanBeNull == nil then
            return self.basicArrayListUtil:getImmutableInstance()
        end
        return listCanBeNull
end


-- throws Exception
function ResourceRelativeRelationshipFactory:addResourceRelativeRelationship(resource, hardPoint)
        local list = self:getResourceRelativeRelationshipList(resource)
        if list == self.basicArrayListUtil:getImmutableInstance() then
            list = BasicArrayListD.new()
        end
        list:add(hardPoint)
        self.hashtable:put(resource, list)
end


function ResourceRelativeRelationshipFactory:isLoadingLevel(level)
        return false
end


function ResourceRelativeRelationshipFactory:isFeature()
        return false
end


function ResourceRelativeRelationshipFactory:setInitialized(initialized)
        self.initialized = initialized
end


function ResourceRelativeRelationshipFactory:isInitialized()
        return self.initialized
end

return ResourceRelativeRelationshipFactory

