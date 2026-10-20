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

-- local HashMap = require("java.util.HashMap")
local UserRole = require("org.allbinary.business.user.role.UserRole")
local UserRoleB = require("org.allbinary.business.user.role.UserRoleB")
local UserRoleData = require("org.allbinary.business.user.role.UserRoleData")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")

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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CreateUserFactory = {}
CreateUserFactory.__index = CreateUserFactory
CreateUserFactory.className = "CreateUserFactory"


function CreateUserFactory.new()
    local self = setmetatable({}, CreateUserFactory)
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
                error(java_exception("Exception", "No Role Specified"), 0)
            end
        else
            error(java_exception("Exception", "Null HashMap"), 0)
        end
end

return CreateUserFactory

