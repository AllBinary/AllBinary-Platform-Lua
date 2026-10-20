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
-- package org.allbinary.graphics.canvas.transition.progress

local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")
local NullUtil = require("org.allbinary.logic.NullUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ProgressCanvasFactory = {}
ProgressCanvasFactory.__index = ProgressCanvasFactory
ProgressCanvasFactory.className = "ProgressCanvasFactory"

function ProgressCanvasFactory.new()
    local self = setmetatable({}, ProgressCanvasFactory)
    return self
end


function ProgressCanvasFactory.getInstance()
        if ProgressCanvasFactory.PROGRESS_FORM_SCREEN == NullUtil.getInstance().NULL_OBJECT then
            ProgressCanvasFactory.PROGRESS_FORM_SCREEN = ProgressCanvas.new(StringUtil.getInstance().EMPTY_STRING, BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE)
        end
        return ProgressCanvasFactory.PROGRESS_FORM_SCREEN
end


function ProgressCanvasFactory.getLazyInstance()
        return NullPaintable.getInstance()
end

ProgressCanvasFactory.PROGRESS_FORM_SCREEN = NullUtil.getInstance().NULL_OBJECT

return ProgressCanvasFactory

