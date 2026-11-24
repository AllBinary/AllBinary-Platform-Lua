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

local NewUserFactory = {}
package.loaded["org.allbinary.business.user.NewUserFactory"] = NewUserFactory

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
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local User = java_lazy("org.allbinary.business.user.modules.User")
local UserRoleData = java_lazy("org.allbinary.business.user.role.UserRoleData")
local RequestParams = java_lazy("org.allbinary.logic.communication.http.request.RequestParams")
local TransformInfoHttpInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")

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

-- class table NewUserFactory is declared before the requires
NewUserFactory.__index = NewUserFactory
NewUserFactory.className = "NewUserFactory"
NewUserFactory.javaClassName = "org.allbinary.business.user.NewUserFactory"


function NewUserFactory._jinit(self)
    return self
end

function NewUserFactory.new(...)
    local self = setmetatable({}, NewUserFactory)
    NewUserFactory._jinit(self, ...)
    return self
end


-- throws Exception
function NewUserFactory.getInstance_j0()
        return User.new()
end


-- throws Exception
function NewUserFactory.getInstance_j1(transformInfoInterface)
        local httpTransformInfoInterface = transformInfoInterface
        local httpServletRequest = httpTransformInfoInterface:getPageContext():getRequest()
        local hashMap = RequestParams.new(httpServletRequest):toHashMap()
        local role = httpTransformInfoInterface:getPropertiesHashMap():get(tostring(UserRoleData.NAME))
        hashMap:put(tostring(UserRoleData.NAME), role)
        return CreateUserFactory.getInstance(hashMap)
end


-- throws Exception
function NewUserFactory.getInstance_j2(httpServletRequest, propertiesHashMap)
        if propertiesHashMap ~= nil then
            local requestHashMap = RequestParams.new(httpServletRequest):toHashMap()
            local roleString = propertiesHashMap:get(tostring(UserRoleData.NAME))
            requestHashMap:put(tostring(UserRoleData.NAME), roleString)
            return CreateUserFactory.getInstance(requestHashMap)
        else
            error(require("java.lang.Exception").new("Null HashMap"), 0)
        end
end
function NewUserFactory.getInstance(...)
    local count = select("#", ...)
    if count == 0 then return NewUserFactory.getInstance_j0(...) end
    if count == 1 then return NewUserFactory.getInstance_j1(...) end
    if count == 2 then return NewUserFactory.getInstance_j2(...) end
    error("No method getInstance takes " .. count .. " arguments")
end
NewUserFactory.getInstance__jdispatcher = NewUserFactory.getInstance

return NewUserFactory

