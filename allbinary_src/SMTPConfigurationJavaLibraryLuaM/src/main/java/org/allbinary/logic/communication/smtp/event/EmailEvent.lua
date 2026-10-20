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
-- package org.allbinary.logic.communication.smtp.event

-- local EventObject = require("java.util.EventObject")
local EmailInfo = require("org.allbinary.logic.communication.smtp.info.EmailInfo")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local EmailEvent = {}
EmailEvent.__index = EmailEvent
EmailEvent.className = "EmailEvent"
setmetatable(EmailEvent, {__index = EventObject})

function EmailEvent:_init_fields()
    self.emailInfo = nil
    self.userEmailEventNameData = nil
    self.attempts = 0
end


function EmailEvent.new(emailEventHandler, userEmailEventNameData, emailInfo, attempts)
    local self = setmetatable(EventObject.new(emailEventHandler), EmailEvent)
    self:_init_fields()
        -- super(...) made self above
        self.userEmailEventNameData = userEmailEventNameData
        self.emailInfo = emailInfo
    return self
end


function EmailEvent:getEmailInfo()
        return self.emailInfo
end


function EmailEvent:getAttempts()
        return self.attempts
end


function EmailEvent:setAttempts(attempts)
        self.attempts = attempts
end


function EmailEvent:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("EmailEvent Log: \n")
        stringBuffer:append("Event Name: ")
        stringBuffer:append(tostring(self.userEmailEventNameData))
        stringBuffer:append(tostring(self:getEmailInfo()))
        stringBuffer:append("\nNumber of Attempts: ")
        stringBuffer:appendint(self:getAttempts())
        return tostring(stringBuffer)
end
EmailEvent.__tostring = function(self) return self:toString() end

return EmailEvent

