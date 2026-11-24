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
-- package org.allbinary.logic.visual.media

local MediaDataFactory = {}
package.loaded["org.allbinary.logic.visual.media.MediaDataFactory"] = MediaDataFactory

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

local MediaData = java_lazy("org.allbinary.logic.visual.media.MediaData")

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

-- class table MediaDataFactory is declared before the requires
MediaDataFactory.__index = MediaDataFactory
MediaDataFactory.className = "MediaDataFactory"
MediaDataFactory.javaClassName = "org.allbinary.logic.visual.media.MediaDataFactory"

function MediaDataFactory:_init_fields()
    self.AVI = MediaData.new("avi")
    self.BMP = MediaData.new("bmp")
    self.CEL = MediaData.new("cel")
    self.FITS = MediaData.new("fits")
    self.FLI = MediaData.new("fli")
    self.GBR = MediaData.new("gbr")
    self.GIF = MediaData.new("gif")
    self.GIH = MediaData.new("gih")
    self.JPG = MediaData.new("jpg")
    self.PIX = MediaData.new("pix")
    self.PNG = MediaData.new("png")
    self.PNM = MediaData.new("pnm")
    self.PSD = MediaData.new("psd")
    self.PSP = MediaData.new("psp")
    self.PS = MediaData.new("ps")
    self.SGI = MediaData.new("SGI")
    self.SWF = MediaData.new("swf")
    self.TGA = MediaData.new("tga")
    self.TIFF = MediaData.new("tiff")
    self.WMF = MediaData.new("wmf")
end

function MediaDataFactory._jinit(self)
    MediaDataFactory._init_fields(self)
    return self
end

function MediaDataFactory.new()
    return MediaDataFactory._jinit(setmetatable({}, MediaDataFactory))
end


function MediaDataFactory.getInstance()
        return MediaDataFactory.instance_f
end

MediaDataFactory.instance_f = MediaDataFactory.new()

return MediaDataFactory

