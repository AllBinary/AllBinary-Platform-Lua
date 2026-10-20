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
-- package org.allbinary.game.layer

-- local GL = require("javax.microedition.khronos.opengles.GL")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local BasicColorSetUtil = require("org.allbinary.graphics.color.BasicColorSetUtil")
local NullPaintable = require("org.allbinary.graphics.paint.NullPaintable")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local OpenGLSurfaceChangedInterface = require("org.allbinary.image.opengles.OpenGLSurfaceChangedInterface")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")
local ViewPositionEvent = require("org.allbinary.view.event.ViewPositionEvent")
local ViewPositionEventListenerInterface = require("org.allbinary.view.event.ViewPositionEventListenerInterface")

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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryGameLayer = {}
AllBinaryGameLayer.__index = AllBinaryGameLayer
AllBinaryGameLayer.className = "AllBinaryGameLayer"
setmetatable(AllBinaryGameLayer, {__index = AllBinaryLayer})

function AllBinaryGameLayer:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.basicSetColorUtil = BasicColorSetUtil.getInstance()
    self.RED = BasicColorFactory.getInstance().RED
    self.paintable = (function() if SWTUtil.isSWT then return (function()
        local o = Paintable.new and Paintable.new() or setmetatable({}, {__index = Paintable})
        self.basicSetColorUtil = BasicColorSetUtil.getInstance()
        self.BLACK = BasicColorFactory.getInstance().BLACK
        

        function o:paint(graphics)
            self.basicSetColorUtil:setBasicColorP(graphics, self.BLACK)
        end
        return o
    end)() else return NullPaintable.getInstance() end end)()
    self.gameKeyEventList = BasicArrayListD.new()
end


function AllBinaryGameLayer.new(name, layerInfo, viewPosition)
    local self = setmetatable(AllBinaryLayer.new(name, layerInfo, viewPosition), AllBinaryGameLayer)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function AllBinaryGameLayer:set(gl)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


function AllBinaryGameLayer:move()
end


function AllBinaryGameLayer:getGameKeyEventList()
        return self.gameKeyEventList
end


-- throws Exception
function AllBinaryGameLayer:processInput(allBinaryLayerManager)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function AllBinaryGameLayer:processTick(allBinaryLayerManager)
        error(java_exception("Exception", self.commonStrings.NOT_IMPLEMENTED), 0)
end


function AllBinaryGameLayer:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


-- throws Exception
function AllBinaryGameLayer:onViewPositionChangeEvent()
        self:onChangeEvent(self.viewPositionEvent)
end


-- throws Exception
function AllBinaryGameLayer:onChangeEvent(layerManagerEvent)
        if GameLayerUtil.isOnScreen(self) then
            self:setVisible(true)
        else
            self:setVisible(false)
        end
end


function AllBinaryGameLayer:paintFirst(graphics)
        self.paintable:paint(graphics)
end


function AllBinaryGameLayer:paintDebug(graphics)
        local viewPosition = self:getViewPosition()
        local viewX = viewPosition:getX()
        local viewY = viewPosition:getY()
        self.basicSetColorUtil:setBasicColorP(graphics, self.RED)
        graphics:drawRect(viewX, viewY, self:getWidth(), self:getHeight())
end


function AllBinaryGameLayer:setWidth(width)
        AllBinaryLayer.setLayerWidth(self, width)
        self:setHalfWidth(((width) // (1 << (1))))
end


function AllBinaryGameLayer:setHeight(height)
        AllBinaryLayer.setLayerHeight(self, height)
        self:setHalfHeight(((height) // (1 << (1))))
end

return AllBinaryGameLayer

