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

function PlatformKeyFactory:_init_fields()
    self.androidKeyFactory = ActivityFractureControllerUtilFactory.getInstance()
end

function PlatformKeyFactory.new()
    local self = setmetatable({}, PlatformKeyFactory)
    self:_init_fields()
    return self
end


function PlatformKeyFactory.getInstance()
        if PlatformKeyFactory.instance == NullUtil.getInstance().NULL_OBJECT then
            PlatformKeyFactory.instance = PlatformKeyFactory.new()
        end
        return PlatformKeyFactory.instance
end


function PlatformKeyFactory:getString(keyCode)
        return AndroidGameKey.getString(keyCode)
end


function PlatformKeyFactory:isSubmission(input)
        return self.androidKeyFactory:isSubmission(input)
end


function PlatformKeyFactory:isDelete(input)
        return self.androidKeyFactory:isDelete(input)
end


function PlatformKeyFactory:isBackSpace(input)
        return self.androidKeyFactory:isBackSpace(input)
end


function PlatformKeyFactory:isLeft(input)
        return self.androidKeyFactory:isLeft(input)
end


function PlatformKeyFactory:isRight(input)
        return self.androidKeyFactory:isRight(input)
end


function PlatformKeyFactory:isUp(input)
        return self.androidKeyFactory:isUp(input)
end


function PlatformKeyFactory:isDown(input)
        return self.androidKeyFactory:isDown(input)
end


function PlatformKeyFactory:isEnter(input)
        return self.androidKeyFactory:isEnter(input)
end

PlatformKeyFactory.instance = NullUtil.getInstance().NULL_OBJECT

return PlatformKeyFactory

