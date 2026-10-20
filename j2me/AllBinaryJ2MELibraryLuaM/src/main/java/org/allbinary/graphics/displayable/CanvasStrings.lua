-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.graphics.displayable

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CanvasStrings = {}
CanvasStrings.__index = CanvasStrings
CanvasStrings.className = "CanvasStrings"

function CanvasStrings:_init_fields()
    self.CONSTRUCTOR = "MyCanvas::MyCanvas"
    self.PAUSE = "MyCanvas::pause"
    self.UN_PAUSE = "MyCanvas::unPause"
    self.SET_FULL_SCREEN_MODE = "setFullScreenMode"
    self.SIZE_CHANGED = "sizeChanged"
    self.SCALED_IMAGES = "scaledImages"
    self.PAINT = "paint"
    self.ON_DISPLAY_CHANGE_EVENT = "onDisplayChangeEvent"
    self.UPDATE_MEASUREMENT = "updateMeasurement"
    self.FD_WIDTH = " font/display width: "
    self.FD_HEIGHT = " font/display height: "
    self.EMPTY_CHILD_NAME_LIST = BasicArrayListUtil.getInstance():getImmutableInstance()
    self.ABOUT = "About"
    self.OPTIONS = "Options"
    self.FONT_ATLAS = "/font.png"
    self.OBJ_MODEL = "_obj"
    self.MD2_MODEL = "_md2"
    self._PNG = ".png"
end

function CanvasStrings.new()
    local self = setmetatable({}, CanvasStrings)
    self:_init_fields()
    return self
end


function CanvasStrings.getInstance()
        return CanvasStrings.instance
end

CanvasStrings.instance = CanvasStrings.new()

return CanvasStrings

