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
-- package org.allbinary.game.configuration.feature

local Feature = {}
package.loaded["org.allbinary.game.configuration.feature.Feature"] = Feature

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

local ChangedGameFeatureListener = java_lazy("org.allbinary.game.configuration.event.ChangedGameFeatureListener")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")

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

-- class table Feature is declared before the requires
Feature.__index = Feature
Feature.className = "Feature"
Feature.javaClassName = "org.allbinary.game.configuration.feature.Feature"

function Feature:_init_fields()
    if self.name_f == nil then self.name_f = nil end
end


function Feature._jinit(self, name)
    Feature._init_fields(self)
        self.name_f = name
        Feature.add(name, self)
        ChangedGameFeatureListener.getInstance():add(self)
    return self
end

function Feature.new(...)
    local self = setmetatable({}, Feature)
    Feature._jinit(self, ...)
    return self
end


function Feature.getInstance(name)
        return Feature.hashtable:get(name)
end


function Feature.add(name, gameFeature)
        Feature.hashtable:put(name, gameFeature)
end


function Feature:toString()
        return self:getName()
end
Feature.__tostring = function(self) return self:toString() end


function Feature:getName()
        return self.name_f
end

Feature.hashtable = StdUtil.getInstance():createHashtable()

return Feature

