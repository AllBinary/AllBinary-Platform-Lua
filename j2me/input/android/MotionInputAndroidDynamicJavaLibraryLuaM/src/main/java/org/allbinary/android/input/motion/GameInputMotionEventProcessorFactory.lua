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

local GameInputMotionEventProcessorFactory = {}
package.loaded["org.allbinary.android.input.motion.GameInputMotionEventProcessorFactory"] = GameInputMotionEventProcessorFactory

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
local GameInputMotionEventProcessorAPI1 = java_lazy("org.allbinary.android.input.motion.api1.GameInputMotionEventProcessorAPI1")
local GameInputMotionEventProcessorAPI5 = java_lazy("org.allbinary.android.input.motion.api5.GameInputMotionEventProcessorAPI5")

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

-- class table GameInputMotionEventProcessorFactory is declared before the requires
GameInputMotionEventProcessorFactory.__index = GameInputMotionEventProcessorFactory
GameInputMotionEventProcessorFactory.className = "GameInputMotionEventProcessorFactory"
GameInputMotionEventProcessorFactory.javaClassName = "org.allbinary.android.input.motion.GameInputMotionEventProcessorFactory"

function GameInputMotionEventProcessorFactory._jinit(self)
    return self
end

function GameInputMotionEventProcessorFactory.new()
    return GameInputMotionEventProcessorFactory._jinit(setmetatable({}, GameInputMotionEventProcessorFactory))
end


function GameInputMotionEventProcessorFactory.getInstance()
        local SDK_VERSION = AndroidInfoFactory.getInstance():getVersion()
        if SDK_VERSION <= 4 then
            return GameInputMotionEventProcessorAPI1.getInstance()
        else
            return GameInputMotionEventProcessorAPI5.getInstance()
        end
end

return GameInputMotionEventProcessorFactory

