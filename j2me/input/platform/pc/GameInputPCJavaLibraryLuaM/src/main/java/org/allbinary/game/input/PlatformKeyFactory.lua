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
-- package org.allbinary.game.input

local NullUtil = require("org.allbinary.logic.NullUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PlatformKeyFactory = {}
PlatformKeyFactory.__index = PlatformKeyFactory
PlatformKeyFactory.className = "PlatformKeyFactory"

function PlatformKeyFactory.new()
    local self = setmetatable({}, PlatformKeyFactory)
    return self
end


function PlatformKeyFactory.getInstance()
        if PlatformKeyFactory.instance == NullUtil.getInstance().NULL_OBJECT then
            PlatformKeyFactory.instance = PlatformKeyFactory.new()
        end
        return PlatformKeyFactory.instance
end


function PlatformKeyFactory:getString(keyCode)
        return PCGameKey.getString(keyCode)
end


function PlatformKeyFactory:isSubmission(input)
        return PCKeyFactory.getInstance():isSubmission(input)
end


function PlatformKeyFactory:isDelete(input)
        return PCKeyFactory.getInstance():isDelete(input)
end


function PlatformKeyFactory:isBackSpace(input)
        return PCKeyFactory.getInstance():isBackSpace(input)
end


function PlatformKeyFactory:isUp(input)
        return PCKeyFactory.getInstance():isUp(input)
end


function PlatformKeyFactory:isDown(input)
        return PCKeyFactory.getInstance():isDown(input)
end


function PlatformKeyFactory:isEnter(input)
        return PCKeyFactory.getInstance():isEnter(input)
end


function PlatformKeyFactory:isLeft(input)
        return PCKeyFactory.getInstance():isLeft(input)
end


function PlatformKeyFactory:isRight(input)
        return PCKeyFactory.getInstance():isRight(input)
end

PlatformKeyFactory.instance = NullUtil.getInstance().NULL_OBJECT

return PlatformKeyFactory

