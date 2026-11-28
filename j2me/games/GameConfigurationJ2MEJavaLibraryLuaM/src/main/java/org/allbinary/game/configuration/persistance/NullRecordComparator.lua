-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.game.configuration.persistance

local NullRecordComparator = {}
package.loaded["org.allbinary.game.configuration.persistance.NullRecordComparator"] = NullRecordComparator

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

local RecordComparator = java_lazy("javax.microedition.rms.RecordComparator")

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

-- class table NullRecordComparator is declared before the requires
NullRecordComparator.__index = NullRecordComparator
NullRecordComparator.className = "NullRecordComparator"
NullRecordComparator.javaClassName = "org.allbinary.game.configuration.persistance.NullRecordComparator"
NullRecordComparator.java_implements = " RecordComparator "
NullRecordComparator.java_interfaces = function() return {RecordComparator} end

function NullRecordComparator._jinit(self)
    return self
end

function NullRecordComparator.new()
    return NullRecordComparator._jinit(setmetatable({}, NullRecordComparator))
end


function NullRecordComparator:compare(rec1, rec2)
        return 0
end

NullRecordComparator.NULL_RECORD_COMPARATOR = NullRecordComparator.new()

return NullRecordComparator

