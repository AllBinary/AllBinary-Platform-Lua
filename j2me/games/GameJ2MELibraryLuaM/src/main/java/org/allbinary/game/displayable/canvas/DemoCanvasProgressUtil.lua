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

local DemoCanvasProgressUtil = {}
package.loaded["org.allbinary.game.displayable.canvas.DemoCanvasProgressUtil"] = DemoCanvasProgressUtil

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

local ProgressCanvas = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvas")
local ProgressCanvasFactory = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local PaintableComposite = java_lazy("org.allbinary.graphics.paint.PaintableComposite")
local PaintableInterface = java_lazy("org.allbinary.graphics.paint.PaintableInterface")
local DemoCanvas = java_lazy("org.allbinary.game.displayable.canvas.DemoCanvas")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table DemoCanvasProgressUtil is declared before the requires
DemoCanvasProgressUtil.__index = DemoCanvasProgressUtil
DemoCanvasProgressUtil.className = "DemoCanvasProgressUtil"
DemoCanvasProgressUtil.javaClassName = "org.allbinary.game.displayable.canvas.DemoCanvasProgressUtil"

function DemoCanvasProgressUtil._jinit(self)
    return self
end

function DemoCanvasProgressUtil.new()
    return DemoCanvasProgressUtil._jinit(setmetatable({}, DemoCanvasProgressUtil))
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

