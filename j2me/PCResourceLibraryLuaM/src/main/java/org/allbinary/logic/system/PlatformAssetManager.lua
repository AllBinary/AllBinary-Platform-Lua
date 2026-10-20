-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.logic.system

-- local InputStream = require("java.io.InputStream")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PlatformAssetManager = {}
PlatformAssetManager.__index = PlatformAssetManager
PlatformAssetManager.className = "PlatformAssetManager"

function PlatformAssetManager.new()
    local self = setmetatable({}, PlatformAssetManager)
    return self
end


function PlatformAssetManager.getInstance()
        return PlatformAssetManager.instance
end


-- throws Exception
function PlatformAssetManager:getResourceAsStream(resource)
        local resourceUtil = ResourceUtil.getInstance()
        local inputStream = resourceUtil:getResourceAsStream(resource)
        return inputStream
end

PlatformAssetManager.instance = PlatformAssetManager.new()

return PlatformAssetManager

