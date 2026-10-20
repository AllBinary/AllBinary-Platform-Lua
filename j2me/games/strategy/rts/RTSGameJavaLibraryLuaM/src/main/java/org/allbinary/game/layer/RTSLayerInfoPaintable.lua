-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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
-- package org.allbinary.game.layer

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local InitUpdatePaintable = require("org.allbinary.graphics.paint.InitUpdatePaintable")
local NullInitUpdatePaintable = require("org.allbinary.graphics.paint.NullInitUpdatePaintable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RTSLayerInfoPaintable = {}
RTSLayerInfoPaintable.__index = RTSLayerInfoPaintable
RTSLayerInfoPaintable.className = "RTSLayerInfoPaintable"
setmetatable(RTSLayerInfoPaintable, {__index = InitUpdatePaintable})

function RTSLayerInfoPaintable:_init_fields()
    self.initUpdatePaintable = NullInitUpdatePaintable.getInstance()
end


function RTSLayerInfoPaintable.new()
    local self = setmetatable(InitUpdatePaintable.new(), RTSLayerInfoPaintable)
    self:_init_fields()
    return self
end


function RTSLayerInfoPaintable:update()
        self.initUpdatePaintable:update()
end


function RTSLayerInfoPaintable:paint(graphics)
        self.initUpdatePaintable:paint(graphics)
end


function RTSLayerInfoPaintable:updateRTSLayerInfoInit(hudPaintable)
        self.initUpdatePaintable = hudPaintable
end


function RTSLayerInfoPaintable:updateRTSLayerInfoSelection(hudPaintable)
        hudPaintable:updateSelectionInfo()
        self.initUpdatePaintable = hudPaintable
end

return RTSLayerInfoPaintable

