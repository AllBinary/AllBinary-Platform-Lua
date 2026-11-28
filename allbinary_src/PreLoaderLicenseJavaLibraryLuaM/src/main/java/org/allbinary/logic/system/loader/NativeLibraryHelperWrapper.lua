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

local NativeLibraryHelperWrapper = {}
package.loaded["org.allbinary.logic.system.loader.NativeLibraryHelperWrapper"] = NativeLibraryHelperWrapper

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

-- local Constructor = require("java.lang.reflect.Constructor")
-- local Method = require("java.lang.reflect.Method")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local NativeLibraryClassLoader = java_lazy("org.allbinary.logic.system.loader.NativeLibraryClassLoader")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table NativeLibraryHelperWrapper is declared before the requires
NativeLibraryHelperWrapper.__index = NativeLibraryHelperWrapper
NativeLibraryHelperWrapper.className = "NativeLibraryHelperWrapper"
NativeLibraryHelperWrapper.javaClassName = "org.allbinary.logic.system.loader.NativeLibraryHelperWrapper"

function NativeLibraryHelperWrapper:_init_fields()
    if self.libraryName == nil then self.libraryName = nil end
    if self.loader == nil then self.loader = nil end
    if self.anyType == nil then self.anyType = nil end
end


function NativeLibraryHelperWrapper._jinit(self, libraryName)
    NativeLibraryHelperWrapper._init_fields(self)
        self:setLibraryName(libraryName)
    return self
end

function NativeLibraryHelperWrapper.new(...)
    local self = setmetatable({}, NativeLibraryHelperWrapper)
    NativeLibraryHelperWrapper._jinit(self, ...)
    return self
end


-- throws Exception
function NativeLibraryHelperWrapper:load()
        local params = java_new_array(nil, 1)
        params[1] = self:getLibraryName()
        local classes = java_new_array(nil, 1)
        classes[1] = getmetatable(self:getLibraryName())
        self.loader = NativeLibraryClassLoader.new(require("java.lang.ClassLoader").getSystemClassLoader())
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
        return require("allbinary_java").to_string("Library: ") .. require("allbinary_java").to_string(self:getLibraryName())
end
NativeLibraryHelperWrapper.__tostring = function(self) return self:toString() end


function NativeLibraryHelperWrapper:getLibraryName()
        return self.libraryName
end


function NativeLibraryHelperWrapper:setLibraryName(libraryName)
        self.libraryName = libraryName
end

return NativeLibraryHelperWrapper

