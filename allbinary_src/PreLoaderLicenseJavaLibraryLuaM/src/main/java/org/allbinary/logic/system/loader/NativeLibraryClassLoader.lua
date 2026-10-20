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

-- java.lang.ClassLoader has no Lua module
local ClassLoader = {}
ClassLoader.__index = ClassLoader
ClassLoader.className = "ClassLoader"
function ClassLoader.new() return setmetatable({}, ClassLoader) end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NativeLibraryClassLoader = {}
NativeLibraryClassLoader.__index = NativeLibraryClassLoader
NativeLibraryClassLoader.className = "NativeLibraryClassLoader"
setmetatable(NativeLibraryClassLoader, {__index = ClassLoader})

function NativeLibraryClassLoader:_init_fields()
    self.message = "This Class Loader Does Not Load Classes - Only For Loading and Unloading of Native Libraries"
end


function NativeLibraryClassLoader.new(parent)
    local self = setmetatable(ClassLoader.new(parent), NativeLibraryClassLoader)
    self:_init_fields()
        -- super(...) made self above
    return self
end

return NativeLibraryClassLoader

