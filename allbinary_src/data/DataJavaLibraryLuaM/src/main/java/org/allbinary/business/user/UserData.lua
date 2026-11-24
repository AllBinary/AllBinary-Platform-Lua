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

local UserData = {}
package.loaded["org.allbinary.business.user.UserData"] = UserData

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

-- class table UserData is declared before the requires
UserData.__index = UserData
UserData.className = "UserData"
UserData.javaClassName = "org.allbinary.business.user.UserData"


function UserData._jinit(self)
    return self
end

function UserData.new(...)
    local self = setmetatable({}, UserData)
    UserData._jinit(self, ...)
    return self
end

UserData.MAXLEN = 250
UserData.NAME = "USER_NAME"
UserData.USERNAME = "CUSTOMER_USER_NAME"
UserData.PASSWORD = "CUSTOMER_PASSWORD"
UserData.PREFIXNAME = "CUSTOMER_PREFIX_NAME"
UserData.FIRSTNAME = "CUSTOMER_FIRST_NAME"
UserData.LASTNAME = "CUSTOMER_LAST_NAME"
UserData.MIDDLENAME = "CUSTOMER_MIDDLE_NAME"
UserData.SUFFIXNAME = "CUSTOMER_SUFFIX_NAME"
UserData.COMPANY = "CUSTOMER_COMPANY"
UserData.POSITIONATCOMPANY = "CUSTOMER_POSITION_AT_COMPANY"
UserData.MAINEMAIL = "CUSTOMER_MAIN_EMAIL"
UserData.SECONDARYEMAIL = "CUSTOMER_SECONDARY_EMAIL"
UserData.HOMEPHONE = "CUSTOMER_HOME_PHONE"
UserData.CELLPHONE = "CUSTOMER_CELL_PHONE"
UserData.WORKPHONE = "CUSTOMER_WORK_PHONE"
UserData.OTHERCONTACT = "CUSTOMER_OTHER_CONTACT"
UserData.ELECTRONICDEVICE = "CUSTOMER_ELECTRONIC_DEVICE"
UserData.FAX = "CUSTOMER_FAX"
UserData.SECRET = "CUSTOMER_SECRET"
UserData.PERMISSIONS = "CUSTOMER_PERMISSIONS"
UserData.CONFIGURATION = "CUSTOMER_CONFIGURATION"

return UserData

