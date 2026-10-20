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
-- package org.allbinary.logic.system.loader

-- local Constructor = require("java.lang.reflect.Constructor")
-- local Method = require("java.lang.reflect.Method")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local NativeLibraryHelperWrapper = {}
NativeLibraryHelperWrapper.__index = NativeLibraryHelperWrapper
NativeLibraryHelperWrapper.className = "NativeLibraryHelperWrapper"

function NativeLibraryHelperWrapper:_init_fields()
    self.libraryName = nil
    self.loader = nil
    self.anyType = nil
end


function NativeLibraryHelperWrapper.new(libraryName)
    local self = setmetatable({}, NativeLibraryHelperWrapper)
    self:_init_fields()
        self:setLibraryName(libraryName)
    return self
end


-- throws Exception
function NativeLibraryHelperWrapper:load()
        local params = java_new_array(nil, 1)
        params[1] = self:getLibraryName()
        local classes = java_new_array(nil, 1)
        classes[1] = getmetatable(self:getLibraryName())
        self.loader = NativeLibraryClassLoader.new(getmetatable(self):getClassLoader())
        local myClass = self.loader:loadClass("dynamic.NativeLibraryHelper")
        local constructor = myClass:getConstructor(classes)
        self.anyType = constructor:newInstance(params)
        local commonStrings = CommonStrings.getInstance()
        local method = getmetatable(self.anyType):getMethod(commonStrings.LOAD, nil)
        method:invoke(self.anyType, nil)
end


function NativeLibraryHelperWrapper:unload()
        self.anyType = nil
        self.loader = nil
        collectgarbage()
        collectgarbage()
end


function NativeLibraryHelperWrapper:toString()
        return "Library: " .. tostring(self:getLibraryName())
end
NativeLibraryHelperWrapper.__tostring = function(self) return self:toString() end


function NativeLibraryHelperWrapper:getLibraryName()
        return self.libraryName
end


function NativeLibraryHelperWrapper:setLibraryName(libraryName)
        self.libraryName = libraryName
end

return NativeLibraryHelperWrapper

