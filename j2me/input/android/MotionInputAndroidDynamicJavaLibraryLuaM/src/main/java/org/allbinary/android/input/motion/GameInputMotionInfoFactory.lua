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

local GameInputMotionInfoFactory = {}
package.loaded["org.allbinary.android.input.motion.GameInputMotionInfoFactory"] = GameInputMotionInfoFactory

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

local AndroidInfoFactory = java_lazy("org.allbinary.android.AndroidInfoFactory")
local GameInputMotionInfoAPI1 = java_lazy("org.allbinary.android.input.motion.api1.GameInputMotionInfoAPI1")
local GameInputMotionInfoAPI5 = java_lazy("org.allbinary.android.input.motion.api5.GameInputMotionInfoAPI5")
local GameInputMotionInfo = java_lazy("org.allbinary.android.input.motion.GameInputMotionInfo")

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

-- class table GameInputMotionInfoFactory is declared before the requires
GameInputMotionInfoFactory.__index = GameInputMotionInfoFactory
GameInputMotionInfoFactory.className = "GameInputMotionInfoFactory"
GameInputMotionInfoFactory.javaClassName = "org.allbinary.android.input.motion.GameInputMotionInfoFactory"

function GameInputMotionInfoFactory._jinit(self)
    return self
end

function GameInputMotionInfoFactory.new()
    return GameInputMotionInfoFactory._jinit(setmetatable({}, GameInputMotionInfoFactory))
end


function GameInputMotionInfoFactory.getInstance()
        local SDK_VERSION = AndroidInfoFactory.getInstance():getVersion()
        if SDK_VERSION <= 4 then
            return GameInputMotionInfoAPI1.getInstance()
        else
            return GameInputMotionInfoAPI5.getInstance()
        end
end

return GameInputMotionInfoFactory

