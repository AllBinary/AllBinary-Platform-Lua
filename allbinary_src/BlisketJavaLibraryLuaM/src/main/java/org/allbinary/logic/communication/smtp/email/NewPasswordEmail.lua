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

local UserInterface = require("org.allbinary.business.user.UserInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local UserEmailEventNameData = require("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
local UserEmailEventHandler = require("org.allbinary.logic.communication.smtp.event.handler.UserEmailEventHandler")
local AdminUserEmailEventHandlerSingletons = require("org.allbinary.logic.communication.smtp.event.handler.factory.AdminUserEmailEventHandlerSingletons")
local UserEmailEventHandlerSingletons = require("org.allbinary.logic.communication.smtp.event.handler.factory.UserEmailEventHandlerSingletons")
local AdminEmailInfo = require("org.allbinary.logic.communication.smtp.info.AdminEmailInfo")
local BasicEmailInfo = require("org.allbinary.logic.communication.smtp.info.BasicEmailInfo")
local EmailInfo = require("org.allbinary.logic.communication.smtp.info.EmailInfo")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NewPasswordEmail = {}
NewPasswordEmail.__index = NewPasswordEmail
NewPasswordEmail.className = "NewPasswordEmail"

function NewPasswordEmail:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.abeClientInformation = nil
    self.userInterface = nil
    self.newPassword = nil
end


function NewPasswordEmail.new(abeClientInformation, userInterface, newPassword)
    local self = setmetatable({}, NewPasswordEmail)
    self:_init_fields()
        self.abeClientInformation = abeClientInformation
        self.userInterface = userInterface
        self.newPassword = newPassword
    return self
end


-- throws Exception
function NewPasswordEmail:process()
        self:notifyStoreAdmin()
        self:notifyUser()
end


-- throws Exception
function NewPasswordEmail:notifyStoreAdmin()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
                self.logUtil:putF("notifyStoreAdmin", self, "notifyStoreAdmin")
            end
            local emailSubject = "New Password For User: " .. tostring(self.userInterface:getUserName())
            local emailBody = "New Password: " .. self.newPassword
            local basicEmailInfo = AdminEmailInfo.new(emailSubject, emailBody)
            local emailInfo = EmailInfo.new(basicEmailInfo)
            local adminUserEmailEventHandler = AdminUserEmailEventHandlerSingletons.getInstance():getInstance(self.abeClientInformation, UserEmailEventNameData.NEWPASSWORD)
            adminUserEmailEventHandler:receiveEmailInfo(UserEmailEventNameData.NEWPASSWORD, emailInfo)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "emailAdmin", e)
            end
        end
end


-- throws Exception
function NewPasswordEmail:notifyUser()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
                self.logUtil:putF("Email User", self, "notifyUser()")
            end
            local subject = "New Password"
            local body = "New Password: " .. self.newPassword
            local basicEmailInfo = AdminEmailInfo.new(subject, body)
            local emailInfo = EmailInfo.new(basicEmailInfo)
            local userEmailEventHandler = UserEmailEventHandlerSingletons.getInstance():getInstance(self.abeClientInformation, UserEmailEventNameData.NEWPASSWORD, self.userInterface)
            userEmailEventHandler:receiveEmailInfo(UserEmailEventNameData.NEWPASSWORD, emailInfo)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "notifyUser", e)
            end
            error(e, 0)
        end
end

return NewPasswordEmail

