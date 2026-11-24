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
-- package org.allbinary.graphics.canvas.transition.progress

local ProgressCanvasFactory = {}
package.loaded["org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory"] = ProgressCanvasFactory

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

local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local NullPaintable = java_lazy("org.allbinary.graphics.paint.NullPaintable")
local PaintableInterface = java_lazy("org.allbinary.graphics.paint.PaintableInterface")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")

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

-- class table ProgressCanvasFactory is declared before the requires
ProgressCanvasFactory.__index = ProgressCanvasFactory
ProgressCanvasFactory.className = "ProgressCanvasFactory"
ProgressCanvasFactory.javaClassName = "org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory"

function ProgressCanvasFactory._jinit(self)
    return self
end

function ProgressCanvasFactory.new()
    return ProgressCanvasFactory._jinit(setmetatable({}, ProgressCanvasFactory))
end


function ProgressCanvasFactory.getInstance()
        if ProgressCanvasFactory.PROGRESS_FORM_SCREEN == NullUtil.getInstance().NULL_OBJECT then
            ProgressCanvasFactory.PROGRESS_FORM_SCREEN = ProgressCanvas.new(StringUtil.getInstance().EMPTY_STRING, BasicColorFactory.getInstance().BLACK, BasicColorFactory.getInstance().WHITE)
        end
        return ProgressCanvasFactory.PROGRESS_FORM_SCREEN
end


function ProgressCanvasFactory.getLazyInstance()
        return NullPaintable.getInstance()
end

ProgressCanvasFactory.PROGRESS_FORM_SCREEN = NullUtil.getInstance().NULL_OBJECT

return ProgressCanvasFactory

