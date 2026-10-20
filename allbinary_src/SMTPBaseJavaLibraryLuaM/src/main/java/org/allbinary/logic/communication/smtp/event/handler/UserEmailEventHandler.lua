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
-- package org.allbinary.logic.communication.smtp.event.handler

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")
local EmailEvent = require("org.allbinary.logic.communication.smtp.event.EmailEvent")
local UserEmailEventListenerInterface = require("org.allbinary.logic.communication.smtp.event.UserEmailEventListenerInterface")
local UserEmailEventNameData = require("org.allbinary.logic.communication.smtp.event.UserEmailEventNameData")
local EmailInfo = require("org.allbinary.logic.communication.smtp.info.EmailInfo")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UserEmailEventHandler = {}
UserEmailEventHandler.__index = UserEmailEventHandler
UserEmailEventHandler.className = "UserEmailEventHandler"

function UserEmailEventHandler:_init_fields()
    self.emailVector = nil
    self.emailInfo = nil
    self.userEmailEventNameData = nil
end


function UserEmailEventHandler.new()
    local self = setmetatable({}, UserEmailEventHandler)
    self:_init_fields()
        self.emailVector = BasicArrayListD.new()
    return self
end


-- throws Exception
function UserEmailEventHandler:receiveEmailInfo(userEmailEventNameData, emailInfo)
        self.userEmailEventNameData = userEmailEventNameData
        self.emailInfo = emailInfo
        self:fireEmailEvent()
end


function UserEmailEventHandler:addListener(vector)
        local size = vector:size()
        for index = 0, size - 1 do
            local userEmailEventListenerInterface = vector:get(index)
            self:addListener(userEmailEventListenerInterface)
        end
end


-- Java overloaded method: Lua keeps the last definition
function UserEmailEventHandler:addListener(emailEventListenerInterface)
        self.emailVector:add(emailEventListenerInterface)
end


function UserEmailEventHandler:removeListener(emailEventListenerInterface)
        self.emailVector:remove(emailEventListenerInterface)
end


-- throws Exception
function UserEmailEventHandler:fireEmailEvent()
        local emailEvent = EmailEvent.new(self, self.userEmailEventNameData, self.emailInfo, 0)
        local size = self.emailVector:size()
        for index = 0, size - 1 do
            local emailEventListenerInterface = self.emailVector:get(index)
            emailEventListenerInterface:onEmailSendRequest(emailEvent)
        end
end

return UserEmailEventHandler

