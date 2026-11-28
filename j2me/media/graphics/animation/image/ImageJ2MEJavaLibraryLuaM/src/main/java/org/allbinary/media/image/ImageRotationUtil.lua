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

local ImageRotationUtil = {}
package.loaded["org.allbinary.media.image.ImageRotationUtil"] = ImageRotationUtil

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

local Image = java_lazy("javax.microedition.lcdui.Image")
local Anchor = java_lazy("org.allbinary.graphics.Anchor")

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

-- class table ImageRotationUtil is declared before the requires
ImageRotationUtil.__index = ImageRotationUtil
ImageRotationUtil.className = "ImageRotationUtil"
ImageRotationUtil.javaClassName = "org.allbinary.media.image.ImageRotationUtil"

function ImageRotationUtil:_init_fields()
    self.anchor = Anchor.TOP_LEFT
end


function ImageRotationUtil.getInstance()
        return ImageRotationUtil.instance_f
end


function ImageRotationUtil._jinit(self)
    ImageRotationUtil._init_fields(self)
    return self
end

function ImageRotationUtil.new(...)
    local self = setmetatable({}, ImageRotationUtil)
    ImageRotationUtil._jinit(self, ...)
    return self
end


-- throws Exception
function ImageRotationUtil:createRotatedImage(originalImage, rotationInDegrees)
        return originalImage
end

ImageRotationUtil.instance_f = ImageRotationUtil.new()

return ImageRotationUtil

