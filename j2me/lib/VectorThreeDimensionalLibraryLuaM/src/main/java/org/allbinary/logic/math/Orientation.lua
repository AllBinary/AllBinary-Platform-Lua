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
-- package org.allbinary.logic.math

local Orientation = {}
package.loaded["org.allbinary.logic.math.Orientation"] = Orientation

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")

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

-- class table Orientation is declared before the requires
Orientation.__index = Orientation
Orientation.className = "Orientation"
Orientation.javaClassName = "org.allbinary.logic.math.Orientation"

function Orientation:_init_fields()
    self.yaw = BasicDecimal.new(0)
    self.pitch = BasicDecimal.new(0)
    self.roll = BasicDecimal.new(0)
end


function Orientation.getInstance(yaw, pitch, roll)
        Orientation.SINGLETON.yaw:setint(yaw)
        Orientation.SINGLETON.pitch:setint(pitch)
        Orientation.SINGLETON.roll:setint(roll)
        return Orientation.SINGLETON
end


function Orientation._jinit(self, yaw, pitch, roll)
    Orientation._init_fields(self)
        self.yaw:setint(yaw)
        self.pitch:setint(pitch)
        self.roll:setint(roll)
    return self
end

function Orientation.new(...)
    local self = setmetatable({}, Orientation)
    Orientation._jinit(self, ...)
    return self
end


function Orientation:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("Y: ")
        stringBuffer:append(tostring(self.yaw))
        stringBuffer:append(" P: ")
        stringBuffer:append(tostring(self.pitch))
        stringBuffer:append(" R: ")
        stringBuffer:append(tostring(self.roll))
        return tostring(stringBuffer)
end
Orientation.__tostring = function(self) return self:toString() end

Orientation.NONE = Orientation.new(0, 0, 0)
Orientation.SINGLETON = Orientation.new(0, 0, 0)

return Orientation

