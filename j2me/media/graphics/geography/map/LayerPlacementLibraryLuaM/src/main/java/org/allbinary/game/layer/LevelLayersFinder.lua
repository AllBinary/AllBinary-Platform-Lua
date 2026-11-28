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
-- package org.allbinary.game.layer

local LevelLayersFinder = {}
package.loaded["org.allbinary.game.layer.LevelLayersFinder"] = LevelLayersFinder

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

local Enumeration = java_lazy("java.util.Enumeration")
local Layer = java_lazy("org.allbinary.layer.Layer")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local EnumerationUtil = java_lazy("org.allbinary.util.EnumerationUtil")

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

-- class table LevelLayersFinder is declared before the requires
LevelLayersFinder.__index = LevelLayersFinder
LevelLayersFinder.className = "LevelLayersFinder"
LevelLayersFinder.javaClassName = "org.allbinary.game.layer.LevelLayersFinder"

function LevelLayersFinder:_init_fields()
    self.enumerationUtil = EnumerationUtil.getInstance()
end

function LevelLayersFinder._jinit(self)
    LevelLayersFinder._init_fields(self)
    return self
end

function LevelLayersFinder.new()
    return LevelLayersFinder._jinit(setmetatable({}, LevelLayersFinder))
end


function LevelLayersFinder.getInstance()
        return LevelLayersFinder.instance_f
end


function LevelLayersFinder:get(hashtable)
        local smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
        local list = BasicArrayListD.new()
        local enumeration = hashtable:keys()
        local layerHashtableCanBeNull = nil
        local integerCanBeNull = nil
        local cachedIntegerCanBeNull = nil
        while self.enumerationUtil:hasMoreElements(enumeration) do
            layerHashtableCanBeNull = hashtable:get(self.enumerationUtil:nextElement(enumeration))
            integerCanBeNull = layerHashtableCanBeNull:get(Layer.ID)
            cachedIntegerCanBeNull = smallIntegerSingletonFactory:getAt(require("allbinary_java").number_value(integerCanBeNull, "intValue"))
            if not (list:contains(cachedIntegerCanBeNull)) then
                list:add(cachedIntegerCanBeNull)
            end
        end
        return list
end

LevelLayersFinder.instance_f = LevelLayersFinder.new()

return LevelLayersFinder

