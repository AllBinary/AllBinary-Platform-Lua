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
-- package dynamic


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NativeLibraryHelper = {}
NativeLibraryHelper.__index = NativeLibraryHelper
NativeLibraryHelper.className = "NativeLibraryHelper"

function NativeLibraryHelper:_init_fields()
    self.library = nil
end


function NativeLibraryHelper.new(library)
    local self = setmetatable({}, NativeLibraryHelper)
    self:_init_fields()
        self.library = library
    return self
end


function NativeLibraryHelper:load()
        System.loadLibrary(self.library)
end

return NativeLibraryHelper

