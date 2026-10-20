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
-- package org.allbinary.business.user.commerce.money.payment.gateway.transaction


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentTransactionKeysFactory = {}
PaymentTransactionKeysFactory.__index = PaymentTransactionKeysFactory
PaymentTransactionKeysFactory.className = "PaymentTransactionKeysFactory"

function PaymentTransactionKeysFactory:_init_fields()
    self.TRXTYPE = PaymentTransactionKeys.new("TRXTYPE")
    self.TENDER = PaymentTransactionKeys.new("TENDER")
    self.ACCT = PaymentTransactionKeys.new("ACCT")
    self.EXPDATE = PaymentTransactionKeys.new("EXPDATE")
    self.AMT = PaymentTransactionKeys.new("AMT")
    self.AUTHCODE = PaymentTransactionKeys.new("AUTHCODE")
    self.MICR = PaymentTransactionKeys.new("MICR")
    self.CHECKNUM = PaymentTransactionKeys.new("CHECKNUM")
    self.NAME = PaymentTransactionKeys.new("NAME")
    self.STREET = PaymentTransactionKeys.new("STREET")
    self.CITY = PaymentTransactionKeys.new("CITY")
    self.STATE = PaymentTransactionKeys.new("STATE")
    self.ZIP = PaymentTransactionKeys.new("ZIP")
    self.DL = PaymentTransactionKeys.new("DL")
    self.EMAIL = PaymentTransactionKeys.new("EMAIL")
    self.COMMENT1 = PaymentTransactionKeys.new("COMMENT1")
    self.COMMENT2 = PaymentTransactionKeys.new("COMMENT2")
    self.ORIGID = PaymentTransactionKeys.new("ORIGID")
    self.PONUM = PaymentTransactionKeys.new("PONUM")
    self.DESC = PaymentTransactionKeys.new("PaymentTransactionDESC")
    self.DESC1TO4 = PaymentTransactionKeys.new("DESC1TO4")
    self.INVNUM = PaymentTransactionKeys.new("INVNUM")
    self.SHIPTOZIP = PaymentTransactionKeys.new("SHIPTOZIP")
    self.SWIPE = PaymentTransactionKeys.new("SWIPE")
    self.TAXAMT = PaymentTransactionKeys.new("TAXAMT")
    self.COMMCARD = PaymentTransactionKeys.new("COMMCARD")
    self.DUTYAMT = PaymentTransactionKeys.new("DUTYAMT")
    self.FRIEGHTAMT = PaymentTransactionKeys.new("FRIEGHTAMT")
    self.ORDERDATE = PaymentTransactionKeys.new("ORDERDATE")
    self.TAXEXEMPT = PaymentTransactionKeys.new("TAXEXEMPT")
    self.COUNTRYCODE = PaymentTransactionKeys.new("COUNTRYCODE")
    self.CUSTCODE = PaymentTransactionKeys.new("CUSTCODE")
    self.CVV2 = PaymentTransactionKeys.new("CVV2")
    self.ABA = PaymentTransactionKeys.new("ABA")
    self.ACCTTYPE = PaymentTransactionKeys.new("ACCTTYPE")
    self.DISCOUNT = PaymentTransactionKeys.new("DISCOUNT")
    self.FIRSTNAME = PaymentTransactionKeys.new("FIRSTNAME")
    self.LASTNAME = PaymentTransactionKeys.new("LASNAME")
    self.SHIPFROMZIP = PaymentTransactionKeys.new("SHIPFROMZIP")
    self.PRENOTE = PaymentTransactionKeys.new("PRENOTE")
    self.CHKTYPE = PaymentTransactionKeys.new("CHKTYPE")
    self.DOB = PaymentTransactionKeys.new("DOB")
    self.PHONENUM = PaymentTransactionKeys.new("PHONENUM")
    self.SS = PaymentTransactionKeys.new("SS")
    self.COMPANYNAME = PaymentTransactionKeys.new("COMPANYNAME")
    self.COUNTRY = PaymentTransactionKeys.new("COUNTRY")
    self.FREIGHTAMT = PaymentTransactionKeys.new("FREIGHTAMT")
    self.SHIPTOCITY = PaymentTransactionKeys.new("SHIPTOCITY")
    self.SHIPTOFIRSTNAME = PaymentTransactionKeys.new("SHIPTOFIRSTNAME")
    self.SHIPTOLASTNAME = PaymentTransactionKeys.new("SHIPTOLASTNAME")
    self.SHIPTOSTATE = PaymentTransactionKeys.new("SHIPTOSTATE")
    self.SHIPTOSTREET = PaymentTransactionKeys.new("SHIPTOSTREET")
    self.SPECIAL1 = PaymentTransactionKeys.new("SPECIAL1")
    self.SPECIAL2 = PaymentTransactionKeys.new("SPECIAL2")
    self.SPECIAL3 = PaymentTransactionKeys.new("SPECIAL3")
    self.PARTNER = PaymentTransactionKeys.new("PARTNER")
    self.VENDOR = PaymentTransactionKeys.new("VENDOR")
    self.USER = PaymentTransactionKeys.new("USER")
    self.PWD = PaymentTransactionKeys.new("PWD")
    self.CHKNUM = PaymentTransactionKeys.new("CHKNUM")
    self.AVSADDR = PaymentTransactionKeys.new("AVSADDR")
    self.AVSZIP = PaymentTransactionKeys.new("AVSZIP")
    self.PNREF = PaymentTransactionKeys.new("PNREF")
    self.RESPMSG = PaymentTransactionKeys.new("RESPMSG")
    self.RESULT = PaymentTransactionKeys.new("RESULT")
    self.ORIGRESULT = PaymentTransactionKeys.new("ORIGRESULT")
    self.STATUS = PaymentTransactionKeys.new("STATUS")
    self.FRAUDCODE = PaymentTransactionKeys.new("FRAUDCODE")
    self.FRAUDMSG = PaymentTransactionKeys.new("FRAUDMSG")
    self.ERRCODE = PaymentTransactionKeys.new("ERRCODE")
    self.SCORE = PaymentTransactionKeys.new("SCORE")
    self.REASON1 = PaymentTransactionKeys.new("REASON1")
    self.REASON2 = PaymentTransactionKeys.new("REASON2")
    self.REASON3 = PaymentTransactionKeys.new("REASON3")
    self.EXCEPTION1 = PaymentTransactionKeys.new("EXCEPTION1")
    self.EXCEPTION2 = PaymentTransactionKeys.new("EXCEPTION2")
    self.EXCEPTION3 = PaymentTransactionKeys.new("EXCEPTION3")
    self.EXCEPTION4 = PaymentTransactionKeys.new("EXCEPTION4")
    self.EXCEPTION5 = PaymentTransactionKeys.new("EXCEPTION5")
    self.EXCEPTION6 = PaymentTransactionKeys.new("EXCEPTION6")
    self.EXCEPTION7 = PaymentTransactionKeys.new("EXCEPTION7")
end

function PaymentTransactionKeysFactory.new()
    local self = setmetatable({}, PaymentTransactionKeysFactory)
    self:_init_fields()
    return self
end


function PaymentTransactionKeysFactory.getInstance()
        return PaymentTransactionKeysFactory.instance
end

PaymentTransactionKeysFactory.instance = PaymentTransactionKeysFactory.new()

return PaymentTransactionKeysFactory

