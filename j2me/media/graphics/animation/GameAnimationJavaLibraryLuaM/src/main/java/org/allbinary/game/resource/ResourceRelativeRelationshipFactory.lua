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

local ResourceRelativeRelationshipFactory = {}
package.loaded["org.allbinary.game.resource.ResourceRelativeRelationshipFactory"] = ResourceRelativeRelationshipFactory

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

local RelativeRelationship = java_lazy("org.allbinary.graphics.RelativeRelationship")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")
local ResourceRelativeRelationshipFactoryInterface = require("org.allbinary.game.resource.ResourceRelativeRelationshipFactoryInterface")

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

-- class table ResourceRelativeRelationshipFactory is declared before the requires
ResourceRelativeRelationshipFactory.__index = ResourceRelativeRelationshipFactory
ResourceRelativeRelationshipFactory.className = "ResourceRelativeRelationshipFactory"
ResourceRelativeRelationshipFactory.javaClassName = "org.allbinary.game.resource.ResourceRelativeRelationshipFactory"
ResourceRelativeRelationshipFactory.java_implements = " ResourceRelativeRelationshipFactoryInterface "
ResourceRelativeRelationshipFactory.java_interfaces = function() return {ResourceRelativeRelationshipFactoryInterface} end

function ResourceRelativeRelationshipFactory:_init_fields()
    self.basicArrayListUtil = BasicArrayListUtil.getInstance()
    self.hashtable = StdUtil.getInstance():createHashtable()
    if self.initialized == nil then self.initialized = false end
end

function ResourceRelativeRelationshipFactory._jinit(self)
    ResourceRelativeRelationshipFactory._init_fields(self)
    return self
end

function ResourceRelativeRelationshipFactory.new()
    return ResourceRelativeRelationshipFactory._jinit(setmetatable({}, ResourceRelativeRelationshipFactory))
end


-- throws Exception
function ResourceRelativeRelationshipFactory:init(level)
        self:setInitialized(true)
end


-- throws Exception
function ResourceRelativeRelationshipFactory:getResourceRelativeRelationshipList(resource)
        local listCanBeNull = self.hashtable:get(resource)
        if rawequal(listCanBeNull, nil) then
            return self.basicArrayListUtil:getImmutableInstance()
        end
        return listCanBeNull
end


-- throws Exception
function ResourceRelativeRelationshipFactory:addResourceRelativeRelationship(resource, hardPoint)
        local list = self:getResourceRelativeRelationshipList(resource)
        if rawequal(list, self.basicArrayListUtil:getImmutableInstance()) then
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

