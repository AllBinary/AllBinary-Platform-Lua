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

local InputToGameKeyMapping = require("org.allbinary.game.input.mapping.InputToGameKeyMapping")
local J2MEGameInputMapping = require("org.allbinary.game.input.J2MEGameInputMapping")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NormalJ2MEGameInputMapping = {}
NormalJ2MEGameInputMapping.__index = NormalJ2MEGameInputMapping
NormalJ2MEGameInputMapping.className = "NormalJ2MEGameInputMapping"
setmetatable(NormalJ2MEGameInputMapping, {__index = J2MEGameInputMapping})

function NormalJ2MEGameInputMapping.new()
    local self = setmetatable(J2MEGameInputMapping.new(), NormalJ2MEGameInputMapping)
    return self
end


function NormalJ2MEGameInputMapping:getDefault()
        return NormalJ2MEDefaultGameInputMapping.new():getInputMapping()
end

return NormalJ2MEGameInputMapping

