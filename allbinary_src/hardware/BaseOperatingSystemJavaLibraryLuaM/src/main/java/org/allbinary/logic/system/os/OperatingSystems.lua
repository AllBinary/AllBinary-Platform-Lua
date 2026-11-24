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
-- package org.allbinary.logic.system.os

local OperatingSystems = {}
package.loaded["org.allbinary.logic.system.os.OperatingSystems"] = OperatingSystems

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

-- class table OperatingSystems is declared before the requires
OperatingSystems.__index = OperatingSystems
OperatingSystems.className = "OperatingSystems"
OperatingSystems.javaClassName = "org.allbinary.logic.system.os.OperatingSystems"

function OperatingSystems:_init_fields()
    self.LINUX = "Linux"
    self.WINDOWS = "Windows"
    self.SOLARIS = "Solaris"
    self.WINDOWS2000 = "Windows 2000"
    self.WINDOWS_NT = "Windows NT"
    self.WINDOWS_10 = "Windows 10"
    self.WINDOWS_11 = "Windows 11"
    self.WINDOWS_VISTA = "Windows Vista"
    self.WINDOWS_XP = "Windows XP"
    self.ANDROID = self.LINUX
    self.HARMONY = "HarmonyOS"
    self.unknownSpecificOSAllowed = true
end


function OperatingSystems._jinit(self)
    OperatingSystems._init_fields(self)
    return self
end

function OperatingSystems.new(...)
    local self = setmetatable({}, OperatingSystems)
    OperatingSystems._jinit(self, ...)
    return self
end


function OperatingSystems:isUnknownSpecificOSAllowed()
        return self.unknownSpecificOSAllowed
end


function OperatingSystems:setUnknownSpecificOSAllowed(aUnknownSpecificOSAllowed)
        self.unknownSpecificOSAllowed = aUnknownSpecificOSAllowed
end


function OperatingSystems.getInstance()
        return OperatingSystems.instance_f
end

OperatingSystems.instance_f = OperatingSystems.new()

return OperatingSystems

