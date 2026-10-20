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
-- package org.allbinary.business.user.commerce.money.payment

-- local ServletRequest = require("javax.servlet.ServletRequest")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

local PaymentFactory = {}
PaymentFactory.__index = PaymentFactory
PaymentFactory.className = "PaymentFactory"


function PaymentFactory.new()
    local self = setmetatable({}, PaymentFactory)
    return self
end


function PaymentFactory.getInstance(request)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error = pcall(function()
            return Payment.new(request)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().FACTORYERROR) then
                logUtil:put(commonStrings.EXCEPTION, "PaymentFactory", commonStrings.GET_INSTANCE, e)
            end
            return nil
        end
end

return PaymentFactory

