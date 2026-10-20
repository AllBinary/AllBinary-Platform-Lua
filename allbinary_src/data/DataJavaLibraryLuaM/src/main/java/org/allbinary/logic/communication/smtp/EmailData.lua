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
-- package org.allbinary.logic.communication.smtp


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local EmailData = {}
EmailData.__index = EmailData
EmailData.className = "EmailData"


function EmailData.new()
    local self = setmetatable({}, EmailData)
    return self
end

EmailData.SERVER = "EMAIL_SERVER"
EmailData.NAME = "EMAIL_NAME"
EmailData.FROM = "EMAIL_FROM"
EmailData.TO = "EMAIL_TO"
EmailData.CC = "EMAIL_CC"
EmailData.BCC = "EMAIL_BCC"
EmailData.SUBJECT = "EMAIL_SUBJECT"
EmailData.CONTENT = "EMAIL_CONTENT"

return EmailData

