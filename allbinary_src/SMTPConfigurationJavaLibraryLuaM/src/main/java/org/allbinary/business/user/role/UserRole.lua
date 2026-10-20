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

-- local Serializable = require("java.io.Serializable")
local UserFactoryInterface = require("org.allbinary.business.user.UserFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UserRole = {}
UserRole.__index = UserRole
UserRole.className = "UserRole"

function UserRole:_init_fields()
    self.basicUserRole = nil
    self.userFactoryInterface = nil
end


function UserRole.new(aBasicUserRole, aUserFactoryInterface)
    local self = setmetatable({}, UserRole)
    self:_init_fields()
        self.basicUserRole = aBasicUserRole
        self.userFactoryInterface = aUserFactoryInterface
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

