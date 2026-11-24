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
-- package org.allbinary.logic.system

local SoftwareInformation = {}
package.loaded["org.allbinary.logic.system.SoftwareInformation"] = SoftwareInformation

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

local KotlinUtil = java_lazy("org.allbinary.KotlinUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")

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

-- class table SoftwareInformation is declared before the requires
SoftwareInformation.__index = SoftwareInformation
SoftwareInformation.className = "SoftwareInformation"
SoftwareInformation.javaClassName = "org.allbinary.logic.system.SoftwareInformation"

function SoftwareInformation:_init_fields()
    if self.name_f == nil then self.name_f = nil end
    if self.shortName == nil then self.shortName = nil end
    if self.version == nil then self.version = nil end
end


function SoftwareInformation._jinit(self, name, version, shortName)
    SoftwareInformation._init_fields(self)
        self.name_f = name
        self.version = version
        self.shortName = tostring(StringMaker.new():append(shortName):append(KotlinUtil.getShortName()))
    return self
end

function SoftwareInformation.new(...)
    local self = setmetatable({}, SoftwareInformation)
    SoftwareInformation._jinit(self, ...)
    return self
end


function SoftwareInformation:getName()
        return self.name_f
end


function SoftwareInformation:getVersion()
        return self.version
end


function SoftwareInformation:toShortString()
        return self.shortName
end


function SoftwareInformation:toString()
        local NAME = "Name: "
        local VERSION = "Version: "
        local stringBuffer = StringMaker.new()
        stringBuffer:append(NAME)
        stringBuffer:append(self:getName())
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(VERSION)
        stringBuffer:append(self:getVersion())
        return tostring(stringBuffer)
end
SoftwareInformation.__tostring = function(self) return self:toString() end

return SoftwareInformation

