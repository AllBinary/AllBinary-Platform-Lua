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
-- package org.allbinary.business.user.password

local Password = {}
package.loaded["org.allbinary.business.user.password.Password"] = Password

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
local Random = java_lazy("java.util.Random")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local SuperCrypt = java_lazy("org.allbinary.logic.control.crypt.SuperCrypt")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table Password is declared before the requires
Password.__index = Password
Password.className = "Password"
Password.javaClassName = "org.allbinary.business.user.password.Password"

function Password:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.password == nil then self.password = nil end
end


function Password._jinit(self, password)
    Password._init_fields(self)
        self.password = password
    return self
end

function Password.new(...)
    local self = setmetatable({}, Password)
    Password._jinit(self, ...)
    return self
end


function Password:set(value)
        self.password = value
end


function Password:get()
        return self.password
end


function Password:isValid()
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            local valid = true
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VALIDATION) then
                self.logUtil:putF(require("allbinary_java").to_string("Password: ") .. require("allbinary_java").to_string(self.password), self, commonStrings.IS_VALID)
            end
            if not (StringValidationUtil.getInstance():isValidRequired(self.password, 6, UserData.MAXLEN)) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VALIDATION) then
                    self.logUtil:putF("Password is invalid", self, commonStrings.IS_VALID)
                end
                valid = false
            end
            do return "__jreturn", valid end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VALIDATIONERROR) then
                self.logUtil:put("Failed to validate form", "Password", commonStrings.IS_VALID, e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function Password:getValidationInfo()
        if not (StringValidationUtil.getInstance():isValidRequired(self.password, 6, UserData.MAXLEN)) then
            return "Please enter a Password with more than 6 characters.<br />"
        end
        local stringUtil = StringUtil.getInstance()
        return stringUtil.EMPTY_STRING
end


function Password:toVector(secret)
        self.password = StringUtil.getInstance():getNonNull(self.password)
        local random = Random.new():nextInt(SuperCrypt.KEYMAX)
        local vector = BasicArrayListD.new()
        vector:add(tostring(random))
        vector:add(secret)
        vector:add(SuperCrypt.new(random):encrypt(self.password))
        return vector
end


function Password:toHashMap(secret)
        self.password = StringUtil.getInstance():getNonNull(self.password)
        local values = StdUtil.getInstance():createHashMap()
        local random = Random.new():nextInt(SuperCrypt.KEYMAX)
        values:put(EntryData.getInstance().ENCRYPTION, tostring(random))
        values:put(UserData.SECRET, secret)
        values:put(UserData.PASSWORD, SuperCrypt.new(random):encrypt(self.password))
        return values
end

return Password

