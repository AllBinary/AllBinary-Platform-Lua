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
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local User = require("org.allbinary.business.user.modules.User")
local UserRoleData = require("org.allbinary.business.user.role.UserRoleData")
local RequestParams = require("org.allbinary.logic.communication.http.request.RequestParams")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")

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

local NewUserFactory = {}
NewUserFactory.__index = NewUserFactory
NewUserFactory.className = "NewUserFactory"


function NewUserFactory.new()
    local self = setmetatable({}, NewUserFactory)
    return self
end


-- throws Exception
function NewUserFactory.getInstance()
        return User.new()
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function NewUserFactory.getInstance(transformInfoInterface)
        local httpTransformInfoInterface = transformInfoInterface
        local httpServletRequest = httpTransformInfoInterface:getPageContext():getRequest()
        local hashMap = RequestParams.new(httpServletRequest):toHashMap()
        local role = httpTransformInfoInterface:getPropertiesHashMap():get(tostring(UserRoleData.NAME))
        hashMap:put(tostring(UserRoleData.NAME), role)
        return CreateUserFactory.getInstance(hashMap)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function NewUserFactory.getInstance(httpServletRequest, propertiesHashMap)
        if propertiesHashMap ~= nil then
            local requestHashMap = RequestParams.new(httpServletRequest):toHashMap()
            local roleString = propertiesHashMap:get(tostring(UserRoleData.NAME))
            requestHashMap:put(tostring(UserRoleData.NAME), roleString)
            return CreateUserFactory.getInstance(requestHashMap)
        else
            error(java_exception("Exception", "Null HashMap"), 0)
        end
end

return NewUserFactory

