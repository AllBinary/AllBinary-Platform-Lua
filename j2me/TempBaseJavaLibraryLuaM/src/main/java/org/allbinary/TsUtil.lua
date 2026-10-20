-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--TempBase
local TsUtil = {}
TsUtil.__index = TsUtil
TsUtil.className = "TsUtil"

function TsUtil.new()
    local self = setmetatable({}, TsUtil)
    return self
end


function TsUtil.getInstance()
        return TsUtil.instance
end


function TsUtil:hashCode(anyType)
        return anyType:hashCode()
end


-- throws InterruptedException
function TsUtil:waitFor(any, timeoutMillis)
        local anyType = any
        anyType:wait(timeoutMillis)
end

TsUtil.instance = TsUtil.new()

return TsUtil

