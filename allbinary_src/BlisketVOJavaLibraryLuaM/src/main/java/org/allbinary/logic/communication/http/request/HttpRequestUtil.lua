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

local AbPathData = require("org.allbinary.logic.io.path.AbPathData")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HttpRequestUtil = {}
HttpRequestUtil.__index = HttpRequestUtil
HttpRequestUtil.className = "HttpRequestUtil"


function HttpRequestUtil.getInstance()
        return HttpRequestUtil.instance
end


function HttpRequestUtil.new()
    local self = setmetatable({}, HttpRequestUtil)
    return self
end


function HttpRequestUtil:getLastSeparatorIndex(requestPath)
        local beginIndex = requestPath:lastIndexOf(AbPathData.getInstance().SEPARATOR)
        if beginIndex < 0 then
            beginIndex = requestPath:lastIndexOf("\\")
        end
        return beginIndex
end


-- throws Exception
function HttpRequestUtil:generateFileName(requestPath)
        local beginIndex = self:getLastSeparatorIndex(requestPath)
        if beginIndex < 0 then
            return requestPath
        else
            return string.sub(requestPath, (beginIndex + 1) + 1)
        end
end

HttpRequestUtil.instance = HttpRequestUtil.new()

return HttpRequestUtil

