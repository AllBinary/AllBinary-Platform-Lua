--
-- AllBinary Open License Version 1
-- Copyright (c) 2009 AllBinary
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
-- package org.allbinary.android.input.motion

local ActivityFractureInputUtilFactory = {}
package.loaded["org.allbinary.android.input.motion.ActivityFractureInputUtilFactory"] = ActivityFractureInputUtilFactory

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

local ActivityFractureUtil = java_lazy("org.allbinary.android.ActivityFractureUtil")
local AndroidInfoFactory = java_lazy("org.allbinary.android.AndroidInfoFactory")
local ActivityFractureUtilAPI1 = java_lazy("org.allbinary.android.api1.ActivityFractureUtilAPI1")
local ActivityFractureUtilAPI16 = java_lazy("org.allbinary.android.api16.ActivityFractureUtilAPI16")
local ActivityFractureUtilAPI19 = java_lazy("org.allbinary.android.api19.ActivityFractureUtilAPI19")
local ActivityFractureUtilAPI5 = java_lazy("org.allbinary.android.api5.ActivityFractureUtilAPI5")

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

-- class table ActivityFractureInputUtilFactory is declared before the requires
ActivityFractureInputUtilFactory.__index = ActivityFractureInputUtilFactory
ActivityFractureInputUtilFactory.className = "ActivityFractureInputUtilFactory"
ActivityFractureInputUtilFactory.javaClassName = "org.allbinary.android.input.motion.ActivityFractureInputUtilFactory"

function ActivityFractureInputUtilFactory._jinit(self)
    return self
end

function ActivityFractureInputUtilFactory.new()
    return ActivityFractureInputUtilFactory._jinit(setmetatable({}, ActivityFractureInputUtilFactory))
end


function ActivityFractureInputUtilFactory.getInstance()
        local SDK_VERSION = AndroidInfoFactory.getInstance():getVersion()
        if SDK_VERSION <= 4 then
            return ActivityFractureUtilAPI1.getInstance()
        elseif SDK_VERSION <= 15 then
            return ActivityFractureUtilAPI5.getInstance()
        elseif SDK_VERSION <= 16 then
            return ActivityFractureUtilAPI16.getInstance()
        else
            return ActivityFractureUtilAPI19.getInstance()
        end
end

return ActivityFractureInputUtilFactory

