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

local GameFeatureChoiceGroups = {}
package.loaded["org.allbinary.game.configuration.feature.GameFeatureChoiceGroups"] = GameFeatureChoiceGroups

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

-- class table GameFeatureChoiceGroups is declared before the requires
GameFeatureChoiceGroups.__index = GameFeatureChoiceGroups
GameFeatureChoiceGroups.className = "GameFeatureChoiceGroups"
GameFeatureChoiceGroups.javaClassName = "org.allbinary.game.configuration.feature.GameFeatureChoiceGroups"

function GameFeatureChoiceGroups:_init_fields()
    self.hashtable = StdUtil.getInstance():createHashtable()
end


function GameFeatureChoiceGroups._jinit(self)
    GameFeatureChoiceGroups._init_fields(self)
    return self
end

function GameFeatureChoiceGroups.new(...)
    local self = setmetatable({}, GameFeatureChoiceGroups)
    GameFeatureChoiceGroups._jinit(self, ...)
    return self
end


function GameFeatureChoiceGroups.getExclusiveInstance()
        return GameFeatureChoiceGroups.gameFeatureChoiceGroupsExclusive
end


function GameFeatureChoiceGroups.getMultipleInstance()
        return GameFeatureChoiceGroups.gameFeatureChoiceGroupsMultiple
end


function GameFeatureChoiceGroups:get()
        return self.hashtable
end


function GameFeatureChoiceGroups:add(name, list)
        self.hashtable:put(name, list)
end

GameFeatureChoiceGroups.gameFeatureChoiceGroupsExclusive = GameFeatureChoiceGroups.new()
GameFeatureChoiceGroups.gameFeatureChoiceGroupsMultiple = GameFeatureChoiceGroups.new()

return GameFeatureChoiceGroups

