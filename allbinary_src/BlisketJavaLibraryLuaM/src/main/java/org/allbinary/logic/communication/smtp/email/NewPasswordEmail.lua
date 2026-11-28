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
-- package org.allbinary.logic.communication.smtp.email

local NewPasswordEmail = {}
package.loaded["org.allbinary.logic.communication.smtp.email.NewPasswordEmail"] = NewPasswordEmail

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

local UserInterface = java_lazy("org.allbinary.business.user.UserInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local UserEmailEventNameData = java_lazy("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
local UserEmailEventHandler = java_lazy("org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler")
local AdminUserEmailEventHandlerSingletons = java_lazy("org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons")
local UserEmailEventHandlerSingletons = java_lazy("org.allbinary.logic.communication.smtp.event.handler.factory.UserEmailEventHandlerSingletons")
local AdminEmailInfo = java_lazy("org.allbinary.logic.communication.smtp.info.AdminEmailInfo")
local BasicEmailInfo = java_lazy("org.allbinary.logic.communication.smtp.info.BasicEmailInfo")
local EmailInfo = java_lazy("org.allbinary.logic.communication.smtp.info.EmailInfo")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
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

-- class table NewPasswordEmail is declared before the requires
NewPasswordEmail.__index = NewPasswordEmail
NewPasswordEmail.className = "NewPasswordEmail"
NewPasswordEmail.javaClassName = "org.allbinary.logic.communication.smtp.email.NewPasswordEmail"

function NewPasswordEmail:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.abeClientInformation == nil then self.abeClientInformation = nil end
    if self.userInterface == nil then self.userInterface = nil end
    if self.newPassword_f == nil then self.newPassword_f = nil end
end


function NewPasswordEmail._jinit(self, abeClientInformation, userInterface, newPassword)
    NewPasswordEmail._init_fields(self)
        self.abeClientInformation = abeClientInformation
        self.userInterface = userInterface
        self.newPassword_f = newPassword
    return self
end

function NewPasswordEmail.new(...)
    local self = setmetatable({}, NewPasswordEmail)
    NewPasswordEmail._jinit(self, ...)
    return self
end


-- throws Exception
function NewPasswordEmail:process()
        self:notifyStoreAdmin()
        self:notifyUser()
end


-- throws Exception
function NewPasswordEmail:notifyStoreAdmin()
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
                self.logUtil:putF("notifyStoreAdmin", self, "notifyStoreAdmin")
            end
            local emailSubject = require("allbinary_java").to_string("New Password For User: ") .. require("allbinary_java").to_string(self.userInterface:getUserName())
            local emailBody = require("allbinary_java").to_string("New Password: ") .. require("allbinary_java").to_string(self.newPassword_f)
            local basicEmailInfo = AdminEmailInfo.new(emailSubject, emailBody)
            local emailInfo = EmailInfo.new(basicEmailInfo)
            local adminUserEmailEventHandler = AdminUserEmailEventHandlerSingletons.getInstance():getInstance(self.abeClientInformation, UserEmailEventNameData.NEWPASSWORD)
            adminUserEmailEventHandler:receiveEmailInfo(UserEmailEventNameData.NEWPASSWORD, emailInfo)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "emailAdmin", e)
            end
        end
end


-- throws Exception
function NewPasswordEmail:notifyUser()
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
                self.logUtil:putF("Email User", self, "notifyUser()")
            end
            local subject = "New Password"
            local body = require("allbinary_java").to_string("New Password: ") .. require("allbinary_java").to_string(self.newPassword_f)
            local basicEmailInfo = AdminEmailInfo.new(subject, body)
            local emailInfo = EmailInfo.new(basicEmailInfo)
            local userEmailEventHandler = UserEmailEventHandlerSingletons.getInstance():getInstance(self.abeClientInformation, UserEmailEventNameData.NEWPASSWORD, self.userInterface)
            userEmailEventHandler:receiveEmailInfo(UserEmailEventNameData.NEWPASSWORD, emailInfo)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "notifyUser", e)
            end
            error(e, 0)
        end
end

return NewPasswordEmail

