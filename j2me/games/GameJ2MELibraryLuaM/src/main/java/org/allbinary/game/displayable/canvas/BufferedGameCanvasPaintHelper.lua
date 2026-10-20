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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
-- local NullCanvas = require("javax.microedition.lcdui.NullCanvas")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local Anchor = require("org.allbinary.graphics.Anchor")
local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")
local ProcessPaintable = require("org.allbinary.graphics.paint.ProcessPaintable")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

local BufferedGameCanvasPaintHelper = {}
BufferedGameCanvasPaintHelper.__index = BufferedGameCanvasPaintHelper
BufferedGameCanvasPaintHelper.className = "BufferedGameCanvasPaintHelper"
setmetatable(BufferedGameCanvasPaintHelper, {__index = ProcessPaintable})

function BufferedGameCanvasPaintHelper:_init_fields()
    self.gameCanvas = NullCanvas.NULL_CANVAS
    self.offScreenImage = java_new_array(nil, BufferedGameCanvasPaintHelper.MAX_IMAGES)
    self.previousImage = NullImage.NULL_IMAGE
    self.circularIndexUtil = CircularIndexUtil.createInstance(BufferedGameCanvasPaintHelper.MAX_IMAGES)
    self.drawCircularIndexUtil = CircularIndexUtil.createInstanceAt(BufferedGameCanvasPaintHelper.MAX_IMAGES - 1, BufferedGameCanvasPaintHelper.MAX_IMAGES)
    self.anchor = Anchor.TOP_LEFT
end


function BufferedGameCanvasPaintHelper.new(gameCanvas)
    local self = setmetatable(ProcessPaintable.new(), BufferedGameCanvasPaintHelper)
    self:_init_fields()
        error(java_exception("Exception", "No Longer Used"), 0)
    return self
end


function BufferedGameCanvasPaintHelper:process()
        local myCanvas = (self.gameCanvas)
        myCanvas:draw(self.offScreenImage[self.circularIndexUtil:getIndex() + 1]:getGraphics())
        self.circularIndexUtil:next()
        self.drawCircularIndexUtil:next()
end


function BufferedGameCanvasPaintHelper:paint(graphics)
        self.previousImage = self.offScreenImage[self.drawCircularIndexUtil:getIndex() + 1]
        graphics:drawImage(self.previousImage, 0, 0, self.anchor)
end

BufferedGameCanvasPaintHelper.MAX_IMAGES = 4

return BufferedGameCanvasPaintHelper

