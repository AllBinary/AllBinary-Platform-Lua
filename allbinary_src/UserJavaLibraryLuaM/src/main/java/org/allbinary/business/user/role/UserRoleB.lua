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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local UserFactoryInterface = require("org.allbinary.business.user.UserFactoryInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local UserRole = require("org.allbinary.business.user.role.UserRole")

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

local UserRoleB = {}
UserRoleB.__index = UserRoleB
UserRoleB.className = "UserRoleB"
setmetatable(UserRoleB, {__index = UserRole})


function UserRoleB.new(aBasicUserRole, aUserFactoryInterface)
    local self = setmetatable(UserRole.new(aBasicUserRole, aUserFactoryInterface), UserRoleB)
        -- super(...) made self above
        UserRoleB.roleVector:add(self)
    return self
end


-- throws Exception
function UserRoleB.getRole(role)
        UserRoleFactory.getInstance()
        if not StringValidationUtil.getInstance():isEmpty(role) then
            local roleVector = UserRoleB.getAll()
            local size = roleVector:size()
            for index = 0, size - 1 do
                local userRole = roleVector:get(index)
                if ((role < tostring(userRole) and -1) or (role > tostring(userRole) and 1) or 0) == 0 then
                    return userRole
                end
            end
        end
        error(java_exception("Exception", "Unable to get role - Unknown Role = " .. role), 0)
end


function UserRoleB.getAll()
        UserRoleFactory.getInstance()
        return UserRoleB.roleVector
end

UserRoleB.roleVector = BasicArrayListD.new()

return UserRoleB

