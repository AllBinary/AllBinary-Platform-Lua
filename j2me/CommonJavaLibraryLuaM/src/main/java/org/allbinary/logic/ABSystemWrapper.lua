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

local JsType = require("jsinterop.annotations.JsType")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ABSystemWrapper = {}
ABSystemWrapper.__index = ABSystemWrapper
ABSystemWrapper.className = "ABSystemWrapper"

function ABSystemWrapper.new()
    local self = setmetatable({}, ABSystemWrapper)
    return self
end


function ABSystemWrapper.getInstance()
        return ABSystemWrapper.instance
end


function ABSystemWrapper:arraycopy(src, srcPos, dest, destPos, length)
        table.move(src, (srcPos) + 1, (srcPos) + (length), (destPos) + 1, dest)
end


function ABSystemWrapper:currentTimeMillis()
        return math.floor(os.time() * 1000)
end

ABSystemWrapper.instance = ABSystemWrapper.new()

return ABSystemWrapper

