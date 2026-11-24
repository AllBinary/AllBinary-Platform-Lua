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
-- package org.allbinary.media.image

local CanvasTrimUtil = {}
package.loaded["org.allbinary.media.image.CanvasTrimUtil"] = CanvasTrimUtil

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

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local IOException = require("java.io.IOException")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local ImageProcessedVisitor = java_lazy("org.allbinary.media.image.ImageProcessedVisitor")
local ImageProcessorInput = java_lazy("org.allbinary.media.image.ImageProcessorInput")

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

-- class table CanvasTrimUtil is declared before the requires
CanvasTrimUtil.__index = CanvasTrimUtil
CanvasTrimUtil.className = "CanvasTrimUtil"
CanvasTrimUtil.javaClassName = "org.allbinary.media.image.CanvasTrimUtil"

function CanvasTrimUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.stringUtil = StringUtil.getInstance()
end

function CanvasTrimUtil._jinit(self)
    CanvasTrimUtil._init_fields(self)
    return self
end

function CanvasTrimUtil.new()
    return CanvasTrimUtil._jinit(setmetatable({}, CanvasTrimUtil))
end


function CanvasTrimUtil.getInstance()
        return CanvasTrimUtil.instance_f
end


-- throws IOException
function CanvasTrimUtil:process(imageProcessorInput, cutCanvasFromLeftReduction, cutCanvasFromTopReduction, cutCanvasFromRightReduction, cutCanvasFromBottomReduction, visitor)
        local bufferedImageArray = imageProcessorInput:getBufferedImageArray()
        local subBufferedImageArray = java_new_array(nil, (bufferedImageArray.n or #bufferedImageArray))
        local size = (bufferedImageArray.n or #bufferedImageArray)
        local bufferedImage = nil
        for index = 0, size - 1 do
            bufferedImage = bufferedImageArray[index + 1]
            subBufferedImageArray[index + 1] = bufferedImage:getSubimage(cutCanvasFromLeftReduction, cutCanvasFromTopReduction, bufferedImage:getWidth() - cutCanvasFromLeftReduction - cutCanvasFromRightReduction, bufferedImage:getHeight() - cutCanvasFromTopReduction - cutCanvasFromBottomReduction)
            visitor:visit(subBufferedImageArray[index + 1], self.stringUtil.EMPTY_STRING, index)
        end
end

CanvasTrimUtil.instance_f = CanvasTrimUtil.new()

return CanvasTrimUtil

