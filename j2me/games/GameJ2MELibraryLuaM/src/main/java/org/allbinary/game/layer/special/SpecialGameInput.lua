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
-- package org.allbinary.game.layer.special

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local SpecialGameInputInterface = require("org.allbinary.game.layer.special.SpecialGameInputInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SpecialGameInput = {}
SpecialGameInput.__index = SpecialGameInput
SpecialGameInput.className = "SpecialGameInput"

function SpecialGameInput.new()
    local self = setmetatable({}, SpecialGameInput)
    return self
end


-- throws Exception
function SpecialGameInput:up()
end


-- throws Exception
function SpecialGameInput:down()
end


-- throws Exception
function SpecialGameInput:right()
end


-- throws Exception
function SpecialGameInput:left()
end


-- throws Exception
function SpecialGameInput:strafeLeft()
end


-- throws Exception
function SpecialGameInput:strafeRight()
end


-- throws Exception
function SpecialGameInput:fire(layerManager, gameKeyEvent)
end


-- throws Exception
function SpecialGameInput:special1(layerManager, gameKeyEvent)
end


-- throws Exception
function SpecialGameInput:special2(layerManager, gameKeyEvent)
end


-- throws Exception
function SpecialGameInput:special3(layerManager, gameKeyEvent)
end


-- throws Exception
function SpecialGameInput:special4(layerManager, gameKeyEvent)
end


-- throws Exception
function SpecialGameInput:special5(layerManager, gameKeyEvent)
end


function SpecialGameInput:paint(graphics)
end


function SpecialGameInput:paintThreed(graphics)
end

return SpecialGameInput

