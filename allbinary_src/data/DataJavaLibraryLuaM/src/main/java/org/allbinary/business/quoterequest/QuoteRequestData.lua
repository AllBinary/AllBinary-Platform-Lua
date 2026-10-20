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
-- package org.allbinary.business.quoterequest


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local QuoteRequestData = {}
QuoteRequestData.__index = QuoteRequestData
QuoteRequestData.className = "QuoteRequestData"

function QuoteRequestData:_init_fields()
    self.ID = "QUOTEREQUEST_ID"
    self.PROJECT_INFO = "QUOTEREQUEST_PROJECT_INFO"
    self.CUSTOMER_COMMENTS = "QUOTEREQUEST_CUSTOMER_COMMENTS"
    self.BUDGET = "QUOTEREQUEST_BUDGET"
    self.TIMEFRAME = "QUOTEREQUEST_TIMEFRAME"
    self.COMMENTS = "QUOTEREQUEST_COMMENTS"
end


function QuoteRequestData.getInstance()
        return QuoteRequestData.instance
end


function QuoteRequestData.new()
    local self = setmetatable({}, QuoteRequestData)
    self:_init_fields()
    return self
end

QuoteRequestData.instance = QuoteRequestData.new()

return QuoteRequestData

