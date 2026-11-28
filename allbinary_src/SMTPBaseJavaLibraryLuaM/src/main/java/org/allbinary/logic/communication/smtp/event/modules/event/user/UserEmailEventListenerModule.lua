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

local UserEmailEventListenerModule = {}
package.loaded["org.allbinary.logic.communication.smtp.event.modules.event.user.UserEmailEventListenerModule"] = UserEmailEventListenerModule

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
local BasicEmail = java_lazy("org.allbinary.logic.communication.smtp.BasicEmail")
local EmailInterface = java_lazy("org.allbinary.logic.communication.smtp.EmailInterface")
local EmailEvent = java_lazy("org.allbinary.logic.communication.smtp.event.EmailEvent")
local UserEmailEventListenerInterface = java_lazy("org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface")
local EmailQueueFactory = java_lazy("org.allbinary.logic.communication.smtp.queue.EmailQueueFactory")
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

-- class table UserEmailEventListenerModule is declared before the requires
UserEmailEventListenerModule.__index = UserEmailEventListenerModule
UserEmailEventListenerModule.className = "UserEmailEventListenerModule"
UserEmailEventListenerModule.javaClassName = "org.allbinary.logic.communication.smtp.event.modules.event.user.UserEmailEventListenerModule"
UserEmailEventListenerModule.java_implements = " UserEmailEventListenerInterface "
UserEmailEventListenerModule.java_interfaces = function() return {UserEmailEventListenerInterface} end

function UserEmailEventListenerModule:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.userInterface == nil then self.userInterface = nil end
end


function UserEmailEventListenerModule._jinit(self, userInterface)
    UserEmailEventListenerModule._init_fields(self)
        self.userInterface = userInterface
    return self
end

function UserEmailEventListenerModule.new(...)
    local self = setmetatable({}, UserEmailEventListenerModule)
    UserEmailEventListenerModule._jinit(self, ...)
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
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGING) then
            self.logUtil:putF(require("allbinary_java").to_string("Add Email To Que For Sending: ") .. require("allbinary_java").to_string(tostring(emailEvent)), self, "onEmailSendRequest")
        end
        local to = self.userInterface:getMainEmail()
        local email = BasicEmail.new(emailEvent:getEmailInfo(), to)
        EmailQueueFactory.getInstance():offer(email:getEmail())
end

return UserEmailEventListenerModule

