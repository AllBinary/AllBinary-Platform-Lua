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

local ProgressCanvas = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local PaintableComposite = require("org.allbinary.graphics.paint.PaintableComposite")
local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DemoCanvasProgressUtil = {}
DemoCanvasProgressUtil.__index = DemoCanvasProgressUtil
DemoCanvasProgressUtil.className = "DemoCanvasProgressUtil"

function DemoCanvasProgressUtil.new()
    local self = setmetatable({}, DemoCanvasProgressUtil)
    return self
end


function DemoCanvasProgressUtil.showProgress(demoCanvas)
        DemoCanvasProgressUtil.showProgressOptionallyInTheBackground(demoCanvas, false)
end


function DemoCanvasProgressUtil.showProgressOptionallyInTheBackground(demoCanvas, background)
        local progressCanvas = ProgressCanvasFactory.getInstance()
        progressCanvas:startBackground(background)
        local paintableArray = java_new_array(nil, 2)
        paintableArray[1] = progressCanvas
        paintableArray[2] = demoCanvas:getDefaultPaintableInterface()
        demoCanvas:setDefaultPaintableInterface(PaintableComposite.new(paintableArray))
        demoCanvas:setPaintableInterface(demoCanvas:getDefaultPaintableInterface())
end

return DemoCanvasProgressUtil

