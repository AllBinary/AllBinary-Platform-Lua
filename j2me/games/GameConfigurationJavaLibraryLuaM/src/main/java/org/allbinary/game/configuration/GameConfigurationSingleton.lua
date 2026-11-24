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
-- package org.allbinary.game.configuration

local GameConfigurationSingleton = {}
package.loaded["org.allbinary.game.configuration.GameConfigurationSingleton"] = GameConfigurationSingleton

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

local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local GameConfiguration = java_lazy("org.allbinary.game.configuration.GameConfiguration")

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

-- class table GameConfigurationSingleton is declared before the requires
GameConfigurationSingleton.__index = GameConfigurationSingleton
GameConfigurationSingleton.className = "GameConfigurationSingleton"
GameConfigurationSingleton.javaClassName = "org.allbinary.game.configuration.GameConfigurationSingleton"

function GameConfigurationSingleton:_init_fields()
    if self.list == nil then self.list = nil end
    if self.hashtable == nil then self.hashtable = nil end
end


function GameConfigurationSingleton.getInstance()
        return GameConfigurationSingleton.SINGLETON
end


function GameConfigurationSingleton._jinit(self)
    GameConfigurationSingleton._init_fields(self)
        self.list = BasicArrayListD.new()
        self.hashtable = StdUtil.getInstance():createHashtable()
    return self
end

function GameConfigurationSingleton.new(...)
    local self = setmetatable({}, GameConfigurationSingleton)
    GameConfigurationSingleton._jinit(self, ...)
    return self
end


function GameConfigurationSingleton:getInstanceByName(name)
        return self.hashtable:get(name)
end


function GameConfigurationSingleton:getOptionsBasicArrayList()
        return self.list
end


function GameConfigurationSingleton:add(gameConfiguration)
        self.list:add(gameConfiguration)
end


function GameConfigurationSingleton:getHashtable()
        return self.hashtable
end

GameConfigurationSingleton.SINGLETON = GameConfigurationSingleton.new()

return GameConfigurationSingleton

