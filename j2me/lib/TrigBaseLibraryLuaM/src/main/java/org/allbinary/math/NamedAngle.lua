-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
local JsProperty = require("jsinterop.annotations.JsProperty")
local JsConstructor = require("jsinterop.annotations.JsConstructor")
local Angle = require("org.allbinary.math.Angle")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NamedAngle = {}
NamedAngle.__index = NamedAngle
NamedAngle.className = "NamedAngle"
setmetatable(NamedAngle, {__index = Angle})

function NamedAngle:_init_fields()
    self.name = nil
end


function NamedAngle.new(angle, name)
    local self = setmetatable(Angle.new(angle), NamedAngle)
    self:_init_fields()
        -- super(...) made self above
        self.name = name
    return self
end

return NamedAngle

