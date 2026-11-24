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
-- package org.allbinary.business.user

local CreateUserFactory = {}
package.loaded["org.allbinary.business.user.CreateUserFactory"] = CreateUserFactory

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

local HashMap = java_lazy("java.util.HashMap")
local UserRole = java_lazy("org.allbinary.business.user.role.UserRole")
local UserRoleB = java_lazy("org.allbinary.business.user.role.UserRoleB")
local UserRoleData = java_lazy("org.allbinary.business.user.role.UserRoleData")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")

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

-- class table CreateUserFactory is declared before the requires
CreateUserFactory.__index = CreateUserFactory
CreateUserFactory.className = "CreateUserFactory"
CreateUserFactory.javaClassName = "org.allbinary.business.user.CreateUserFactory"


function CreateUserFactory._jinit(self)
    return self
end

function CreateUserFactory.new(...)
    local self = setmetatable({}, CreateUserFactory)
    CreateUserFactory._jinit(self, ...)
    return self
end


-- throws Exception
function CreateUserFactory.getInstance(hashMap)
        if hashMap ~= nil then
            local roleString = hashMap:get(tostring(UserRoleData.NAME))
            if not StringValidationUtil.getInstance():isEmpty(roleString) then
                local role = UserRoleB.getRole(roleString)
                return role:getUserFactory():getInstance(hashMap)
            else
                error(require("java.lang.Exception").new("No Role Specified"), 0)
            end
        else
            error(require("java.lang.Exception").new("Null HashMap"), 0)
        end
end

return CreateUserFactory

