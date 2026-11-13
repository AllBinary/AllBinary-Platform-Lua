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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

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

local BasicUserRoles = {}
BasicUserRoles.__index = BasicUserRoles
BasicUserRoles.className = "BasicUserRoles"

function BasicUserRoles:_init_fields()
    self.roleVector = BasicArrayListD.new()
end

function BasicUserRoles.new()
    local self = setmetatable({}, BasicUserRoles)
    self:_init_fields()
    return self
end


function BasicUserRoles.getInstance()
        return BasicUserRoles.instance
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
        error(java_exception("Exception", "Unable to get role - Unknown Role"), 0)
end


function BasicUserRoles:getAll()
        return self.roleVector
end

BasicUserRoles.instance = BasicUserRoles.new()

return BasicUserRoles

