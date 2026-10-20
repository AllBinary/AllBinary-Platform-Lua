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
-- package org.allbinary.logic.communication.smtp.event.modules.event.user

local UserInterface = require("org.allbinary.business.user.UserInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BasicEmail = require("org.allbinary.logic.communication.smtp.BasicEmail")
local EmailInterface = require("org.allbinary.logic.communication.smtp.EmailInterface")
local EmailEvent = require("org.allbinary.logic.communication.smtp.event.EmailEvent")
local UserEmailEventListenerInterface = require("org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface")
local EmailQueueFactory = require("org.allbinary.logic.communication.smtp.queue.EmailQueueFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UserEmailEventListenerModule = {}
UserEmailEventListenerModule.__index = UserEmailEventListenerModule
UserEmailEventListenerModule.className = "UserEmailEventListenerModule"

function UserEmailEventListenerModule:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.userInterface = nil
end


function UserEmailEventListenerModule.new(userInterface)
    local self = setmetatable({}, UserEmailEventListenerModule)
    self:_init_fields()
        self.userInterface = userInterface
    return self
end


-- throws Exception
function UserEmailEventListenerModule:onEmailSendFailure(emailEvent)
        local to = self.userInterface:getSecondaryEmail()
        local email = BasicEmail.new(emailEvent:getEmailInfo(), to)
        EmailQueueFactory.getInstance():offer(email:getEmail())
end


-- throws Exception
function UserEmailEventListenerModule:onEmailSendRequest(emailEvent)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            self.logUtil:putF("Add Email To Que For Sending: " .. tostring(emailEvent), self, "onEmailSendRequest")
        end
        local to = self.userInterface:getMainEmail()
        local email = BasicEmail.new(emailEvent:getEmailInfo(), to)
        EmailQueueFactory.getInstance():offer(email:getEmail())
end

return UserEmailEventListenerModule

