-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2026 AllBinary 
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
-- package org.allbinary.logic

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PropertyInitUtil = {}
PropertyInitUtil.__index = PropertyInitUtil
PropertyInitUtil.className = "PropertyInitUtil"

function PropertyInitUtil.new()
    local self = setmetatable({}, PropertyInitUtil)
    return self
end


function PropertyInitUtil.getInstance(value)
        local commonStrings = CommonStrings.getInstance()
        local logUtil = LogUtil.getInstance()
        logUtil:putF(tostring(StringMaker.new():append("PropertyInitUtil: "):appendint(value)), logUtil, commonStrings.CONSTRUCTOR)
        return PropertyInitUtil.instance
end

PropertyInitUtil.instance = PropertyInitUtil.new()

return PropertyInitUtil

