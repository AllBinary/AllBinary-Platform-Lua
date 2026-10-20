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

local PointFactory = require("org.allbinary.graphics.PointFactory")
local RelativeRelationship = require("org.allbinary.graphics.RelativeRelationship")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local RelativeLayerRelationship = require("org.allbinary.layer.relationship.RelativeLayerRelationship")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")
local FeaturedResourceFactory = require("org.allbinary.game.resource.FeaturedResourceFactory")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FeaturedResourceRelativeRelationshipFactory = {}
FeaturedResourceRelativeRelationshipFactory.__index = FeaturedResourceRelativeRelationshipFactory
FeaturedResourceRelativeRelationshipFactory.className = "FeaturedResourceRelativeRelationshipFactory"
setmetatable(FeaturedResourceRelativeRelationshipFactory, {__index = FeaturedResourceFactory})

function FeaturedResourceRelativeRelationshipFactory:_init_fields()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
end


function FeaturedResourceRelativeRelationshipFactory.new()
    local self = setmetatable(FeaturedResourceFactory.new(), FeaturedResourceRelativeRelationshipFactory)
    self:_init_fields()
    return self
end


function FeaturedResourceRelativeRelationshipFactory.getInstance()
        return FeaturedResourceRelativeRelationshipFactory.INSTANCE
end


-- throws Exception
function FeaturedResourceRelativeRelationshipFactory:getRelativeRelationshipList(resource, layer)
        local featureReleaseList = self:getList()
        local size = self:getList():size()
        for index = 0, size - 1 do
            local featureInterface = featureReleaseList.objectArray[index + 1]
            if featureInterface:isFeature() then
                local list = featureInterface:getResourceRelativeRelationshipList(resource)
                if list ~= self.basicArrayListUtil:getImmutableInstance() then
                    return self:duplicate(list, layer)
                end
            end
        end
        error(java_exception("Exception", tostring(StringMaker.new():append("Not available for current feature selection or Resource: "):append(resource))), 0)
end


-- throws Exception
function FeaturedResourceRelativeRelationshipFactory:duplicate(list, layer)
        local pointFactory = PointFactory.getInstance()
        local newList = BasicArrayListD.new()
        local size = list:size()
        for index = 0, size - 1 do
            local relativeRelationship = list.objectArray[index + 1]
            newList:add(RelativeLayerRelationship.new(layer, pointFactory:createXY(relativeRelationship:getX(), relativeRelationship:getY()), BasicArrayListUtil.getInstance():getImmutableInstance()))
        end
        return newList
end

FeaturedResourceRelativeRelationshipFactory.INSTANCE = FeaturedResourceRelativeRelationshipFactory.new()

return FeaturedResourceRelativeRelationshipFactory

