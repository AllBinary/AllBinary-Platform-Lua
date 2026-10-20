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
-- package org.allbinary.logic.communication.smtp.event.modules.log

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local EmailEvent = require("org.allbinary.logic.communication.smtp.event.EmailEvent")
local UserEmailEventListenerInterface = require("org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LogUserEmailEventListenerModule = {}
LogUserEmailEventListenerModule.__index = LogUserEmailEventListenerModule
LogUserEmailEventListenerModule.className = "LogUserEmailEventListenerModule"

function LogUserEmailEventListenerModule:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function LogUserEmailEventListenerModule.new()
    local self = setmetatable({}, LogUserEmailEventListenerModule)
    self:_init_fields()
    return self
end


-- throws Exception
function LogUserEmailEventListenerModule:onEmailSendRequest(userEmailInfoEvent)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            local message = "Logging EmailEvent - Temporary Listener for debugging.\n\n" .. tostring(userEmailInfoEvent)
            self.logUtil:putF(message, self, "onEmailSendRequest")
        end
end

return LogUserEmailEventListenerModule

