-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2002 AllBinary 
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
-- package org.allbinary.data.tables.generator

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

local IdGeneratorEntityFactory = {}
IdGeneratorEntityFactory.__index = IdGeneratorEntityFactory
IdGeneratorEntityFactory.className = "IdGeneratorEntityFactory"


function IdGeneratorEntityFactory.new()
    local self = setmetatable({}, IdGeneratorEntityFactory)
    return self
end


function IdGeneratorEntityFactory.getInstance()
        local try_ok, try_error = pcall(function()
            return IdGeneratorEntity.new()
        end)
        if not try_ok then
            local e = try_error
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            logUtil:put(commonStrings.EXCEPTION, "ServerLicenseRequestEntityFactory", commonStrings.GET_INSTANCE, e)
            return nil
        end
end

return IdGeneratorEntityFactory

