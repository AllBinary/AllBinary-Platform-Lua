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

local Layer = {}
package.loaded["org.allbinary.layer.Layer"] = Layer

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local CanvasStrings = java_lazy("org.allbinary.graphics.displayable.CanvasStrings")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table Layer is declared before the requires
Layer.__index = Layer
Layer.className = "Layer"
Layer.javaClassName = "org.allbinary.layer.Layer"

function Layer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.x == nil then self.x = 0 end
    if self.y == nil then self.y = 0 end
    self.z = 3
    if self.width == nil then self.width = 0 end
    if self.height == nil then self.height = 0 end
    self.visible = true
end


function Layer._jinit(self, width, height)
    Layer._init_fields(self)
        self:setLayerWidth(width)
        self:setLayerHeight(height)
    return self
end

function Layer.new(...)
    local self = setmetatable({}, Layer)
    Layer._jinit(self, ...)
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
            error(require("java.lang.IllegalArgumentException").new(), 0)
        end
        self.width = width
end


function Layer:setLayerHeight(height)
        if height < 0 then
            error(require("java.lang.IllegalArgumentException").new(), 0)
        end
        self.height = height
end


function Layer:toStringAppend(stringBuffer)
end

Layer.ID = SmallIntegerSingletonFactory.getInstance():getAt(0)

return Layer

