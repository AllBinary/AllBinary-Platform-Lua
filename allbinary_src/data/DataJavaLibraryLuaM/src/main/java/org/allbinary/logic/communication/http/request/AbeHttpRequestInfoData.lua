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
-- package org.allbinary.logic.communication.http.request


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbeHttpRequestInfoData = {}
AbeHttpRequestInfoData.__index = AbeHttpRequestInfoData
AbeHttpRequestInfoData.className = "AbeHttpRequestInfoData"

function AbeHttpRequestInfoData:_init_fields()
    self.HTTP_USER_AGENT = "HTTP_USER_AGENT"
    self.REMOTE_ADDRESS = "REMOTE_ADDRESS"
    self.REMOTE_HOST = "REMOTE_HOST"
    self.REMOTE_HOST_BY_ADDRESS = "REMOTE_HOST_BY_ADDRESS"
    self.REMOTE_PORT = "REMOTE_PORT"
    self.REQUEST_FILE_PATH = "REQUEST_FILE_PATH"
end


function AbeHttpRequestInfoData.getInstance()
        return AbeHttpRequestInfoData.instance
end


function AbeHttpRequestInfoData.new()
    local self = setmetatable({}, AbeHttpRequestInfoData)
    self:_init_fields()
    return self
end

AbeHttpRequestInfoData.instance = AbeHttpRequestInfoData.new()

return AbeHttpRequestInfoData

