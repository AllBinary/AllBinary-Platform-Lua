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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicUserRole = {}
BasicUserRole.__index = BasicUserRole
BasicUserRole.className = "BasicUserRole"

function BasicUserRole:_init_fields()
    self.m_int_RoleId = nil
    self.role = nil
    self.displayValue = nil
    self.sessionTimeout = nil
    self.sessionInactivityTimeout = nil
end

function BasicUserRole.new(...)
    local count = select("#", ...)
    if count == 4 then return BasicUserRole._new4(...)
    elseif count == 5 then return BasicUserRole._new5(...)
    end
end


function BasicUserRole._new4(aRole, a_int_RoleId, aSessionTimeout, aSessionInactivityTimeout)
    local self = BasicUserRole._new5(aRole, aRole, a_int_RoleId, aSessionTimeout, aSessionInactivityTimeout)
        -- this(...) made self above
    return self
end


function BasicUserRole._new5(aRole, aDisplayValue, a_int_RoleId, aSessionTimeout, aSessionInactivityTimeout)
    local self = setmetatable({}, BasicUserRole)
    self:_init_fields()
        self.m_int_RoleId = a_int_RoleId
        self.role = aRole
        self.displayValue = aDisplayValue
        self.sessionTimeout = aSessionTimeout
        self.sessionInactivityTimeout = aSessionInactivityTimeout
        BasicUserRoles.getInstance().roleVector:add(self)
    return self
end


function BasicUserRole:getRoleId()
        return self.m_int_RoleId
end


function BasicUserRole:getRole()
        return self.role
end


function BasicUserRole:getSessionTimeout()
        return self.sessionTimeout
end


function BasicUserRole:getSessionInactivityTimeout()
        return self.sessionInactivityTimeout
end


function BasicUserRole:equals(basicUserRole)
        if self:getRoleId() == basicUserRole:getRoleId() then
            return true
        end
        return false
end
BasicUserRole.__eq = function(self, other) return self:equals(other) end


function BasicUserRole:toString()
        return self:getRole()
end
BasicUserRole.__tostring = function(self) return self:toString() end

return BasicUserRole

