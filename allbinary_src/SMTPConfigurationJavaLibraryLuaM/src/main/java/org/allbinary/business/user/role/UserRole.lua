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
-- package org.allbinary.business.user.role

local UserRole = {}
package.loaded["org.allbinary.business.user.role.UserRole"] = UserRole

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

local Serializable = java_lazy("java.io.Serializable")
local UserFactoryInterface = java_lazy("org.allbinary.business.user.UserFactoryInterface")
local BasicUserRole = java_lazy("org.allbinary.business.user.role.BasicUserRole")

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

-- class table UserRole is declared before the requires
UserRole.__index = UserRole
UserRole.className = "UserRole"
UserRole.javaClassName = "org.allbinary.business.user.role.UserRole"
UserRole.java_implements = " Serializable "
UserRole.java_interfaces = function() return {Serializable} end

function UserRole:_init_fields()
    if self.basicUserRole == nil then self.basicUserRole = nil end
    if self.userFactoryInterface == nil then self.userFactoryInterface = nil end
end


function UserRole._jinit(self, aBasicUserRole, aUserFactoryInterface)
    UserRole._init_fields(self)
        self.basicUserRole = aBasicUserRole
        self.userFactoryInterface = aUserFactoryInterface
    return self
end

function UserRole.new(...)
    local self = setmetatable({}, UserRole)
    UserRole._jinit(self, ...)
    return self
end


function UserRole:toString()
        return tostring(self.basicUserRole)
end
UserRole.__tostring = function(self) return self:toString() end


function UserRole:getBasicUserRole()
        return self.basicUserRole
end


-- throws Exception
function UserRole:getUserFactory()
        return self.userFactoryInterface
end


function UserRole:getSessionTimeout()
        return self.basicUserRole:getSessionTimeout()
end


function UserRole:getSessionInactivityTimeout()
        return self.basicUserRole:getSessionInactivityTimeout()
end

return UserRole

