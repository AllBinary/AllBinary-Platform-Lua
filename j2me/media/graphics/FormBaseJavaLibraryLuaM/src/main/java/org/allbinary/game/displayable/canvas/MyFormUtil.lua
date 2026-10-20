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

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Features = require("org.allbinary.game.configuration.feature.Features")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local RectangleFactory = require("org.allbinary.graphics.RectangleFactory")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local SWTJOGLProcessor = require("org.allbinary.graphics.threed.SWTJOGLProcessor")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MyFormUtil = {}
MyFormUtil.__index = MyFormUtil
MyFormUtil.className = "MyFormUtil"

function MyFormUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.popupMenuRectangle = RectangleFactory.SINGLETON
end

function MyFormUtil.new()
    local self = setmetatable({}, MyFormUtil)
    self:_init_fields()
    return self
end


function MyFormUtil.getInstance()
        return MyFormUtil.instance
end


function MyFormUtil:updateMeasurement(graphics)
        local font = graphics:getFont()
        local displayInfo = DisplayInfoSingleton.getInstance()
        local features = Features.getInstance()
        local isOpenGL = features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL)
        local TOTAL_CHAR_WIDTH = (function() if SWTJOGLProcessor.getInstance():isJOGL() and isOpenGL then return 2 else return 3 end end)()
        local width = MyFontProcessor.defaultStringWidth(font, TOTAL_CHAR_WIDTH)
        local pointFactory = PointFactory.getInstance()
        if displayInfo:getLastHeight() < 320 then
            self.popupMenuRectangle = Rectangle.new(pointFactory:createXY(0, 25), width, (font:getHeight() * 4) + 2)
        else
            self.popupMenuRectangle = Rectangle.new(pointFactory:createXY(0, displayInfo:getLastHalfHeight() - 70), width, (font:getHeight() * 5))
        end
end


function MyFormUtil:getPopupMenuRectangle()
        return self.popupMenuRectangle
end

MyFormUtil.instance = MyFormUtil.new()

return MyFormUtil

