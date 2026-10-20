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

local RequestData = {}
RequestData.__index = RequestData
RequestData.className = "RequestData"


function RequestData.new()
    local self = setmetatable({}, RequestData)
    return self
end

RequestData.REQUEST = "REQUESTDATA_REQUEST"
RequestData.PARAMETER = "REQUESTDATA_PARAMETER"
RequestData.VIEWS = "REQUESTDATA_VIEWS"
RequestData.VISITORS = "REQUESTDATA_VISITORS"

return RequestData

