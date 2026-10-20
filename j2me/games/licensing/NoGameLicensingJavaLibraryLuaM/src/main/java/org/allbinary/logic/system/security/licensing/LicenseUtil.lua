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
-- package org.allbinary.logic.system.security.licensing

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LicenseUtil = {}
LicenseUtil.__index = LicenseUtil
LicenseUtil.className = "LicenseUtil"

function LicenseUtil.new()
    local self = setmetatable({}, LicenseUtil)
    return self
end


function LicenseUtil.getInstance()
        return LicenseUtil.instance
end


function LicenseUtil:init()
end


function LicenseUtil:isRunning()
        return false
end


function LicenseUtil:setRunning(running)
end


function LicenseUtil:shouldWait(commandListener)
        return self:isRunning()
end

LicenseUtil.instance = LicenseUtil.new()

return LicenseUtil

