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

local BaseResourceAnimationInterfaceFactoryInterfaceFactory = {}
package.loaded["org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory"] = BaseResourceAnimationInterfaceFactoryInterfaceFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local BasicAnimationInterfaceFactoryInterface = java_lazy("org.allbinary.animation.BasicAnimationInterfaceFactoryInterface")
local NullAnimationFactory = java_lazy("org.allbinary.animation.NullAnimationFactory")
local ResourceLoadingLevelFactory = java_lazy("org.allbinary.game.resource.ResourceLoadingLevelFactory")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local RectangleFactory = java_lazy("org.allbinary.graphics.RectangleFactory")
local ImageCache = java_lazy("org.allbinary.image.ImageCache")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table BaseResourceAnimationInterfaceFactoryInterfaceFactory is declared before the requires
BaseResourceAnimationInterfaceFactoryInterfaceFactory.__index = BaseResourceAnimationInterfaceFactoryInterfaceFactory
BaseResourceAnimationInterfaceFactoryInterfaceFactory.className = "BaseResourceAnimationInterfaceFactoryInterfaceFactory"
BaseResourceAnimationInterfaceFactoryInterfaceFactory.javaClassName = "org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory"
BaseResourceAnimationInterfaceFactoryInterfaceFactory.java_implements = " FeatureResourceAnimationInterfaceFactoryInterface "
BaseResourceAnimationInterfaceFactoryInterfaceFactory.java_interfaces = function() return {FeatureResourceAnimationInterfaceFactoryInterface} end

function BaseResourceAnimationInterfaceFactoryInterfaceFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.hashtable == nil then self.hashtable = nil end
    if self.rectangleHashtable == nil then self.rectangleHashtable = nil end
    if self.rectangleArrayOfArraysHashtable == nil then self.rectangleArrayOfArraysHashtable = nil end
    if self.name_f == nil then self.name_f = nil end
    if self.initialized == nil then self.initialized = false end
end


function BaseResourceAnimationInterfaceFactoryInterfaceFactory._jinit(self, name, hashtable, rectangleHashtable, rectangleArrayHashtable)
    BaseResourceAnimationInterfaceFactoryInterfaceFactory._init_fields(self)
        self.hashtable = hashtable
        self.rectangleHashtable = rectangleHashtable
        self.rectangleArrayOfArraysHashtable = rectangleArrayHashtable
        self.name_f = name
    return self
end

function BaseResourceAnimationInterfaceFactoryInterfaceFactory.new(...)
    local self = setmetatable({}, BaseResourceAnimationInterfaceFactoryInterfaceFactory)
    BaseResourceAnimationInterfaceFactoryInterfaceFactory._jinit(self, ...)
    return self
end


function BaseResourceAnimationInterfaceFactoryInterfaceFactory:getName()
        return self.name_f
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
            error(require("java.lang.Exception").new(tostring(StringMaker.new():append("Resource Already Created: "):append(resource))), 0)
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
        local valueCanBeNull = self.rectangleArrayOfArraysHashtable:get(resource)
        if valueCanBeNull ~= nil then
            local rectangleArrayOfArrays = valueCanBeNull
            return rectangleArrayOfArrays
        else
            return RectangleFactory.ARRAY_OF_ARRAYS
        end
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
        return tostring(StringMaker.new():append((getmetatable(self).javaClassName or getmetatable(self).className)):append(CommonSeps.getInstance().SEMICOLON):append(CommonSeps.getInstance().SPACE):append(self.name_f))
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

