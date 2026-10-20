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
-- package org.allbinary.business.user.modules.customer.affiliate

-- local HashMap = require("java.util.HashMap")
local AffiliateSales = require("org.allbinary.business.advertisement.affiliate.sales.AffiliateSales")
local User = require("org.allbinary.business.user.modules.User")
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

local AffiliateUser = {}
AffiliateUser.__index = AffiliateUser
AffiliateUser.className = "AffiliateUser"
setmetatable(AffiliateUser, {__index = User})

function AffiliateUser:_init_fields()
    self.affiliateSales = nil
end

function AffiliateUser.new(...)
    local count = select("#", ...)
    if count == 0 then return AffiliateUser._new0(...)
    elseif count == 1 then return AffiliateUser._new1(...)
    end
end


function AffiliateUser._new0()
    local self = setmetatable(User.new(), AffiliateUser)
    self:_init_fields()
        -- super(...) made self above
        self.affiliateSales = AffiliateSales.new()
    return self
end


function AffiliateUser._new1(userHashMap)
    local self = setmetatable(User.new(userHashMap), AffiliateUser)
    self:_init_fields()
        -- super(...) made self above
        self.affiliateSales = AffiliateSales.new()
    return self
end


function AffiliateUser:validateSession(weblisketSession)
        User.validateSession(self, weblisketSession)
        self:updateSession(weblisketSession)
end


function AffiliateUser:updateSession(weblisketSession)
        weblisketSession:setStoreName(self:getPermissions())
end


function AffiliateUser:isSessionValid()
        return self.affiliateSales:isValid()
end

return AffiliateUser

