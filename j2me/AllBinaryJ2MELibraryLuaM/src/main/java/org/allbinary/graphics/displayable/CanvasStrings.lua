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

local CanvasStrings = {}
package.loaded["org.allbinary.graphics.displayable.CanvasStrings"] = CanvasStrings

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListUtil = java_lazy("org.allbinary.util.BasicArrayListUtil")

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

-- class table CanvasStrings is declared before the requires
CanvasStrings.__index = CanvasStrings
CanvasStrings.className = "CanvasStrings"
CanvasStrings.javaClassName = "org.allbinary.graphics.displayable.CanvasStrings"

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

function CanvasStrings._jinit(self)
    CanvasStrings._init_fields(self)
    return self
end

function CanvasStrings.new()
    return CanvasStrings._jinit(setmetatable({}, CanvasStrings))
end


function CanvasStrings.getInstance()
        return CanvasStrings.instance_f
end

CanvasStrings.instance_f = CanvasStrings.new()

return CanvasStrings

