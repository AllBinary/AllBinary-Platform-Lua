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
-- package org.allbinary.media.image

local ImageProcessorInput = {}
package.loaded["org.allbinary.media.image.ImageProcessorInput"] = ImageProcessorInput

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
local File = java_lazy("java.io.File")

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

-- class table ImageProcessorInput is declared before the requires
ImageProcessorInput.__index = ImageProcessorInput
ImageProcessorInput.className = "ImageProcessorInput"
ImageProcessorInput.javaClassName = "org.allbinary.media.image.ImageProcessorInput"

function ImageProcessorInput:_init_fields()
    if self.bufferedImageArray == nil then self.bufferedImageArray = nil end
    if self.files == nil then self.files = nil end
end


function ImageProcessorInput._jinit(self, files, bufferedImageArray)
    ImageProcessorInput._init_fields(self)
        -- super(...) made self above
        self.bufferedImageArray = bufferedImageArray
        self.files = files
    return self
end

function ImageProcessorInput.new(...)
    local self = setmetatable({}, ImageProcessorInput)
    ImageProcessorInput._jinit(self, ...)
    return self
end


function ImageProcessorInput:getBufferedImageArray()
        return self.bufferedImageArray
end


function ImageProcessorInput:getFiles()
        return self.files
end

return ImageProcessorInput

