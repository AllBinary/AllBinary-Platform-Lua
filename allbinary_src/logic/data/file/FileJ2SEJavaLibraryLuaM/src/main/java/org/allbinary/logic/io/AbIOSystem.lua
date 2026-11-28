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
-- package org.allbinary.logic.io

local AbIOSystem = {}
package.loaded["org.allbinary.logic.io.AbIOSystem"] = AbIOSystem

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

-- class table AbIOSystem is declared before the requires
AbIOSystem.__index = AbIOSystem
AbIOSystem.className = "AbIOSystem"
AbIOSystem.javaClassName = "org.allbinary.logic.io.AbIOSystem"

function AbIOSystem:_init_fields()
    self.type = "java.io"
end

function AbIOSystem._jinit(self)
    AbIOSystem._init_fields(self)
    return self
end

function AbIOSystem.new()
    return AbIOSystem._jinit(setmetatable({}, AbIOSystem))
end


function AbIOSystem.getInstance()
        return AbIOSystem.instance_f
end


function AbIOSystem:getType()
        return self.type
end


function AbIOSystem:isType(type)
        if rawequal(((self.type < type and -1) or (self.type > type and 1) or 0), 0) then
            return true
        else
            return false
        end
end

AbIOSystem.instance_f = AbIOSystem.new()

return AbIOSystem

