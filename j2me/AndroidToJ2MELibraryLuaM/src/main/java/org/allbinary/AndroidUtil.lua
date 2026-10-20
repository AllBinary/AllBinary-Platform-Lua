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

local Activity = require("android.app.Activity")
local Build = require("android.os.Build")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AndroidUtil = {}
AndroidUtil.__index = AndroidUtil
AndroidUtil.className = "AndroidUtil"

function AndroidUtil.new()
    local self = setmetatable({}, AndroidUtil)
    return self
end


function AndroidUtil.isMemoryRestrictive()
        if AndroidUtil.version < 30 then
            return true
        end
        return false
end


function AndroidUtil.isAndroid()
        return true
end

AndroidUtil.NULL_ACTIVITY = Activity.new()
AndroidUtil.version = math.tointeger(tonumber(Build.VERSION.SDK))

return AndroidUtil

