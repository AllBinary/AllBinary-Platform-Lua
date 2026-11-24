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

local MainFeatureFactory = {}
package.loaded["org.allbinary.game.configuration.feature.MainFeatureFactory"] = MainFeatureFactory

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

local Feature = java_lazy("org.allbinary.game.configuration.feature.Feature")

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

-- class table MainFeatureFactory is declared before the requires
MainFeatureFactory.__index = MainFeatureFactory
MainFeatureFactory.className = "MainFeatureFactory"
MainFeatureFactory.javaClassName = "org.allbinary.game.configuration.feature.MainFeatureFactory"

function MainFeatureFactory:_init_fields()
    self.FULL_SCREEN = Feature.new("Full Screen")
    self.TITLE_BAR = Feature.new("Title Bar")
    self.STATIC = Feature.new("Static Dependent Feature")
    self.LOAD_ONDEMAND = Feature.new("Load OnDemand")
    self.LOAD_ALL = Feature.new("Load All")
end

function MainFeatureFactory._jinit(self)
    MainFeatureFactory._init_fields(self)
    return self
end

function MainFeatureFactory.new()
    return MainFeatureFactory._jinit(setmetatable({}, MainFeatureFactory))
end


function MainFeatureFactory.getInstance()
        return MainFeatureFactory.instance_f
end

MainFeatureFactory.instance_f = MainFeatureFactory.new()

return MainFeatureFactory

