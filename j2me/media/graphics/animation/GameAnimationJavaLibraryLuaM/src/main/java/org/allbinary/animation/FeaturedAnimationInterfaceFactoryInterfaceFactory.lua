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
-- package org.allbinary.animation

local FeatureResourceAnimationInterfaceFactoryInterface = require("org.allbinary.animation.resource.FeatureResourceAnimationInterfaceFactoryInterface")
local GameConfigurationCentral = require("org.allbinary.game.configuration.GameConfigurationCentral")
local FeaturedResourceFactory = require("org.allbinary.game.resource.FeaturedResourceFactory")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local RectangleFactory = require("org.allbinary.graphics.RectangleFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

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

local FeaturedAnimationInterfaceFactoryInterfaceFactory = {}
FeaturedAnimationInterfaceFactoryInterfaceFactory.__index = FeaturedAnimationInterfaceFactoryInterfaceFactory
FeaturedAnimationInterfaceFactoryInterfaceFactory.className = "FeaturedAnimationInterfaceFactoryInterfaceFactory"
setmetatable(FeaturedAnimationInterfaceFactoryInterfaceFactory, {__index = FeaturedResourceFactory})


function FeaturedAnimationInterfaceFactoryInterfaceFactory.new()
    local self = setmetatable(FeaturedResourceFactory.new(), FeaturedAnimationInterfaceFactoryInterfaceFactory)
    return self
end


function FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()
        return FeaturedAnimationInterfaceFactoryInterfaceFactory.INSTANCE
end


-- throws Exception
function FeaturedAnimationInterfaceFactoryInterfaceFactory:getRectangle(resource)
        return self:getRectangleXY(resource, 0, 0)
end


-- throws Exception
function FeaturedAnimationInterfaceFactoryInterfaceFactory:getRectangleXY(resource, x, y)
        local pointFactory = PointFactory.getInstance()
        local list = self:getList()
        local scale = math.tointeger(GameConfigurationCentral.getInstance().SCALE:getValue() // 1)
        local size = self:getList():size()
        for index = 0, size - 1 do
            local featureInterface = list.objectArray[index + 1]
            if featureInterface:isFeature() then
                local rectangle = featureInterface:getRectangle(resource)
                if rectangle ~= RectangleFactory.SINGLETON then
                    return Rectangle.new(pointFactory:createXY(x, y), ((((rectangle:getWidth() * scale)) // (1 << (1)))), ((((rectangle:getHeight() * scale)) // (1 << (1)))))
                end
            end
        end
        error(java_exception("Exception", tostring(StringMaker.new():append("No rectangle available for current feature selection or Resource: "):append(resource))), 0)
end


-- throws Exception
function FeaturedAnimationInterfaceFactoryInterfaceFactory:getProcedural(resource)
        return self:getBasicAnimationInterfaceFactoryInstance(resource)
end


-- throws Exception
function FeaturedAnimationInterfaceFactoryInterfaceFactory:get(resource)
        return self:getBasicAnimationInterfaceFactoryInstance(resource)
end


-- throws Exception
function FeaturedAnimationInterfaceFactoryInterfaceFactory:getBasicAnimationInterfaceFactoryInstance(resource)
        local list = self:getList()
        local resourceTypeAvailableList = BasicArrayListD.new()
        local size = self:getList():size()
        local featureInterface = nil
        local animationInterfaceFactoryInterface = nil
        for index = 0, size - 1 do
            featureInterface = list.objectArray[index + 1]
            if featureInterface:isFeature() then
                resourceTypeAvailableList:add(featureInterface)
                animationInterfaceFactoryInterface = featureInterface:getBasicAnimationInterfaceFactoryInstance(resource)
                if animationInterfaceFactoryInterface ~= NullAnimationFactory.NULL_NOT_FOR_USE_ANIMATION_FACTORY then
                    return animationInterfaceFactoryInterface
                end
            end
        end
        if resourceTypeAvailableList:size() > 0 then
            local NO_ANIMATION_AVAILABLE_FROM = "No animation available from: "
            local FOR_FACTORIES = " factories: "
            local FOR_RESOURCE = " for Resource: "
            local HAS_KEY = " has: "
            local RESOURCES_LABEL = " resources "
            local stringBuffer = StringMaker.new()
            stringBuffer:append(NO_ANIMATION_AVAILABLE_FROM)
            stringBuffer:appendint(resourceTypeAvailableList:size())
            stringBuffer:append(CommonSeps.getInstance().FORWARD_SLASH)
            stringBuffer:appendint(size)
            stringBuffer:append(FOR_FACTORIES)
            local size2 = resourceTypeAvailableList:size()
            for index = 0, size2 - 1 do
                stringBuffer:append(tostring(resourceTypeAvailableList:get(index)))
                stringBuffer:append(CommonSeps.getInstance().COMMA_SEP)
            end
            stringBuffer:append(FOR_RESOURCE)
            stringBuffer:append(resource)
            for index = 0, size - 1 do
                stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
                featureInterface = list.objectArray[index + 1]
                if featureInterface:isFeature() then
                    stringBuffer:append(StringUtil.getInstance():toString(featureInterface))
                    stringBuffer:append(HAS_KEY)
                    stringBuffer:appendint(featureInterface:getHashtable():size())
                    stringBuffer:append(RESOURCES_LABEL)
                end
            end
            error(java_exception("Exception", tostring(stringBuffer)), 0)
        else
            local stringBuffer = StringMaker.new()
            for index = 0, size - 1 do
                featureInterface = list.objectArray[index + 1]
                stringBuffer:append(tostring(featureInterface))
                stringBuffer:append(CommonSeps.getInstance().SPACE)
            end
            local result = tostring(stringBuffer)
            stringBuffer:delete(0, stringBuffer:length())
            error(java_exception("Exception", tostring(stringBuffer:append("No feature resource type available for Resource: "):append(resource):append(" Resource Factories Available: "):append(result))), 0)
        end
end

FeaturedAnimationInterfaceFactoryInterfaceFactory.INSTANCE = FeaturedAnimationInterfaceFactoryInterfaceFactory.new()

return FeaturedAnimationInterfaceFactoryInterfaceFactory

