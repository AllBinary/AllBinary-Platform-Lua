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
-- package org.allbinary.math

local JsType = require("jsinterop.annotations.JsType")
local JsMethod = require("jsinterop.annotations.JsMethod")
local JsConstructor = require("jsinterop.annotations.JsConstructor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Angle = {}
Angle.__index = Angle
Angle.className = "Angle"

function Angle:_init_fields()
    self.value = nil
end


function Angle.new(angle)
    local self = setmetatable({}, Angle)
    self:_init_fields()
        self.value = angle
    return self
end


function Angle:getValue()
        return self.value
end

return Angle

