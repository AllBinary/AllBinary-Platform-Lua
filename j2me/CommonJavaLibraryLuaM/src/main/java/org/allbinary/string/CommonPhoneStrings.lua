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
-- package org.allbinary.string

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

local CommonPhoneStrings = {}
CommonPhoneStrings.__index = CommonPhoneStrings
CommonPhoneStrings.className = "CommonPhoneStrings"

function CommonPhoneStrings:_init_fields()
    self.UP = "UP"
    self.DOWN = "DOWN"
    self.LEFT = "LEFT"
    self.RIGHT = "RIGHT"
    self.ZERO = "0"
    self.ONE = "1"
    self.TWO = "2"
    self.THREE = "3"
    self.FOUR = "4"
    self.FIVE = "5"
    self.SIX = "6"
    self.SEVEN = "7"
    self.EIGHT = "8"
    self.NINE = "9"
    self.POUND = "#"
    self.STAR = "*"
    self.FIRE = "FIRE"
end

function CommonPhoneStrings.new()
    local self = setmetatable({}, CommonPhoneStrings)
    self:_init_fields()
    return self
end


function CommonPhoneStrings.getInstance()
        return CommonPhoneStrings.instance
end

CommonPhoneStrings.instance = CommonPhoneStrings.new()

return CommonPhoneStrings

