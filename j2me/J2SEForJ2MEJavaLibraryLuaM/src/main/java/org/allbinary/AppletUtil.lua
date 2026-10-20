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

--import org.allbinary.logic.communication.log.PreLogUtil;
local AppletUtil = {}
AppletUtil.__index = AppletUtil
AppletUtil.className = "AppletUtil"


function AppletUtil.new()
    local self = setmetatable({}, AppletUtil)
    return self
end


function AppletUtil.setApplet()
        AppletUtil.applet = true
end


function AppletUtil.isAppletLoader(anyType)
        return AppletUtil.applet
end

AppletUtil.applet = false

return AppletUtil

