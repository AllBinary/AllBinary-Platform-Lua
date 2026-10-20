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
-- package org.allbinary.logic.java.anyType

local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ParamsUtil = {}
ParamsUtil.__index = ParamsUtil
ParamsUtil.className = "ParamsUtil"


function ParamsUtil.new()
    local self = setmetatable({}, ParamsUtil)
    return self
end


function ParamsUtil.viewParams(params)
        if params ~= nil then
            local stringBuffer = StringMaker.new()
            for index = 0, (params.n or #params) - 1 do
                stringBuffer:append(" ")
                stringBuffer:append(params[index + 1]:getName())
            end
            return tostring(stringBuffer)
        else
            return "Params Null"
        end
end

return ParamsUtil

