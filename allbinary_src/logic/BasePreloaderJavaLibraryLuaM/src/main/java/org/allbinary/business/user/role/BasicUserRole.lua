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

local BasicUserRole = {}
package.loaded["org.allbinary.business.user.role.BasicUserRole"] = BasicUserRole

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
local BasicUserRoles = java_lazy("org.allbinary.business.user.role.BasicUserRoles")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
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

-- class table BasicUserRole is declared before the requires
BasicUserRole.__index = BasicUserRole
BasicUserRole.className = "BasicUserRole"
BasicUserRole.javaClassName = "org.allbinary.business.user.role.BasicUserRole"
BasicUserRole.java_implements = " Serializable "
BasicUserRole.java_interfaces = function() return {Serializable} end

function BasicUserRole:_init_fields()
    if self.m_int_RoleId == nil then self.m_int_RoleId = 0 end
    if self.role == nil then self.role = nil end
    if self.displayValue == nil then self.displayValue = nil end
    if self.sessionTimeout == nil then self.sessionTimeout = 0 end
    if self.sessionInactivityTimeout == nil then self.sessionInactivityTimeout = 0 end
end

function BasicUserRole._jinit(self, ...)
    local count = select("#", ...)
    if count == 4 then return BasicUserRole._new4(self, ...)
    elseif count == 5 then return BasicUserRole._new5(self, ...)
    end
    error("No constructor of BasicUserRole takes " .. count .. " arguments")
end

function BasicUserRole.new(...)
    local self = setmetatable({}, BasicUserRole)
    BasicUserRole._jinit(self, ...)
    return self
end


function BasicUserRole._new4(self, aRole, a_int_RoleId, aSessionTimeout, aSessionInactivityTimeout)
    BasicUserRole._jinit(self, aRole, aRole, a_int_RoleId, aSessionTimeout, aSessionInactivityTimeout)
        -- this(...) made self above
    return self
end


function BasicUserRole._new5(self, aRole, aDisplayValue, a_int_RoleId, aSessionTimeout, aSessionInactivityTimeout)
    BasicUserRole._init_fields(self)
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
        if rawequal(self:getRoleId(), basicUserRole:getRoleId()) then
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

