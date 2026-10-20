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
-- package org.allbinary.animation.resource

local BasicAnimationInterfaceFactoryInterface = require("org.allbinary.animation.BasicAnimationInterfaceFactoryInterface")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local ResourceLoadingLevelFactory = require("org.allbinary.game.resource.ResourceLoadingLevelFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local RectangleFactory = require("org.allbinary.graphics.RectangleFactory")
local ImageCache = require("org.allbinary.image.ImageCache")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local FeatureResourceAnimationInterfaceFactoryInterface = require("org.allbinary.animation.resource.FeatureResourceAnimationInterfaceFactoryInterface")

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

local BaseResourceAnimationInterfaceFactoryInterfaceFactory = {}
BaseResourceAnimationInterfaceFactoryInterfaceFactory.__index = BaseResourceAnimationInterfaceFactoryInterfaceFactory
BaseResourceAnimationInterfaceFactoryInterfaceFactory.className = "BaseResourceAnimationInterfaceFactoryInterfaceFactory"

function BaseResourceAnimationInterfaceFactoryInterfaceFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.hashtable = nil
    self.rectangleHashtable = nil
    self.rectangleArrayOfArraysHashtable = nil
    self.name = nil
    self.initialized = false
end


function BaseResourceAnimationInterfaceFactoryInterfaceFactory.new(name, hashtable, rectangleHashtable, rectangleArrayHashtable)
    local self = setmetatable({}, BaseResourceAnimationInterfaceFactoryInterfaceFactory)
    self:_init_fields()
        self.hashtable = hashtable
        self.rectangleHashtable = rectangleHashtable
        self.rectangleArrayOfArraysHashtable = rectangleArrayHashtable
        self.name = name
    return self
end


function BaseResourceAnimationInterfaceFactoryInterfaceFactory:getName()
        return self.name
end


-- throws Exception
function BaseResourceAnimationInterfaceFactoryInterfaceFactory:init(level)
        local commonStrings = CommonStrings.getInstance()
        self.logUtil:putF(tostring(StringMaker.new():append("Available List of Animations: "):append(tostring(self.hashtable))), self, commonStrings.INIT)
        self:setInitialized(true)
end


-- throws Exception
function BaseResourceAnimationInterfaceFactoryInterfaceFactory:initImageCache(imageCache, level)
end


-- throws Exception
function BaseResourceAnimationInterfaceFactoryInterfaceFactory:add(resource, animationInterfaceFactoryInterface)
        if self.hashtable:containsKey(resource) then
            error(java_exception("Exception", tostring(StringMaker.new():append("Resource Already Created: "):append(resource))), 0)
        end
        self.hashtable:put(resource, animationInterfaceFactoryInterface)
end


-- throws Exception
function BaseResourceAnimationInterfaceFactoryInterfaceFactory:getBasicAnimationInterfaceFactoryInstance(resource)
        local basicAnimationInterfaceFactoryInterfaceCanBeNull = self.hashtable:get(resource)
        if basicAnimationInterfaceFactoryInterfaceCanBeNull == nil then
            return NullAnimationFactory.NULL_NOT_FOR_USE_ANIMATION_FACTORY
        end
        return basicAnimationInterfaceFactoryInterfaceCanBeNull
end


-- throws Exception
function BaseResourceAnimationInterfaceFactoryInterfaceFactory:getRectangle(resource)
        local rectangleCanBeNull = self.rectangleHashtable:get(resource)
        if rectangleCanBeNull == nil then
            return RectangleFactory.SINGLETON
        end
        return rectangleCanBeNull
end


-- throws Exception
function BaseResourceAnimationInterfaceFactoryInterfaceFactory:addRectangle(resource, rectangle)
        self.rectangleHashtable:put(resource, rectangle)
end


-- throws Exception
function BaseResourceAnimationInterfaceFactoryInterfaceFactory:getRectangleArrayOfArrays(resource)
        return self.rectangleArrayOfArraysHashtable:get(resource)
end


-- throws Exception
function BaseResourceAnimationInterfaceFactoryInterfaceFactory:addRectangleArrayOfArrays(resource, rectangleArrayOfArrays)
        self.rectangleArrayOfArraysHashtable:put(resource, rectangleArrayOfArrays)
end


function BaseResourceAnimationInterfaceFactoryInterfaceFactory:isFeature()
        return false
end


function BaseResourceAnimationInterfaceFactoryInterfaceFactory:isLoadingLevel(level)
        local resourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance()
        if level == resourceLoadingLevelFactory.LOAD_ALL:getLevel() then
            return true
        else
            return false
        end
end


function BaseResourceAnimationInterfaceFactoryInterfaceFactory:toString()
        return tostring(StringMaker.new():append(getmetatable(self).className):append(CommonSeps.getInstance().SEMICOLON):append(CommonSeps.getInstance().SPACE):append(self.name))
end
BaseResourceAnimationInterfaceFactoryInterfaceFactory.__tostring = function(self) return self:toString() end


function BaseResourceAnimationInterfaceFactoryInterfaceFactory:getHashtable()
        return self.hashtable
end


function BaseResourceAnimationInterfaceFactoryInterfaceFactory:getRectangleHashtable()
        return self.rectangleHashtable
end


function BaseResourceAnimationInterfaceFactoryInterfaceFactory:getRectangleArrayOfArraysHashtable()
        return self.rectangleArrayOfArraysHashtable
end


function BaseResourceAnimationInterfaceFactoryInterfaceFactory:setInitialized(initialized)
        self.initialized = initialized
end


function BaseResourceAnimationInterfaceFactoryInterfaceFactory:isInitialized()
        return self.initialized
end

return BaseResourceAnimationInterfaceFactoryInterfaceFactory

