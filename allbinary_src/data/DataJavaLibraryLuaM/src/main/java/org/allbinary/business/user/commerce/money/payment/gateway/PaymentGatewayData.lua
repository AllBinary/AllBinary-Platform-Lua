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
-- package org.allbinary.business.user.commerce.money.payment.gateway


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentGatewayData = {}
PaymentGatewayData.__index = PaymentGatewayData
PaymentGatewayData.className = "PaymentGatewayData"

function PaymentGatewayData:_init_fields()
    self.key = nil
end


function PaymentGatewayData.new(value)
    local self = setmetatable({}, PaymentGatewayData)
    self:_init_fields()
        self.key = value
    return self
end


function PaymentGatewayData:toString()
        return self.key
end
PaymentGatewayData.__tostring = function(self) return self:toString() end

PaymentGatewayData.CRYPTNUM = 5
PaymentGatewayData.ID = PaymentGatewayData.new("PAYMENTGATEWAY_ID")
PaymentGatewayData.NAME = PaymentGatewayData.new("PAYMENTGATEWAY_NAME")
PaymentGatewayData.VALUE = PaymentGatewayData.new("PAYMENTGATEWAY_VALUE")
PaymentGatewayData.PAYMENTTRANSACTIONINTERFACEFACTORYINTERFACE = PaymentGatewayData.new("PAYMENTGATEWAY_PAYMENTTRANSACTIONINTERFACEFACTORYINTERFACE")
PaymentGatewayData.PAYMENTPROCESSORINTERFACEFACTORYINTERFACE = PaymentGatewayData.new("PAYMENTGATEWAY_PAYMENTPROCESSORINTERFACEFACTORYINTERFACE")
PaymentGatewayData.MODE = PaymentGatewayData.new("MODE")
PaymentGatewayData.SERVERPROTOCOL = PaymentGatewayData.new("SERVERPROTOCOL")
PaymentGatewayData.SERVER = PaymentGatewayData.new("SERVER")
PaymentGatewayData.SERVERPORT = PaymentGatewayData.new("SERVERPORT")
PaymentGatewayData.SERVERPATH = PaymentGatewayData.new("SERVERPATH")
PaymentGatewayData.TESTPROTOCOL = PaymentGatewayData.new("TESTSERVERPROTOCOL")
PaymentGatewayData.TESTSERVER = PaymentGatewayData.new("TESTSERVER")
PaymentGatewayData.TESTPORT = PaymentGatewayData.new("TESTPORT")
PaymentGatewayData.TESTPATH = PaymentGatewayData.new("TESTSERVERPATH")
PaymentGatewayData.TIMEOUT = PaymentGatewayData.new("TIMEOUT")
PaymentGatewayData.PROXYPROTOCOL = PaymentGatewayData.new("PROXYPROTOCOL")
PaymentGatewayData.PROXYSERVER = PaymentGatewayData.new("PROXYSERVER")
PaymentGatewayData.PROXYPATH = PaymentGatewayData.new("PROXYPATH")
PaymentGatewayData.PROXYUSERNAME = PaymentGatewayData.new("PROXYUSERNAME")
PaymentGatewayData.PROXYPASSWORD = PaymentGatewayData.new("PROXYPASSWORD")
PaymentGatewayData.PROXYPORT = PaymentGatewayData.new("PROXYPORT")
PaymentGatewayData.PROXYTIMEOUT = PaymentGatewayData.new("PROXYTIMEOUT")
PaymentGatewayData.SPECIAL1 = PaymentGatewayData.new("SPECIAL1")
PaymentGatewayData.SPECIAL2 = PaymentGatewayData.new("SPECIAL2")
PaymentGatewayData.SPECIAL3 = PaymentGatewayData.new("SPECIAL3")
PaymentGatewayData.SPECIAL4 = PaymentGatewayData.new("SPECIAL4")
PaymentGatewayData.SPECIAL5 = PaymentGatewayData.new("SPECIAL5")
PaymentGatewayData.SPECIAL6 = PaymentGatewayData.new("SPECIAL6")
PaymentGatewayData.SPECIAL7 = PaymentGatewayData.new("SPECIAL7")
PaymentGatewayData.SPECIAL8 = PaymentGatewayData.new("SPECIAL8")
PaymentGatewayData.SPECIAL9 = PaymentGatewayData.new("SPECIAL9")

return PaymentGatewayData

