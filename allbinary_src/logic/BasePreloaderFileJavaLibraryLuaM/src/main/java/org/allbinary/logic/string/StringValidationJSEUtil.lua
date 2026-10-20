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
-- package org.allbinary.logic.string


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StringValidationJSEUtil = {}
StringValidationJSEUtil.__index = StringValidationJSEUtil
StringValidationJSEUtil.className = "StringValidationJSEUtil"


function StringValidationJSEUtil.new()
    local self = setmetatable({}, StringValidationJSEUtil)
    return self
end


function StringValidationJSEUtil.isBlank(string)
        local len = #string
        for i = 0, len - 1 do
            local c = string.sub(string, (i) + 1, (i) + 1)
            if (string.match(c, "^%s$") ~= nil) == false then
                return false
            end
        end
        return true
end

return StringValidationJSEUtil

