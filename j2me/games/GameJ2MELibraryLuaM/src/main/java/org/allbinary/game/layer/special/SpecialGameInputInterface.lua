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
-- package org.allbinary.game.layer.special

local GameKeyEvent = require("org.allbinary.game.input.event.GameKeyEvent")
local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local SpecialGameInputInterface = {}
SpecialGameInputInterface.__index = SpecialGameInputInterface
SpecialGameInputInterface.className = "SpecialGameInputInterface"
setmetatable(SpecialGameInputInterface, {__index = PaintableInterface})


-- throws Exception
function SpecialGameInputInterface:up()
    error("abstract method up")
end


-- throws Exception
function SpecialGameInputInterface:down()
    error("abstract method down")
end


-- throws Exception
function SpecialGameInputInterface:right()
    error("abstract method right")
end


-- throws Exception
function SpecialGameInputInterface:left()
    error("abstract method left")
end


-- throws Exception
function SpecialGameInputInterface:strafeLeft()
    error("abstract method strafeLeft")
end


-- throws Exception
function SpecialGameInputInterface:strafeRight()
    error("abstract method strafeRight")
end


-- throws Exception
function SpecialGameInputInterface:fire(layerManager, gameKeyEvent)
    error("abstract method fire")
end


-- throws Exception
function SpecialGameInputInterface:special1(layerManager, gameKeyEvent)
    error("abstract method special1")
end


-- throws Exception
function SpecialGameInputInterface:special2(layerManager, gameKeyEvent)
    error("abstract method special2")
end


-- throws Exception
function SpecialGameInputInterface:special3(layerManager, gameKeyEvent)
    error("abstract method special3")
end


-- throws Exception
function SpecialGameInputInterface:special4(layerManager, gameKeyEvent)
    error("abstract method special4")
end


-- throws Exception
function SpecialGameInputInterface:special5(layerManager, gameKeyEvent)
    error("abstract method special5")
end

return SpecialGameInputInterface

