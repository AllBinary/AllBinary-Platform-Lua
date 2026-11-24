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
-- package org.allbinary.business.user.username

local UserName = {}
package.loaded["org.allbinary.business.user.username.UserName"] = UserName

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
local UserData = java_lazy("org.allbinary.business.user.UserData")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table UserName is declared before the requires
UserName.__index = UserName
UserName.className = "UserName"
UserName.javaClassName = "org.allbinary.business.user.username.UserName"

function UserName:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.userName == nil then self.userName = nil end
end

function UserName._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return UserName._new0(self, ...)
    elseif count == 1 then return UserName._new1(self, ...)
    end
    error("No constructor of UserName takes " .. count .. " arguments")
end

function UserName.new(...)
    local self = setmetatable({}, UserName)
    UserName._jinit(self, ...)
    return self
end


function UserName.getInstance()
        return UserName.instance_f
end


function UserName._new0(self)
    UserName._init_fields(self)
    return self
end


function UserName._new1(self, hashMap)
    UserName._init_fields(self)
        self.userName = hashMap:get(UserData.USERNAME)
    return self
end


function UserName:isValid_j0()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", self:isValid(self.userName) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to validate form", self, "isUserNameValid()", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function UserName:get()
        return self.userName
end


function UserName:isValid_j1(aUserName)
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            local booleanFactory = BooleanFactory.getInstance()
            local valid = booleanFactory.TRUE
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VALIDATION) then
                self.logUtil:putF("UserName: " .. aUserName, self, commonStrings.IS_VALID)
            end
            if not StringValidationUtil.getInstance():isValidRequired(aUserName, 5, UserData.MAXLEN) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VALIDATION) then
                    self.logUtil:putF("UserName is invalid", self, commonStrings.IS_VALID)
                end
                valid = booleanFactory.FALSE
            end
            do return "__jreturn", valid end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to validate form", self, commonStrings.IS_VALID, e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function UserName:isValid(...)
    local count = select("#", ...)
    if count == 0 then return self:isValid_j0(...) end
    if count == 1 then return self:isValid_j1(...) end
    error("No method isValid takes " .. count .. " arguments")
end
UserName.isValid__jdispatcher = UserName.isValid


function UserName.getValidationInfo(aUserName)
        if not StringValidationUtil.getInstance():isValidRequired(aUserName, 5, UserData.MAXLEN) then
            return "Please enter a User Name with more than 5 characters.<br/>"
        end
        return StringUtil.getInstance().EMPTY_STRING
end

UserName.instance_f = UserName.new()

return UserName

