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
-- package org.allbinary.layer

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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

local Layer = {}
Layer.__index = Layer
Layer.className = "Layer"

function Layer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.x = 0
    self.y = 0
    self.z = 3
    self.width = 0
    self.height = 0
    self.visible = true
end


function Layer.new(width, height)
    local self = setmetatable({}, Layer)
    self:_init_fields()
        self:setLayerWidth(width)
        self:setLayerHeight(height)
    return self
end


function Layer:setPosition(x, y, z)
        self.x = x
        self.y = y
        self.z = z
end


function Layer:moveDXY(dx, dy)
        self.x = self.x + (dx)
        self.y = self.y + (dy)
end


function Layer:moveDXYZ(dx, dy, dz)
        self.x = self.x + (dx)
        self.y = self.y + (dy)
        self.z = self.z + (dz)
end


function Layer:getXP()
        return self.x
end


function Layer:getYP()
        return self.y
end


function Layer:getZP()
        return self.z
end


function Layer:getWidth()
        return self.width
end


function Layer:getHeight()
        return self.height
end


function Layer:getDepth()
        return 0
end


function Layer:setVisible(visible)
        self.visible = visible
end


function Layer:isVisible()
        return self.visible
end


function Layer:paint(graphics)
        local commonStrings = CommonStrings.getInstance()
        local canvasStrings = CanvasStrings.getInstance()
        self.logUtil:putF(commonStrings.NOT_IMPLEMENTED, self, canvasStrings.PAINT)
end


function Layer:setLayerWidth(width)
        if width < 0 then
            error(java_exception("IllegalArgumentException"), 0)
        end
        self.width = width
end


function Layer:setLayerHeight(height)
        if height < 0 then
            error(java_exception("IllegalArgumentException"), 0)
        end
        self.height = height
end


function Layer:toStringAppend(stringBuffer)
end

Layer.ID = SmallIntegerSingletonFactory.getInstance():getAt(0)

return Layer

