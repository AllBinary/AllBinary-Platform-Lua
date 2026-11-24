-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2026 AllBinary 
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

local BasicUserRoles = {}
package.loaded["org.allbinary.business.user.role.BasicUserRoles"] = BasicUserRoles

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasicUserRole = java_lazy("org.allbinary.business.user.role.BasicUserRole")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

-- class table BasicUserRoles is declared before the requires
BasicUserRoles.__index = BasicUserRoles
BasicUserRoles.className = "BasicUserRoles"
BasicUserRoles.javaClassName = "org.allbinary.business.user.role.BasicUserRoles"

function BasicUserRoles:_init_fields()
    self.roleVector = BasicArrayListD.new()
end

function BasicUserRoles._jinit(self)
    BasicUserRoles._init_fields(self)
    return self
end

function BasicUserRoles.new()
    return BasicUserRoles._jinit(setmetatable({}, BasicUserRoles))
end


function BasicUserRoles.getInstance()
        return BasicUserRoles.instance_f
end


-- throws Exception
function BasicUserRoles:getRole(role)
        local roleVector = self:getAll()
        local size = roleVector:size()
        for index = 0, size - 1 do
            local userRole = roleVector:get(index)
            if ((role < tostring(userRole) and -1) or (role > tostring(userRole) and 1) or 0) == 0 then
                return userRole
            end
        end
        error(require("java.lang.Exception").new("Unable to get role - Unknown Role"), 0)
end


function BasicUserRoles:getAll()
        return self.roleVector
end

BasicUserRoles.instance_f = BasicUserRoles.new()

return BasicUserRoles

