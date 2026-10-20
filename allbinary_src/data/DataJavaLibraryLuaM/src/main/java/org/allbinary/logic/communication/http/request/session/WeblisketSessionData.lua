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
-- package org.allbinary.logic.communication.http.request.session


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WeblisketSessionData = {}
WeblisketSessionData.__index = WeblisketSessionData
WeblisketSessionData.className = "WeblisketSessionData"


function WeblisketSessionData.new()
    local self = setmetatable({}, WeblisketSessionData)
    return self
end

WeblisketSessionData.INVALIDATESESSION = "SESSION_INVALIDATE_SESSION"
WeblisketSessionData.ATTEMPTS = "SESSION_ATTEMPTS"
WeblisketSessionData.TIMEOUT = "SESSION_TIMEOUT"
WeblisketSessionData.REMOVABLEUSERNAME = "SESSION_REMOVABLE_USER_NAME"
WeblisketSessionData.REMOVABLEPASSWORD = "SESSION_REMOVABLE_PASSWORD"
WeblisketSessionData.REMOVABLENEWPASSWORD = "SESSION_REMOVABLE_NEW_PASSWORD"
WeblisketSessionData.REMOVABLEREENTERNEWPASSWORD = "SESSION_REMOVABLE_REENTER_NEW_PASSWORD"
WeblisketSessionData.AUTHENTICATED = "SESSION_AUTHENTICATED"

return WeblisketSessionData

