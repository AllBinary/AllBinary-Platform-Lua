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
-- package org.allbinary.layer

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Layer = require("org.allbinary.layer.Layer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullLayer = {}
NullLayer.__index = NullLayer
NullLayer.className = "NullLayer"
setmetatable(NullLayer, {__index = Layer})


function NullLayer.getInstance()
        return NullLayer.instance
end


function NullLayer.new()
    local self = setmetatable(Layer.new(0, 0), NullLayer)
        -- super(...) made self above
    return self
end


function NullLayer:paint(graphics)
end

NullLayer.instance = NullLayer.new()

return NullLayer

