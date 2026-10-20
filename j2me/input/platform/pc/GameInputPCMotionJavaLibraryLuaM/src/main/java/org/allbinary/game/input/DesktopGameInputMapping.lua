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
local PCGameInputMapping = require("org.allbinary.game.input.PCGameInputMapping")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DesktopGameInputMapping = {}
DesktopGameInputMapping.__index = DesktopGameInputMapping
DesktopGameInputMapping.className = "DesktopGameInputMapping"
setmetatable(DesktopGameInputMapping, {__index = PCGameInputMapping})

function DesktopGameInputMapping.new()
    local self = setmetatable(PCGameInputMapping.new(), DesktopGameInputMapping)
    return self
end


function DesktopGameInputMapping:getDefault()
        return DesktopDefaultGameInputMapping.new():getInputMapping()
end

return DesktopGameInputMapping

