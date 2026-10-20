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
-- package org.allbinary.game.displayable.canvas

local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local DisplayableInterface = require("org.allbinary.graphics.displayable.DisplayableInterface")

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
local AllBinaryGameCanvasInterface = {}
AllBinaryGameCanvasInterface.__index = AllBinaryGameCanvasInterface
AllBinaryGameCanvasInterface.className = "AllBinaryGameCanvasInterface"
setmetatable(AllBinaryGameCanvasInterface, {__index = DisplayableInterface})


function AllBinaryGameCanvasInterface:getLayerManager()
    error("abstract method getLayerManager")
end

return AllBinaryGameCanvasInterface

