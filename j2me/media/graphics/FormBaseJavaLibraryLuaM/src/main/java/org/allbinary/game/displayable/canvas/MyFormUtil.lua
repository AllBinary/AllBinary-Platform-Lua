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

local MyFormUtil = {}
package.loaded["org.allbinary.game.displayable.canvas.MyFormUtil"] = MyFormUtil

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

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local Rectangle = java_lazy("org.allbinary.graphics.Rectangle")
local RectangleFactory = java_lazy("org.allbinary.graphics.RectangleFactory")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = java_lazy("org.allbinary.graphics.font.MyFontProcessor")
local OpenGLFeatureFactory = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local SWTJOGLProcessor = java_lazy("org.allbinary.graphics.threed.SWTJOGLProcessor")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table MyFormUtil is declared before the requires
MyFormUtil.__index = MyFormUtil
MyFormUtil.className = "MyFormUtil"
MyFormUtil.javaClassName = "org.allbinary.game.displayable.canvas.MyFormUtil"

function MyFormUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.popupMenuRectangle = RectangleFactory.SINGLETON
end

function MyFormUtil._jinit(self)
    MyFormUtil._init_fields(self)
    return self
end

function MyFormUtil.new()
    return MyFormUtil._jinit(setmetatable({}, MyFormUtil))
end


function MyFormUtil.getInstance()
        return MyFormUtil.instance_f
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

MyFormUtil.instance_f = MyFormUtil.new()

return MyFormUtil

