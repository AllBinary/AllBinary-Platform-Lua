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
-- package org.allbinary.business.user.modules.customer.subscriber

-- local HashMap = require("java.util.HashMap")
local User = require("org.allbinary.business.user.modules.User")
local Subscription = require("org.allbinary.business.user.subscription.Subscription")
local WeblisketSessionInterface = require("org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SubscriberUser = {}
SubscriberUser.__index = SubscriberUser
SubscriberUser.className = "SubscriberUser"
setmetatable(SubscriberUser, {__index = User})

function SubscriberUser:_init_fields()
    self.subscription = nil
end

function SubscriberUser.new(...)
    local count = select("#", ...)
    if count == 0 then return SubscriberUser._new0(...)
    elseif count == 1 then return SubscriberUser._new1(...)
    end
end


function SubscriberUser._new0()
    local self = setmetatable(User.new(), SubscriberUser)
    self:_init_fields()
        -- super(...) made self above
        self.subscription = Subscription.new()
    return self
end


function SubscriberUser._new1(userHashMap)
    local self = setmetatable(User.new(userHashMap), SubscriberUser)
    self:_init_fields()
        -- super(...) made self above
        self.subscription = Subscription.new()
    return self
end


function SubscriberUser:validateSession(weblisketSession)
        User.validateSession(self, weblisketSession)
        self:updateSession(weblisketSession)
end


function SubscriberUser:updateSession(weblisketSession)
        weblisketSession:setStoreName(self:getPermissions())
end


function SubscriberUser:isSessionValid()
        return self.subscription:isSubscribed()
end

return SubscriberUser

