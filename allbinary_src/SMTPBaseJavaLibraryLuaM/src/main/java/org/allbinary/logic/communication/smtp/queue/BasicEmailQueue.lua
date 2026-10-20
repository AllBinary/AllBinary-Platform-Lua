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
-- package org.allbinary.logic.communication.smtp.queue

-- local Transport = require("javax.mail.Transport")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local EmailInterface = require("org.allbinary.logic.communication.smtp.EmailInterface")
local BasicQueue = require("org.allbinary.logic.util.queue.BasicQueue")
local EmailQueueInterface = require("org.allbinary.logic.communication.smtp.queue.EmailQueueInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicEmailQueue = {}
BasicEmailQueue.__index = BasicEmailQueue
BasicEmailQueue.className = "BasicEmailQueue"
setmetatable(BasicEmailQueue, {__index = BasicQueue})

function BasicEmailQueue:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function BasicEmailQueue.new()
    local self = setmetatable(BasicQueue.new(), BasicEmailQueue)
    self:_init_fields()
    return self
end


function BasicEmailQueue.getInstance()
        if BasicEmailQueue.basicEmailQueue == nil then
            BasicEmailQueue.basicEmailQueue = BasicEmailQueue.new()
        end
        return BasicEmailQueue.basicEmailQueue
end


-- throws Exception
function BasicEmailQueue:offer(emailInterface)
        self:offer(emailInterface)
        self:post(emailInterface)
        return true
end


function BasicEmailQueue:remove(emailInterface)
        self:remove(emailInterface)
end


-- Java overloaded method: Lua keeps the last definition
function BasicEmailQueue:remove()
        return nil
end


-- throws Exception
function BasicEmailQueue:post(emailInterface)
        if self:send(emailInterface) then
            self:remove(emailInterface)
            self:processAllUnsent()
        end
end


-- throws Exception
function BasicEmailQueue:processAllUnsent()
        local size = self.queueVector:size()
        for index = 0, size - 1 do
            local emailInterface = self.queueVector:get(index)
            if self:send(emailInterface) then
                self:remove(emailInterface)
                self:processAllUnsent()
            end
        end
end


function BasicEmailQueue:send(emailInterface)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
                self.logUtil:putF("Sending: " .. tostring(emailInterface:log()), self, "send")
            end
            Transport.send(emailInterface:getMimeMessage())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
                self.logUtil:putF("Email Send Debug: " .. tostring(emailInterface:getDebugInfo()), self, "send")
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
                self.logUtil:put("Failed Email Send Debug: " .. tostring(emailInterface:getDebugInfo()), self, "send", e)
            end
            return false
        end
end

BasicEmailQueue.instance = BasicEmailQueue.new()
BasicEmailQueue.basicEmailQueue = nil

return BasicEmailQueue

