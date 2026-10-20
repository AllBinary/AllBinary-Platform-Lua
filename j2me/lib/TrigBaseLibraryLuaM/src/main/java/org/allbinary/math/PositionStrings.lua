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
local JsProperty = require("jsinterop.annotations.JsProperty")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PositionStrings = {}
PositionStrings.__index = PositionStrings
PositionStrings.className = "PositionStrings"

function PositionStrings:_init_fields()
    self.X = "x"
    self.Y = "y"
    self.X_LABEL = "x: "
    self.Y_LABEL = "y: "
    self.Z_LABEL = "z: "
    self.DX_LABEL = "dx: "
    self.DY_LABEL = "dy: "
    self.DZ_LABEL = "dz: "
end

function PositionStrings.new()
    local self = setmetatable({}, PositionStrings)
    self:_init_fields()
    return self
end


function PositionStrings.getInstance()
        return PositionStrings.instance
end

PositionStrings.instance = PositionStrings.new()

return PositionStrings

