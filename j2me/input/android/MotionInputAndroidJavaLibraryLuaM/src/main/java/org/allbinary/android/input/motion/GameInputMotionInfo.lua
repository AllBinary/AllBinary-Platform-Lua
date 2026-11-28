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

local GameInputMotionInfo = {}
package.loaded["org.allbinary.android.input.motion.GameInputMotionInfo"] = GameInputMotionInfo

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

-- class table GameInputMotionInfo is declared before the requires
GameInputMotionInfo.__index = GameInputMotionInfo
GameInputMotionInfo.className = "GameInputMotionInfo"
GameInputMotionInfo.javaClassName = "org.allbinary.android.input.motion.GameInputMotionInfo"

function GameInputMotionInfo:_init_fields()
    if self.MAX_API == nil then self.MAX_API = 0 end
    if self.MAX_POINTERS == nil then self.MAX_POINTERS = 0 end
end


function GameInputMotionInfo._jinit(self, maxApi, maxPointers)
    GameInputMotionInfo._init_fields(self)
        self.MAX_API = maxApi
        self.MAX_POINTERS = maxPointers
    return self
end

function GameInputMotionInfo.new(...)
    local self = setmetatable({}, GameInputMotionInfo)
    GameInputMotionInfo._jinit(self, ...)
    return self
end

return GameInputMotionInfo

