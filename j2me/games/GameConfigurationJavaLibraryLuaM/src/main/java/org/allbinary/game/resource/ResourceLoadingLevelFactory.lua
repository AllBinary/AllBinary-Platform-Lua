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

local ResourceLoadingLevelFactory = {}
package.loaded["org.allbinary.game.resource.ResourceLoadingLevelFactory"] = ResourceLoadingLevelFactory

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

local ResourceLoadingLevel = java_lazy("org.allbinary.game.resource.ResourceLoadingLevel")

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

-- class table ResourceLoadingLevelFactory is declared before the requires
ResourceLoadingLevelFactory.__index = ResourceLoadingLevelFactory
ResourceLoadingLevelFactory.className = "ResourceLoadingLevelFactory"
ResourceLoadingLevelFactory.javaClassName = "org.allbinary.game.resource.ResourceLoadingLevelFactory"

function ResourceLoadingLevelFactory:_init_fields()
    self.LOAD_EARLY = ResourceLoadingLevel.new("Load Early", require("java.lang.Integer").MAX_VALUE)
    self.LOAD_TOUCH = ResourceLoadingLevel.new("Load Touch", require("java.lang.Integer").MAX_VALUE - 1)
    self.LOAD_GAME = ResourceLoadingLevel.new("Load Game", require("java.lang.Integer").MAX_VALUE - 2)
    self.LEVEL = ResourceLoadingLevel.new("Level", require("java.lang.Integer").MAX_VALUE - 99)
    self.MAX_LEVEL = ResourceLoadingLevel.new("Max Level", require("java.lang.Integer").MAX_VALUE - 100)
    self.LOAD_ALL = ResourceLoadingLevel.new("Load All", -1)
    self.RESOURCE_LOADING_LEVEL_ARRAY = {self.LOAD_ALL, self.MAX_LEVEL, self.LEVEL, self.LOAD_GAME, self.LOAD_TOUCH, self.LOAD_EARLY}
end

function ResourceLoadingLevelFactory._jinit(self)
    ResourceLoadingLevelFactory._init_fields(self)
    return self
end

function ResourceLoadingLevelFactory.new()
    return ResourceLoadingLevelFactory._jinit(setmetatable({}, ResourceLoadingLevelFactory))
end


function ResourceLoadingLevelFactory.getInstance()
        return ResourceLoadingLevelFactory.instance_f
end


function ResourceLoadingLevelFactory:getLevelString(level)
        for index = 0, (self.RESOURCE_LOADING_LEVEL_ARRAY.n or #self.RESOURCE_LOADING_LEVEL_ARRAY) - 1 do
            if level == self.RESOURCE_LOADING_LEVEL_ARRAY[index + 1]:getLevel() then
                return self.RESOURCE_LOADING_LEVEL_ARRAY[index + 1]:getName()
            end
        end
        return tostring(level)
end

ResourceLoadingLevelFactory.instance_f = ResourceLoadingLevelFactory.new()

return ResourceLoadingLevelFactory

